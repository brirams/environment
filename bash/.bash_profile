# bramos' .bash_profile. just load the other thing
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# Initialization for FDK command line tools.Mon Jun  8 16:48:01 2015
FDK_EXE="/Users/bramos/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/bramos/bin/FDK/Tools/osx"
export PATH
export FDK_EXE

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(jenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

source ~/.profile

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bramos/google-cloud-sdk/path.bash.inc' ]; then source '/Users/bramos/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bramos/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/bramos/google-cloud-sdk/completion.bash.inc'; fi
