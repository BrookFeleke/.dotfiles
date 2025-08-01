# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme for Zsh
ZSH_THEME="robbyrussell"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Starship prompt
eval "$(starship init zsh)"

# Add Go to PATH
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# Add Node.js and related paths to PATH
export PATH="$HOME/.nvm/versions/node/v20.12.2/bin:$PATH"

# Add personal script path
export PATH="$HOME/.local/scripts:$PATH"

# tmux-sessionizer binding
bindkey -s ^f "tmux-sessionizer\n"

