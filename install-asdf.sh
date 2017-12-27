#!/bin/sh

if [ "$(id -u)" -eq 0 ]; then
  echo 'This script must NOT be run by root' >&2
  exit 1
fi

echo 'Installing asdf'
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.4.1 2>/dev/null
echo '\n. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
echo '\n. $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc
echo 'source ~/.asdf/asdf.fish' >> $HOME/.config/fish/config.fish
mkdir -p ~/.config/fish/completions
cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

echo 'Installing ruby'
asdf plugin-add ruby 2>/dev/null
asdf install ruby 2.5.0 >/dev/null 2>&1
asdf global ruby 2.5.0

echo 'Installing nodejs 9.3.0'
asdf plugin-add nodejs 2>/dev/null
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring >/dev/null 2>&1
asdf install nodejs 9.3.0 >/dev/null 2>&1
asdf global nodejs 9.3.0

echo 'Installing postgres 10.1'
asdf plugin-add postgres 2>/dev/null
asdf install postgres 10.1 >/dev/null 2>&1
asdf global postgres 10.1
pg_ctl start
create user postgres

