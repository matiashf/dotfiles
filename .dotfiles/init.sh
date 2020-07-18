#!/bin/sh

set -eux

cd "$(dirname "$0")"

# Install ubuntu packages
(cat packages.txt | xargs dpkg -s > /dev/null) \
  || (cat packages | xargs sudo apt install -y)
