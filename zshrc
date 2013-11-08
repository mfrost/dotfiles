# oh-my-zsh setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
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

