#!/bin/bash

#insert variables here
miner_adress1=
miner_adress2=
miner_adress3=
miner_adress4=
api_key=hBvvNNMqmz7kETJfXDkXgmmMkdORFdtOhkKoMMo6ZywVbzRK

sudo apt update
sudo apt install default-jdk -y
systemctl stop alephiumd
rm -f $HOME/.alephium/alephium.jar
sudo mkdir -p $HOME/.alephium
sudo wget -qO $HOME/.alephium/alephium.jar https://github.com/alephium/alephium/releases/download/v1.2.0/alephium-1.2.0.jar

sudo tee /etc/systemd/system/alephiumd.service > /dev/null <<EOF
[Unit]
Description=alephium
[Service]
User=$USER
Type=simple
ExecStart=/usr/bin/java -Xmx1G -jar $HOME/.alephium/alephium.jar -daemon
Restart=always
RestartSec=100
[Install]
WantedBy=multi-user.target
EOF

sudo tee $HOME/.alephium/user.conf > /dev/null <<EOF
alephium.api.api-key = "$api_key"
#dont forget change api key
alephium.mining.api-interface = "0.0.0.0"
alephium.api.network-interface = "0.0.0.0"
alephium.mining.miner-addresses = [
  "$miner_adress1",
  "$miner_adress2",
  "$miner_adress3",
  "$miner_adress4" ]
#dont forget change miner addresses
EOF

sudo systemctl daemon-reload
sudo systemctl enable alephiumd
sudo systemctl restart alephiumd

journalctl -f -u alephiumd
