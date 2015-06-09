# bramos' .bash_profile. just load the other thing
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
# Initialization for FDK command line tools.Mon Jun  8 16:48:01 2015
FDK_EXE="/Users/bramos/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/bramos/bin/FDK/Tools/osx"
export PATH
export FDK_EXE
