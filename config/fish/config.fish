set -U fish_greeting "🐟" 
set PATH ./node_modules/.bin $PATH
set PATH /opt/homebrew/bin $PATH
set PATH ~/bin $PATH

alias vim nvim

direnv hook fish | source

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

set -x YVM_DIR /Users/imransulemanji/.yvm
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish

starship init fish | source
pyenv init - | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
source /Users/imransulemanji/.config/op/plugins.sh

# https://starship.rs/advanced-config/#transientprompt-and-transientrightprompt-in-fish
enable_transience

if status is-interactive
  printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/imransulemanji/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
