#!/bin/sh

if [ "$(id -u)" -ne 0 ]; then
  echo 'This script must be run by root' >&2
  exit 1
fi

. /etc/os-release

if [ $VERSION != "16.04.3 LTS (Xenial Xerus)" ]; then
  echo 'This script only has support for Ubuntu 16 LTS' >&2
  exit 1
fi

LOGGED_USER=`who | awk '{ print $1 }'`

echo 'Adding and updating repositories...'
add-apt-repository ppa:neovim-ppa/stable -y >/dev/null 2>&1
apt-add-repository ppa:fish-shell/release-2 -y >/dev/null 2>&1
apt-get update -qq >/dev/null

echo 'Installing compiling tools...'
apt-get install -y -qq >/dev/null git curl automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev build-essential libevent-dev

echo 'Installing Docker...'
sh ./install-docker-tools.sh >/dev/null
usermod -aG docker $LOGGED_USER

echo 'Installing fish'
apt-get -qq -y install fish >/dev/null

echo 'Installing tmux 2.6'
git clone -b 2.6 --single-branch https://github.com/tmux/tmux.git 2>/dev/null
cd tmux
sh autogen.sh >/dev/null 2>&1
sh configure >/dev/null 2>&1
make >/dev/null 2>&1
make install >/dev/null 2>&1
cd ..
rm -rf tmux

echo 'Installing neovim'
apt-get -qq -y install neovim >/dev/null

echo 'Installing asdf'
su -c 'sh ./install-asdf.sh' $LOGGED_USER
