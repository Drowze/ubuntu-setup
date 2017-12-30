#!/bin/sh

apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
echo 'deb https://weechat.org/ubuntu xenial main' >/etc/apt/sources.list.d/weechat.list
echo 'deb-src https://weechat.org/ubuntu xenial main' >>/etc/apt/sources.list.d/weechat.list
apt-get update -qq
apt-get install -qq weechat-curses weechat-plugins

