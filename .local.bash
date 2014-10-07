# there can be only one
set -o emacs
export EDITOR=emacs

# the colors, duke!
# colors: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
export PS1='\[\033[44;1m\]\h `pwd`\[\033[0m\]$(__git_ps1 " \[\033[1;32m\](%s)\[\033[0m\]")\n\$ '
# Wanna see that working dir in the terminal title
export PROMPT_COMMAND='echo -ne "\\033]0;${PWD/#$HOME/~}\\007"'

alias ll='ls -ltr'
alias l.='ls -a | egrep "^\."'
alias back='cd $OLDPWD'
# executes last command or regex of last command
alias r='fc -s'

alias pcsv='column -s, -t <'

# print file sizes in human readable format
alias duf='du -sk * | sort -n -r | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
# lemme see dem ports
alias ports='netstat -a'
# find file
alias ff="find . -type f -name"
alias gf='~/bin/grepf.sh'

### git stuff ###
# stop forgetting the damn command
alias gcor='~/bin/gcor.sh'
alias g='git'
alias gsha="git rev-parse HEAD"
# git config --global alias.a add
# git config --global alias.d diff
# git config --global alias.s status
# git config --global alias.c commit
# git config --global alias.l log
# git config --global alias.b branch
# git config --global alias.co checkout

# branch completion
complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git

# secret sauce
[[ -s ${HOME}/.company.local.bash ]] && source ${HOME}/.company.local.bash
