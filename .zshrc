# Use powerline
USE_POWERLINE="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Start ssh agent if it isn't already
if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)" &> /dev/null
    ssh-add /home/david/.ssh/github_key &> /dev/null
fi

# And then kill it when the terminal is closed
trap 'kill "$SSH_AGENT_PID"' INT TERM QUIT EXIT

# Swap caps-lock and esc for easier vim-use
setxkbmap -option caps:swapescape
# And enable vim-bindings in zsh
bindkey -v

# Useful aliases
alias config='/usr/bin/git --git-dir=/home/david/.cfg/ --work-tree=/home/david'
alias vi=vim
alias vimconfig='vim ~/.vimrc'
alias zshconfig='vim ~/.zshrc'

