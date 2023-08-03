eval "$(/opt/homebrew/bin/brew shellenv)"

# Start ssh agent if it isn't already
if [ -z "$SSH_AGENT_PID" ]; then
  eval "$(ssh-agent -s)" &> /dev/null
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519_stash &> /dev/null
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519_github_personal &> /dev/null
fi

trap 'kill "$SSH_AGENT_PID"' INT TERM QUIT EXIT

