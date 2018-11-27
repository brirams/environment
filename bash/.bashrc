# bramos' .bashrc. This is the meat and potatoes.
# Add `~/bin` to the `$PATH`
BIN_PREFIX="/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:/usr/local/bin"
export PATH="$BIN_PREFIX:$PATH"

set -o emacs
export ALTERNATE_EDITOR="emacs -nw"
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -nw"
export GREP_OPTIONS='--color=always'


emojis=(🐶 🐺 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐧 🐍 🐢 🐙 🐠 🐳 🐬 🐥 🔥 🐘 💯)

# the colors, duke!
# colors: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
export PS1='\[\033[44;1m\]`pwd`\[\033[0m\]$(__git_ps1 " \[\033[1;33m\](%s)\[\033[0m\]")\n`echo ${emojis[$RANDOM % 25]}` \$ '
# Wanna see that working dir in the terminal title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

# Auto-combine histories from across shells, appending to the history
# file at each prompt. Keep 10k lines per shell and 100k lines
# overall.
export HISTSIZE=10000
export HISTFILESIZE=100000
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"

IS_MACOS=false
unamestr=$(uname)
if [[ "$unamestr" == 'Darwin' ]]; then
    IS_MACOS=true
fi

# Disable per-bash session history.
if $IS_MACOS; then
    export SHELL_SESSION_HISTORY=0
fi

######################
## Load the aliases ##
######################
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

##########################
## Load git complesions ##
##########################
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash

    __git_complete g __git_main
# you might need these one day
#    __git_complete gc _git_checkout
#    __git_complete gm __git_merge
#    __git_complete gp _git_pull
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi



# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vitess specific go path shit. we might need to rejigger this for multiple go projects
export GOPATH=$HOME/src/ts-vitess
export PATH=$PATH:$GOPATH/bin
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOROOT/bin
