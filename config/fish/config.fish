# Homebrew (also sets MANPATH etc.)
/opt/homebrew/bin/brew shellenv fish | source

fish_add_path -g ~/bin ~/.local/bin

set -g fish_greeting "🐟"
set -gx EDITOR "zed --wait"
set -gx VISUAL $EDITOR

# pnpm / bun global installs (the runtimes themselves come from mise)
set -gx PNPM_HOME ~/Library/pnpm
set -gx BUN_INSTALL ~/.bun
fish_add_path -g $PNPM_HOME $BUN_INSTALL/bin

if status is-interactive
    mise activate fish | source
    direnv hook fish | source
    zoxide init fish | source
    fzf --fish | source
    atuin init fish --disable-up-arrow | source # after fzf so atuin owns ctrl-r

    # 1Password shell plugins (created by `op plugin init`)
    test -f ~/.config/op/plugins.sh; and source ~/.config/op/plugins.sh

    abbr -a ls eza
    abbr -a ll 'eza -l --git'
    abbr -a la 'eza -la --git'
    abbr -a lg lazygit

    starship init fish | source
    enable_transience
end
