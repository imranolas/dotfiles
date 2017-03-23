#!/bin/sh

if test ! $(which node)
then
  echo "  Installing node for you."
  brew install node yarn > /tmp/node-install.log
fi

echo "  Installing node packages."
npm install -g react-native-cli
