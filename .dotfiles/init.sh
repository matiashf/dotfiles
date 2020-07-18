#!/bin/sh

set -eux

cd "$(dirname "$0")"

# Install ubuntu packages
(cat packages.txt | xargs dpkg -s > /dev/null) \
  || (cat packages.txt | xargs sudo apt install -y)

# Install oh my zsh and set shell to zsh
[ "$SHELL" = /usr/bin/zsh -a -e ~/.oh-my-zsh ] \
  || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

[ -d ~/.pyenv ] || git clone https://github.com/pyenv/pyenv.git ~/.pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

PYTHON_VERSION="$(ls ~/.pyenv/plugins/python-build/share/python-build | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | sort -n | tail -n 1)"
pyenv install --skip-existing "$PYTHON_VERSION"
pyenv global "$PYTHON_VERSION"

pip install pipenv

# Install pulumi
which pulumi || (curl -fsSL https://get.pulumi.com | sh)
