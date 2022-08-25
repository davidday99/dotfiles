# Installation script for configurationn
# taken from https://www.atlassian.com/git/tutorials/dotfiles.
# Download this script using: 
# curl -fsSL https://tinyurl.com/ddaydotfiles -o install.sh

OMZ_repo=https://github.com/davidday99/oh-my-zsh-personal.git

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

function install_omz {
    if ! /usr/bin/git clone $HOME $OMZ_repo; then
        echo "failed to install oh-my-zsh :(" 
        echo "exiting"
        exit
    fi
    mv $HOME/.oh-my-zsh-personal $HOME/.oh-my-zsh
    pushd $HOME/.oh-my-zsh
    /usr/bin/git remote add personal $OMZ_repo
}

echo "cloning dotfiles into a bare git repo at $HOME"
if ! /usr/bin/git clone --bare https://github.com/davidday99/dotfiles.git $HOME/.cfg; then
    echo "failed to clone repo :("
    echo "exiting"
    exit
fi

# May need to back up and move existing configurations.
if ! config checkout; then
    echo "configuration files already exist, backing up"
    mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}

    if ! config checkout; then
        echo "could not check out configuration files from the repo"
        echo "exiting"
        exit
    fi
fi

config config --local status.showUntrackedFiles no

# Install Oh My Zsh
if [ ! -d "~/.oh-my-zsh" ]; then
    install_omz
fi


