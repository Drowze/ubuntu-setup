#!/bin/sh

echo 'Installing Docker...'
apt-get install -y -qq apt-transport-https ca-certificates software-properties-common
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add -qq -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial edge" >/etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -y -qq --no-install-recommends docker-ce

echo 'Installing Docker machine and Docker compose'
curl -sSL https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` -o /usr/local/bin/docker-machine
curl -sSL https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-compose

