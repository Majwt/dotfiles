#!/usr/bin/env zsh
# mise
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# starship
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# try
if command -v try &>/dev/null; then
  eval "$(try init ~/Work/tries)"
fi

# fzf
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi


if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi


function fuck() {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING
  export TF_SHELL=zsh
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
