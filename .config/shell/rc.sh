
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="nvim"

function src() {
  source "$XDG_CONFIG_HOME/shell/rc.sh"
}


if [ -n "$ZSH_VERSION" ]; then
  # compatible with zsh
  source "$XDG_CONFIG_HOME/shell/zsh/rc.zsh"
else
  # compatible with bash
  source "$XDG_CONFIG_HOME/shell/bash/rc.bash"
fi
# compatible with both bash and zsh
source "$XDG_CONFIG_HOME/shell/aliases.sh"
source "$XDG_CONFIG_HOME/shell/init.sh"
