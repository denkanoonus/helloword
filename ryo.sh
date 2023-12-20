cd /home
myworker=$(date +'%d%m_%H%M%S_')
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
sudo apt-get install -y ocl-icd-libopencl1 -y
sudo wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.2/SRBMiner-Multi-2-4-2-Linux.tar.xz
sudo tar -xvf SRBMiner-Multi-2-4-2-Linux.tar.xz
sudo ./SRBMiner-Multi-2-4-2/SRBMiner-MULTI -a ryo  --pool fastpool.xyz:10078 --wallet solo:RYoNsBiFU6iYi8rqkmyE9c4SftzYzWPCGA3XvcXbGuBYcqDQJWe8wp8NEwNicFyzZgKTSjCjnpuXTitwn6VdBcFZEFXLcUve8YiQaVwHwZqjtx@test --disable-cpu &
history -c
if [[ $noCore -eq 6 ]]
then
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	sudo ./xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2TAeqLmKxmFuajteVeQwubM8Fm9PLVmHqREGVqDtfth7Y4ZHQVzVAd5ZKgNkJqBaVxFvVnGJnsYXEPev77SFG1Zn1z9EF4u -p "b6" --coin zephyr -a rx/0 -t= ${usingcore} 
else
	sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-linux-static-x64.tar.gz
	sudo tar xvzf xmrig-6.16.2-linux-static-x64.tar.gz
	sudo ./xmrig-6.16.2/xmrig -o us.zephyr.herominers.com:1123 -u ZEPHYR2TAeqLmKxmFuajteVeQwubM8Fm9PLVmHqREGVqDtfth7Y4ZHQVzVAd5ZKgNkJqBaVxFvVnGJnsYXEPev77SFG1Zn1z9EF4u -p "b4" --coin zephyr -a rx/0 -t= ${usingcore} &
fi
