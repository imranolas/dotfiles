set ANDROID_HOME $HOME/Library/Android/sdk
set PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $PATH
set PATH $HOME/.fastlane/bin $PATH
set PATH ./node_modules/.bin $PATH
set PATH /Users/imransulemanji/lib/vsts-cli/bin $PATH

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish

status --is-interactive; and source (rbenv init -|psub)
