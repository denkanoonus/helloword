cd /usr/local/bin
sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
sudo tar -xvf cpuminer-opt-linux.tar.gz
sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/cpuminer-sse2 -a yespower  -o stratum+tcps://stratum-eu.rplant.xyz:17079 -u v4nmRyrdyGXF2Wd8wKtoTt9Rpa7YLb8wKx.tes
 \n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
sudo systemctl daemon-reload
sudo systemctl enable xmrig.service
sudo reboot &
