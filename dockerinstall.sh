#! /bin/bash

#  apt-get update ; touch docker-kurulum.sh;chmod u+x docker-kurulum.sh;nano docker-kurulum.sh
# ./docker-kurulum.sh
echo "======================================================"
echo "                   Yükleme Başladı                       "
echo "====================================================="

apt-get update 
apt-get -y install curl
curl -fsSL get.docker.com -o get-docker.sh &&
sh get-docker.sh&&
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
mv /tmp/docker-machine /usr/local/bin/docker-machine &&
chmod +x /usr/local/bin/docker-machine &&
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
chmod +x /usr/local/bin/docker-compose &&
docker volume create portainer_data  
docker run -d  -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce





echo "======================================================="
echo "                 Yükleme Bitti                         "
echo "======================================================"
