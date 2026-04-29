#!/usr/bin/env bash

unset -f try 2>/dev/null
source "$HOME/.local/share/omarchy/default/bash/rc"
bind '"\C-o": edit-and-execute-command'
bind -f ~/.inputrc

# mise
if command -v mise &>/dev/null; then
  eval "$(mise activate bash)"
fi

# starship
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v try &>/dev/null; then
  eval "$(SHELL=/bin/bash command try init ~/Work/tries)"
fi

if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"
fi
 

if command -v wt >/dev/null 2>&1; then
  # source $(wt shellenv)

  eval "$(command wt config shell init bash)"; 
fi


function fuck() {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING
  export TF_SHELL=bash
  export TF_ALIAS=fuck
  export TF_SHELL_ALIASES=$(alias)
  export TF_HISTORY=$(fc -ln -10)
  export PYTHONIOENCODING=utf-8
  TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@") && eval "$TF_CMD"
  unset TF_HISTORY
  export PYTHONIOENCODING=$TF_PYTHONIOENCODING
  history -s $TF_CMD
}
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

show_timers() {
    echo
    printf "\033[1;36m󰥔 Timers\033[0m\n"
    systemctl --user list-timers --all --no-pager \
      | rg 'NEXT|immich-upload|commit-neovim'
    echo
}
show_timers 
