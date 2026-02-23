#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -e ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    cp ~/.bashrc ~/.bashrc.bak
    echo "Backed up ~/.bashrc to ~/.bashrc.bak"
elif [ -L ~/.bashrc ]; then
    echo "~/.bashrc is already a symlink, removing it"
fi

rm -f ~/.bashrc
ln -s "$SCRIPT_DIR/.bashrc" ~/.bashrc
echo "Symlinked ~/.bashrc -> $SCRIPT_DIR/.bashrc"
source ~/.bashrc
