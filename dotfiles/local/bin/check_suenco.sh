#!/bin/bash
# проверить плановые отключения

# д.Северное
curl -s --header "Accept: application/json" \
  "https://gateway.suenco.ru/api/pon/site?guid=67f17d68-0bf8-487c-8134-7c9906c7353f&objNum=72" \
  | python3 -m json.tool --no-ensure-ascii

# с.Лесниково, ДНТ Раздолье
# f2eb3532-0924-4e4b-bf5f-e5504d1ca95d
# bfab3740-0b17-4545-a49d-6e911d41ac16
curl -s --header "Accept: application/json" \
  "https://gateway.suenco.ru/api/pon/site?guid=f2eb3532-0924-4e4b-bf5f-e5504d1ca95d" \
  | python3 -m json.tool --no-ensure-ascii
