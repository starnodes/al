#!/bin/bash

#insert variables here
api_key=
wallet_name=
wallet_pass=
server=127.0.0.1:12973
address_for_sending=
miner_adress1=
miner_adress2=
miner_adress3=
miner_adress4=

#unlock wallet
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/unlock' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "password": "'$wallet_pass'"
}'

#change active adress to 1
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress1'"
}'

#transfer all ulocked coins
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#change active adress to 2
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress2'"
}'

#transfer all ulocked coins
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
<<<<<<< HEAD
    }'
=======
}'

#change active adress to 3
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress3'"
}'

#transfer all ulocked coins
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#change active adress to 4
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/change-active-address' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "address": "'$miner_adress4'"
}'

#transfer all ulocked coins
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
}'

#lock wallet
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/lock' \
  -H 'accept: */*' \
  -H 'X-API-KEY: '$api_key'' \
  -d ''
