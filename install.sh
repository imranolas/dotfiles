#!/usr/bin/env bash

install_or_update_brew() {
  if command -v brew 2>/dev/null; then
    echo "Brew already installed. Continuing..."
    brew update
  else
    echo "Installing Brew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_or_update_brew
brew tap thoughtbot/formulae
brew install rcm

echo "Installing dotfiles"
rcup

