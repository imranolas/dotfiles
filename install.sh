#!/usr/bin/env bash

install_or_update_brew() {
  if command -v brew 2>/dev/null; then
    echo "Brew already installed. Continuing..."
    brew update
  else
    echo "Installing Brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/imransulemanji/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
}

install_or_update_brew
brew tap thoughtbot/formulae
brew install rcm

echo "Installing dotfiles"
rcup

