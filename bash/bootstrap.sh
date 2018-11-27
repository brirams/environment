#!/bin/bash

ln -s ~/src/environment/bash/.bash_profile ~/.bash_profile
ln -s ~/src/environment/bash/.bash_aliases ~/.bash_aliases
ln -s ~/src/environment/bash/.bashrc ~/.bashrc

cp $(brew --prefix git)/etc/bash_completion.d/git-prompt.sh ~/.git-prompt.sh
cp $(brew --prefix git)/etc/bash_completion.d/git-completion.bash ~/.git-completion.bash
