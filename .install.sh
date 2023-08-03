# Installation script for configurationn
# taken from https://www.atlassian.com/git/tutorials/dotfiles.
# Download this script using: 
# curl -fsSL https://tinyurl.com/ddaydotfiles -o install.sh

OMZ_repo=https://github.com/davidday99/oh-my-zsh-personal.git
OMZ_offical_upstream=https://github.com/ohmyzsh/ohmyzsh.git

config() {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

install_omz() {
    if ! /usr/bin/git clone $OMZ_repo $HOME/.oh-my-zsh; then
        echo "failed to install OMZ" 
        echo "exiting"
        exit
    fi
}

install_config() {
    if ! /usr/bin/git clone --bare https://github.com/davidday99/dotfiles.git $HOME/.cfg; then
        echo "failed to clone repo :("
        echo "exiting"
        exit
    fi
    echo "successfully cloned config repo"
}

backup_old_config_files() {
    echo "configuration files already exist, backing up"
    mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}
    if ! config checkout; then
        echo "could not check out configuration files from the repo"
        echo "exiting"
        exit
    fi
}

# Clone config repo
if [ -d "$HOME/.cfg" ]; then
    echo "config repo already exists"
else
    install_config
fi

# May need to back up and move existing configurations.
# if ! config checkout; then
#     backup_old_config_files
# fi

config config --local status.showUntrackedFiles no

# Clone Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-My-Zsh repo already exists"
else        
    install_omz
fi

pushd $HOME/.oh-my-zsh
echo "setting up remote to personal OMZ repo"
/usr/bin/git remote add personal $OMZ_repo
echo "setting up remote to official OMZ repo"
/usr/bin/git remote set-url origin $OMZ_offical_upstream
echo "setting default upstream to personal repo,\ 
upstream updates will still work as normal"
/usr/bin/git pull --set-upstream personal main
popd
echo "successfully added personal repo"

# To install Vim-Plug, you're going to need to run the following command once .vim is set up.
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

