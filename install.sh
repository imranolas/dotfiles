#!/usr/bin/env bash
# Bootstrap a Mac from these dotfiles. Safe to re-run.
#   git clone https://github.com/imranolas/dotfiles ~/.dotfiles && ~/.dotfiles/install.sh
#   Add --macos to also apply macOS defaults (macos.sh).
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
step() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }

if [[ "$DOTFILES" != "$HOME/.dotfiles" ]]; then
  echo "Expected the repo at ~/.dotfiles (found $DOTFILES). rcm is configured for that path." >&2
  exit 1
fi

step "Xcode Command Line Tools"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Finish the Command Line Tools installer, then re-run this script."
  exit 1
fi

step "Homebrew"
if ! command -v brew >/dev/null 2>&1 && [[ ! -x /opt/homebrew/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
grep -qs 'brew shellenv' "$HOME/.zprofile" || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"

step "brew bundle"
brew bundle --file="$DOTFILES/Brewfile"

step "Linking dotfiles (rcm)"
RCRC="$DOTFILES/rcrc" rcup   # prompts before overwriting; also runs hooks/post-up (fisher)

step "Runtimes (mise)"
mise install --yes

step "Default shell -> fish"
FISH="$(brew --prefix)/bin/fish"
grep -qx "$FISH" /etc/shells || echo "$FISH" | sudo tee -a /etc/shells >/dev/null
[[ "$(dscl . -read "/Users/$USER" UserShell | awk '{print $2}')" == "$FISH" ]] || chsh -s "$FISH"

if [[ "${1:-}" == "--macos" ]]; then
  step "macOS defaults"
  "$DOTFILES/macos.sh"
fi

step "Done"
cat <<'MSG'
Remaining manual steps:
  - gh auth login
  - 1Password: Settings > Developer > enable the SSH agent, then set up commit signing
  - atuin login (optional, to sync history)
  - Open a new Ghostty window to start using fish
MSG
