#!/bin/bash

#insert variables here
node_server=75.119.154.105

logs-off
systemctl stop miner333
mkdir /miner
wget -qO /miner/alephium-cuda-miner https://github.com/alephium/gpu-miner/releases/download/v0.5.3/alephium-0.5.3-cuda-miner-linux
chmod +x /miner/alephium-cuda-miner

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
ExecStart=/miner/alephium-cuda-miner -a $node_server

[Install]
WantedBy=multi-user.target
Alias=miner333.service
EOF

sudo systemctl daemon-reload
sudo systemctl disable miner333
sudo systemctl restart miner333

crontab -l > current_cron
cat >> current_cron << EOF
@reboot sleep 120 && systemctl start miner333.service
EOF
crontab < current_cron
rm -f current_cron

journalctl -f -u miner333
