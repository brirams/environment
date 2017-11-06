# bramos' aliases
alias ls='ls --color'
alias ll='ls -ltr'
alias l.='ls -a | egrep "^\."'
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
alias gcom="git checkout master"
alias gmm="git merge master"
alias gdm='git diff master'
alias gcl='git clean -f'
alias gunwip='git reset --soft HEAD~1 && git reset HEAD .'
alias gwip='git commit -am "wip"'
alias gpo="g push origin head"
alias gla='git log --format="%C(yellow)%h %<|(30)%Cgreen%an%x09%Creset%s"'

# stop pressing bc!
alias bc="cowsay STOP THIS MOTHERFUCKER!"
alias egrep="egrep --color"

# tagging a java dir:
#  /usr/local/bin/ctags -e -R --language-force=java -f ~/.emacs.d/tags/expedite-salesforce
# unjar'ing a whole jar:
# javap -classpath expedite-salesforce-client-0.0.1.jar \
# $(jar -tf expedite-salesforce-client-0.0.1.jar | grep "class$" | sed s/\.class$//) | \
# grep -iv "Compiled from" > ExpediteSalesforceClient.java

alias emacs='emacs -nw'
alias es="cowsay \"you don't work there anymore\""

# Motherfucking bazel wants this set.
alias fubazel='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/'
