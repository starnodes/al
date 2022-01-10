#!/bin/bash

sudo tee /home/user/xinit.user.sh > /dev/null <<EOF
#!/usr/bin/env bash
# This script is run in terminal after X server start
# uncomment the following line if you want to see miner log after start
#tail -f /run/hive/miner.1
#systemctl start miner333
EOF

systemctl stop miner333
