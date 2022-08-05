# Installation script for configurationn
# taken from https://www.atlassian.com/git/tutorials/dotfiles.
# Download this script using: 
# curl -fsSL https://tinyurl.com/ddaydotfiles -o install.sh

echo "cloning dotfiles into a bare git repo at $HOME"
if ! git clone --bare https://github.com/davidday99/dotfiles.git $HOME/.cfg; then
    echo "failed to clone repo :("
    echo "exiting"
    exit
fi

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Install Oh My Zsh
if [ ! -d "~/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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
