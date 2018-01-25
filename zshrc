BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Disable auto correction
unsetopt correct_all

alias ls='ls -G'

export PATH=/usr/local/bin:$PATH
export PATH="./bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

plugins=(zsh-autosuggestions)

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
DISABLE_AUTO_TITLE="true"
source $ZSH/oh-my-zsh.sh
