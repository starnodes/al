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


#transfer all ulocked coins
curl -X 'POST' \
  'http://'$server'/wallets/'$wallet_name'/sweep-all-addresses' \
  -H 'accept: application/json' \
  -H 'X-API-KEY: '$api_key'' \
  -H 'Content-Type: application/json' \
  -d '{
  "toAddress": "'$address_for_sending'"
    }'

date >> /root/check_transfer.log
