#!/bin/bash -xe
echo "cd /root
rm 10min.sh
wget https://raw.githubusercontent.com/S-Gallagher92/MoneyTree/main/10min.sh
chmod +x 10min.sh
./10min.sh" > /root/repeatableCMD.sh
chmod +x /root/repeatableCMD.sh
crontab -l | { cat; echo "*/15 * * * * /root/repeatableCMD.sh"; } | crontab -

need_docker=1
if [ $need_docker == 1 ]
then
echo "export systemID=$systemID
cd /root
rm AfterSystemRestartScript.sh
wget https://raw.githubusercontent.com/S-Gallagher92/MoneyTree/main/AfterSystemRestartScript.sh
chmod +x AfterSystemRestartScript.sh
./AfterSystemRestartScript.sh" > /root/initializeSystem.sh
chmod +x /root/initializeSystem.sh


apt install net-tools -f

wget http://get.docker.com -O /root/installdocker.sh
chmod +x /root/installdocker.sh
/root/installdocker.sh
mkdir /root/3proxyvol
mkdir /root/3proxyvol/cfg
fi

apt-get update -qq >/dev/null
apt install icewm -y


#crontab -l | { cat; echo "*/10 * * * * /root/repeatableCMD.sh"; } | crontab -
if [ $need_docker == 1 ]
then
crontab -l | { cat; echo "@reboot /root/initializeSystem.sh"; } | crontab -
/root/initializeSystem.sh
fi
