## Dot Files
Configuration files for i3, vim, zsh, etc.
Taken from https://www.atlassian.com/git/tutorials/dotfiles.

## Installation
1. Clone into your home directory.
```
git clone --bare <git-repo-url> $HOME/.cfg
```
2. Define the following alias in current shell scope.
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
3. Check out the content.
```
config checkout
```
4. Hide untracked files.
```
config config --local status.showUntrackedFiles no
```

Done!
