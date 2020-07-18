#!/bin/sh

set -eux

cd "$(dirname "$0")"

# Install ubuntu packages
(cat packages.txt | xargs dpkg -s > /dev/null) \
  || (cat packages | xargs sudo apt install -y)

# Install oh my zsh and set shell to zsh
[ "$SHELL" = /usr/bin/zsh -a -e ~/.oh-my-zsh ] \
  || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
