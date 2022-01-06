#!/bin/bash

#insert variables here
node_server=83.220.171.93

systemctl stop miner333
rm -rf /miner
mkdir /miner
wget -qO /miner/miner333 https://github.com/toxi42/Alephium/raw/main/ura/miner333
chmod +x /miner/miner333

sudo tee /etc/systemd/system/miner333.service > /dev/null <<EOF
[Unit]
Description=alephium miner
After=rc-local.service

[Service]
RestartSec=5
Restart=always
#RuntimeMaxSec=3600
WorkingDirectory=/miner
TimeoutSec=180
ExecStart=/miner/miner333 -a $node_server

[Install]
WantedBy=multi-user.target
Alias=miner333.service
EOF

sudo systemctl daemon-reload
sudo systemctl disable miner333
sudo systemctl restart miner333

cp /home/user/xinit.user.sh /home/user/xinit.user.sh.bak
sudo tee /home/user/xinit.user.sh > /dev/null <<EOF
#!/usr/bin/env bash

# This script is run in terminal after X server start

# uncomment the following line if you want to see miner log after start
#tail -f /run/hive/miner.1
systemctl start miner333
EOF
