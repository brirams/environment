# bramos' aliases
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

#alias bctags="cd ~/workspace/source/birdcage && \
#   ctags -e -a -h [\".scala\"] -f ~/.emacs.d/tags/birdcage -R \
#   gizmoduck \
#   servo \
#   finagle \
#   gizmoduck-thrift \
#   && cd -
# "
# alias rmtags="rm -rf ~/.emacs.d/tags/birdcage"
