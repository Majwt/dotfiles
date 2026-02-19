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

