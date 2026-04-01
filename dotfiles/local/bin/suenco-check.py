#!/usr/bin/env python3

import requests
import json
from datetime import datetime
import notify2


def parse_iso_datetime(dt_str):
    """
    Парсит ISO строку с часовым поясом.
    Удаляет часовой пояс для упрощения парсинга.
    """
    dt_str = dt_str.replace('+05:00', '')
    return datetime.fromisoformat(dt_str)


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


def check_and_notify():
    for params in sites:
        try:
            # Выполняем GET-запрос
            response = requests.get(url, headers=headers, params=params)

            # Проверяем статус ответа
            response.raise_for_status()

            # Парсим JSON
            data = response.json()

            # Получаем текущее время
            current_time = datetime.now()

            # Проверяем каждый элемент в JSON
            for item in data:
                # Парсим даты
                beg_notify = parse_iso_datetime(item['begNotify'])
                beg_period = parse_iso_datetime(item['begPeriod'])
                end_period = parse_iso_datetime(item['endPeriod'])

                # Проверяем условие
                if beg_notify <= current_time <= beg_period:
                    # Формируем сообщение
                    summary = item['equipment']
                    message = (f"Плановые отключения по адресу: {', '.join(item['addresses'].split(', ')[3:])}\n"
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
