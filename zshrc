TERM=xterm-256color
# oh-my-zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
DISABLE_AUTO_TITLE="true"
source $ZSH/oh-my-zsh.sh

# Disable auto correction
unsetopt correct_all

alias ls='ls -G'

export PATH=/usr/local/bin:$PATH
export PATH="./bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
POWERLEVEL9K_MODE='nerdfont-complete'
