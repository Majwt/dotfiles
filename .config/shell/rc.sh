
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

function src() {
  source "$XDG_CONFIG_HOME/shell/rc.sh"
}


if [ -n "$ZSH_VERSION" ]; then
  source "$XDG_CONFIG_HOME/shell/zsh/rc.zsh"
else
  source "$XDG_CONFIG_HOME/shell/bash/rc.bash"
fi
