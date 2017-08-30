#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# make sure you source the relevant git script to setup your prompt
brew install git
# git config --global alias.a add \
# git config --global alias.d diff \
# git config --global alias.s status \
# git config --global alias.c commit \
# git config --global alias.l log \
# git config --global alias.b branch \
# git config --global alias.co checkout
# git config --global alias.g grep

brew install emacs --with-cocoa
# remove the old, janky version
sudo rm /usr/bin/emacs
sudo rm -rf /usr/share/emacs

brew install markdown
brew install jenv
brew install scala

brew install tree
brew install kubernetes-cli
# Remove outdated versions from the cellar.
brew cleanup
