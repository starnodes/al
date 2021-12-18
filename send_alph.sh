#!/bin/bash

#введем переменные
api_key=
wallet_name=
wallet_pass=
server=127.0.0.1:12973
address_for_sending=
miner_adress1=
miner_adress2=
miner_adress3=
miner_adress4=

#разлочить кошель
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/unlock' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "password": "'$wallet_pass'"
}'

#сменить активный адрес на 1
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress1'"
}'

#перевести анлокнутые монеты на кошелек
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#сменить активный адрес на 2
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress2'"
}'

#перевести анлокнутые монеты на кошелек
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#сменить активный адрес на 3
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress3'"
}'

#перевести анлокнутые монеты на кошелек
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#сменить активный адрес на 4
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress4'"
}'

#перевести анлокнутые монеты на кошелек
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#залочить кошелек
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/lock' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -d ''