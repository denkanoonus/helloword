cd /usr/local/bin
mwker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H')
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.16.2/xmrig -a ghostrider --url stratum-eu.rplant.xyz:17094 --tls --user MGazqpWAnH9KtXqskjsMcugT5DMjhsncTf.test --pass m=solo \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &
