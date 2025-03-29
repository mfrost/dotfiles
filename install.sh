# Absolute path to this script, e.g. /home/user/bin/foo.sh
INSTALLER=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
DOTFILES=$(dirname "$INSTALLER")

echo $DOTFILES

ln -sf $DOTFILES/ackrc     ~/.ackrc
ln -sf $DOTFILES/tmux.conf ~/.tmux.conf
