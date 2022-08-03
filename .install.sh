# Installation script for configurationn
# taken from https://www.atlassian.com/git/tutorials/dotfiles.
# Download this script using: 
# curl -fsSL https://tinyurl.com/ddaydotfiles -o install.sh

git clone --bare git@github.com:davidday99/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
