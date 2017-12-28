#!/bin/sh

if [ "$(id -u)" -eq 0 ]; then
  echo 'This script must NOT be run by root' >&2
  exit 1
fi

git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.4.1 2>/dev/null
echo '\n. ~/.asdf/asdf.sh' >> $HOME/.bashrc
echo '\n. ~/.asdf/completions/asdf.bash' >> $HOME/.bashrc
mkdir -p $HOME/.config/fish/completions
cp $HOME/.asdf/completions/asdf.fish $HOME/.config/fish/completions
echo 'source ~/.asdf/asdf.fish' >> $HOME/.config/fish/config.fish
export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
asdf --version

echo 'Installing ruby'
asdf plugin-add ruby 2>/dev/null
asdf install ruby 2.5.0 >/dev/null 2>&1
asdf global ruby 2.5.0
ruby -v

echo 'Installing nodejs 9.3.0'
asdf plugin-add nodejs 2>/dev/null
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring >/dev/null 2>&1
asdf install nodejs 9.3.0 >/dev/null 2>&1
asdf global nodejs 9.3.0
node -v

echo 'Installing postgres 10.1'
asdf plugin-add postgres 2>/dev/null
asdf install postgres 10.1 >/dev/null 2>&1
asdf global postgres 10.1
pg_ctl start
create user postgres
psql -V
