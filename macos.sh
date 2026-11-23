#!/usr/bin/env bash
# macOS preferences. Run via `install.sh --macos` or directly. Safe to re-run.
set -euo pipefail

# Keyboard: fast key repeat, no press-and-hold accent popup
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g ApplePressAndHoldEnabled -bool false

# Typing: no smart quotes/dashes or auto-correct (they break code snippets)
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: show extensions, path bar, status bar; search current folder
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dock: autohide, no recent apps
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# Screenshots in ~/Screenshots
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"

killall Dock Finder SystemUIServer 2>/dev/null || true
echo "macOS defaults applied (key repeat needs a log out to take effect)."
