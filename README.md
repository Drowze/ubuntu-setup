# Drowze's Ubuntu setup

_I like automating my stuff, so there you go_

### (Only) supported linux: Ubuntu 16 LTS
This should be updated for Ubuntu 17 LTS when it's released.  
This script also only supports fresh installs. It can (and will) mess with your installation if it is not a fresh one.

### Details
"sudo sh ubuntu-setup.sh" will install:
* docker-ce
* docker-machine
* docker-compose
* fish shell
* tmux (compiled from source; 2.6 as of now - Ubuntu is stuck on 2.1 and there is no good ppa)
* neovim
* asdf version manager

Through asdf-vm, the following will be installed:
* ruby 2.5.0
* nodejs 9.3.0
* postgres 10.1 (user: 'postgres'; no password)

