#!/bin/sh

if [ "$(id -u)" -eq 0 ]; then
  echo 'This script must NOT be run by root' >&2
  exit 1
fi

profile_ids="$(dconf read "/org/gnome/terminal/legacy/profiles:"/list | tr -d "[]'")"
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula 2>/dev/null
cd gnome-terminal-colors-dracula
bash install.sh -s Dracula -p :$profile_ids --skip-dircolors
cd ..
rm -rf gnome-terminal-colors-dracula

