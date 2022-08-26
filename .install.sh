# Installation script for configurationn
# taken from https://www.atlassian.com/git/tutorials/dotfiles.
# Download this script using: 
# curl -fsSL https://tinyurl.com/ddaydotfiles -o install.sh

OMZ_repo=https://github.com/davidday99/oh-my-zsh-personal.git

config() {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

install_omz() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh-My-Zsh repo already exists"
    else
        if ! /usr/bin/git clone $OMZ_repo $HOME/.oh-my-zsh; then
            echo "failed to install oh-my-zsh :(" 
            echo "exiting"
            exit
        fi
        pushd $HOME/.oh-my-zsh
        /usr/bin/git remote add personal $OMZ_repo
        popd
    fi
}

if [ -d "$HOME/.cfg" ]; then
    echo "config repo already exists"
else
    if ! /usr/bin/git clone --bare https://github.com/davidday99/dotfiles.git $HOME/.cfg; then
        echo "failed to clone repo :("
        echo "exiting"
        exit
    fi
    echo "successfully cloned config repo"
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
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    install_omz
fi


