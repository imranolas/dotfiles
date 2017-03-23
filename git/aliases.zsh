# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gc!='git commit --amend -C HEAD'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias ga='git add'
alias gb='git branch'
alias grb='git rebase'
alias gst='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gdmb='git delete-local-merged' # delete all branches that have been merged to master
