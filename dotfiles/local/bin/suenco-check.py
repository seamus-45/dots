#!/usr/bin/env python3

import requests
import json

from datetime import datetime
from typing import List, Dict, Any

import notify2


# URL с параметрами
url = "https://gateway.suenco.ru/api/pon/site"
sites = [
        # д.Северное
        {"guid": "67f17d68-0bf8-487c-8134-7c9906c7353f", "objNum": "72"},
        # с.Лесниково, ДНТ Раздолье
        {"guid": "bfab3740-0b17-4545-a49d-6e911d41ac16"},
]
# Заголовки
headers = {"Accept": "application/json"}


def parse_iso_datetime(dt_str):
    """
    Парсит ISO строку с часовым поясом.
    Удаляет часовой пояс для упрощения парсинга.
    """
    dt_str = dt_str.replace('+05:00', '')
    return datetime.fromisoformat(dt_str)


def merge_outage_events(events: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """
    Группирует события по одинаковым метаданным (оборудование, адрес, район)
    и возвращает единый список с объединёнными временными рамками.
    """
    if not events:
        return []

    # 1. Группируем события по неизменяемым полям
    groups: Dict[tuple, List[Dict]] = {}
    for evt in events:
        key = (evt['equipment'], evt['addresses'], evt['locality'], evt['planned'])
        groups.setdefault(key, []).append(evt)

    merged: List[Dict[str, Any]] = []

    # 2. Обрабатываем каждую группу отдельно
    for key, group in groups.items():
        # Сортируем по времени начала
        group.sort(key=lambda x: parse_iso_datetime(x['begPeriod']))

        intervals: List[List[datetime]] = []
        for evt in group:
            start = parse_iso_datetime(evt['begPeriod'])
            end = parse_iso_datetime(evt['endPeriod'])
            bn = parse_iso_datetime(evt['begNotify'])

            if not intervals:
                intervals.append([start, end, bn])
            else:
                # Если текущее начало <= последнего конца → интервалы пересекаются или касаются
                if start <= intervals[-1][1]:
                    intervals[-1][1] = max(intervals[-1][1], end)
                else:
                    intervals.append([start, end, bn])

        # 3. Формируем итоговые объекты на основе базовых данных группы
        base = group[0]
        for start, end, bn in intervals:
            new_evt = base.copy()
            new_evt['begPeriod'] = start.isoformat()
            new_evt['endPeriod'] = end.isoformat()
            new_evt['begNotify'] = bn.isoformat()
            merged.append(new_evt)

    return merged


def check_and_notify():
    """
    Отправляет уведомление на рабочий стол о плановых работах
    """
    for params in sites:
        try:
            # Выполняем GET-запрос
            response = requests.get(url, headers=headers, params=params)

            # Проверяем статус ответа
            response.raise_for_status()

            # Парсим JSON
            data = merge_outage_events(response.json())

            # Получаем текущее время
            current_time = datetime.now()

            # Проверяем каждый элемент в JSON
            for evt in data:
                # Парсим даты
                beg_notify = parse_iso_datetime(evt['begNotify'])
                beg_period = parse_iso_datetime(evt['begPeriod'])
                end_period = parse_iso_datetime(evt['endPeriod'])

                # Проверяем условие
                if beg_notify <= current_time <= beg_period:
                    # Формируем сообщение
                    summary = evt['equipment']
                    message = (f"Плановые отключения по адресу: {', '.join(evt['addresses'].split(', ')[3:])}\n"
                               f"Начало: {beg_period.strftime("%Y.%m.%d %H:%M")}\n"
                               f"Конец: {end_period.strftime("%Y.%m.%d %H:%M")}")

                    # Создаем и отправляем уведомление
                    notification = notify2.Notification(summary, message)
                    notification.set_urgency(notify2.URGENCY_CRITICAL)
                    notification.show()

                    # print(f"Отправлено уведомление: {summary}")
                    # print(message)
                    # print("-" * 50)

        except requests.exceptions.RequestException as e:
            print(f"Ошибка при выполнении запроса: {e}")
        except json.JSONDecodeError as e:
            print(f"Ошибка при парсинге JSON: {e}")
        except Exception as e:
            print(f"Ошибка: {e}")


if __name__ == "__main__":
    # Инициализируем notify2
    notify2.init('Отключения электроэнергии')
    check_and_notify()
