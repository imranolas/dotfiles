#!/bin/sh

brew bundle --file=$ZSH/npm/Brewfile
source $(brew --prefix nvm)/nvm.sh

nvm install stable
nvm use default

echo "  Installing node packages."
npm install -g react-native-cli
