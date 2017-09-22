# bramos' .bash_profile. just load the other thing
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/node@6/bin:$PATH"

source ~/workspace/tbn/scripts/bash_profile.sh
