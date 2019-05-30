set PATH ./node_modules/.bin $PATH

alias vim "nvim"
abbr gst "git status --short"
abbr gc "git commit -v"
abbr gc! "git commit --amend"
abbr glog "git log --graph --topo-order --decorate --oneline --boundary"
abbr gb "git branch"
abbr gco "git checkout"
abbr gp "git push -u origin"
abbr gl "git pull --rebase"
abbr l "ls -la"

direnv hook fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

