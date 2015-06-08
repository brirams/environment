# bramos' .bashrc. This is the meat and potatoes.

# Add `~/bin` to the `$PATH`
PREFIX="/usr/local/opt/coreutils/libexec/gnubin:$HOME/bin:/usr/local/bin"
export PATH="$PREFIX:$PATH"

set -o emacs
export EDITOR=emacs

# branch completion
complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git

# the colors, duke!
# colors: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
export PS1='\[\033[44;1m\]`pwd`\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")\n\$ '
# Wanna see that working dir in the terminal title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

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
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi
