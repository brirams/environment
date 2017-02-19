# bramos' aliases
alias ls='ls --color'
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

alias guns='curl'

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

alias gr='/usr/local/bin/g'
alias sbtopts='/usr/local/etc/sbtopts'
# stop pressing bc!
alias bc="cowsay STOP THIS MOTHERFUCKER!"
alias egrep="egrep --color"
alias ertags="rm -f /Users/bramos/.emacs.d/tags/expedite-rails && \
  /usr/local/bin/ctags -e -a -h [\".rb\"] -f /Users/bramos/.emacs.d/tags/expedite-rails -R \
  /Users/bramos/workspace/expedite-rails/app/ \
  /Users/bramos/workspace/expedite-rails/test/ \
  /Users/bramos/workspace/expedite-rails/lib/ \
  /Users/bramos/workspace/expedite-rails/config"
alias estags="rm -f /Users/bramos/.emacs.d/tags/expedite-scala && \
  /usr/local/bin/ctags -e -a -h [\".scala\"] -f \
  /Users/bramos/.emacs.d/tags/expedite-scala \
  --exclude=/Users/bramos/workspace/expedite-scala/target \
  --exclude=/Users/bramos/workspace/expedite-scala/database-driver/target \
  --exclude=/Users/bramos/workspace/expedite-scala/database-models/target \
  --exclude=/Users/bramos/workspace/expedite-scala/expedite-analytics/target \
  --exclude=/Users/bramos/workspace/expedite-scala/expedite-platform/target \
  --exclude=/Users/bramos/workspace/expedite-scala/expedite-util/target \
  --exclude=/Users/bramos/workspace/expedite-scala/finicity-client/target \
  --exclude=/Users/bramos/workspace/expedite-scala/graph-client/target \
  --exclude=/Users/bramos/workspace/expedite-scala/lendingqb-client/target \
  --exclude=/Users/bramos/workspace/expedite-scala/mrroboto/target \
  --exclude=/Users/bramos/workspace/expedite-scala/platform-integration-test-suite/target \
  --exclude=/Users/bramos/workspace/expedite-scala/project \
  --exclude=/Users/bramos/workspace/expedite-scala/log/ \
  -R /Users/bramos/workspace/expedite-scala/"

alias nwipe="/Users/bramos/bin/expedite-scala/neo_wipe.sh"
alias zstart="zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties"
alias kstart="kafka-server-start /usr/local/etc/kafka/server.properties"

# tagging a java dir:
#  /usr/local/bin/ctags -e -R --language-force=java -f ~/.emacs.d/tags/expedite-salesforce
# unjar'ing a whole jar:
# javap -classpath expedite-salesforce-client-0.0.1.jar \
# $(jar -tf expedite-salesforce-client-0.0.1.jar | grep "class$" | sed s/\.class$//) | \
# grep -iv "Compiled from" > ExpediteSalesforceClient.java

alias platc='cd ~/workspace/expedite-scala &&  (source ~/.secrets-platform.env && sbt expeditePlatform/console)'

alias analyticsdb='pgcli --user bramos --host db-analytics.expeditelabs.com -d analytics'
alias lint="cd ~/workspace/marketing-site && ./node_modules/.bin/eslint src --ignore-pattern '*.spec.js'"
alias pushit="g push origin head"
