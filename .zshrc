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

if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)" &> /dev/null
    ssh-add /home/david/.ssh/github_key &> /dev/null
fi

setxkbmap -option caps:swapescape

bindkey -v

alias config='/usr/bin/git --git-dir=/home/david/.cfg/ --work-tree=/home/david'

