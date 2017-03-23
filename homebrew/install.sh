#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew tap caskroom/cask
brew install zsh grc coreutils git hub mas thefuck

brew cask install \
  iterm2 google-chrome atom spotify colorsnapper \
  sketch kdiff3 whatsapp 1password

exit 0
