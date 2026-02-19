# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return



# if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$SSH_CONNECTION" ]; then
#   tmux attach || tmux new || echo "Could not start tmux"
# fi

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)

export XDG_CONFIG_HOME=$HOME/.config

source "$XDG_CONFIG_HOME/shell/rc.sh"
return

# log="log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
# diff="diff --output-indicator-new=' ' --output-indicator-old=' '"
# diffs="diff --staged --output-indicator-new=' ' --output-indicator-old=' '"
# gap="add --patch"
#
# alias cdi="zi"
#
#
# alias upd='docker compose up -d'
# alias down='docker compose down'
# alias dl='lazydocker'
# alias lg='lazygit'
#
# # git aliases
#
# alias gbm='git branch -m'
# alias ga='git add'
# alias gc='git commit'
#
# alias gs='clear -x; git status; git log --oneline -4'
# alias gl="git $log"
# alias gd="git $diff"
# alias gds="git $diffs"
# alias gap="git $gap"
# # config alias for managing dotfiles with bare git repo
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# alias c='config'
#
# alias cgs='clear -x; config status; config log --oneline -4'
# alias cgd="config $diff"
# alias cgds="config $diffs"
# alias cgap="config $gap"
# alias cgl="config $log"
# alias ca="config add"
# alias cc="config commit"
#
# if [ -n "$ZSH_VERSION" ]; then
#   # this is zsh
#   source "$HOME/.config/zsh/fzf_config"
#   source "$HOME/.config/zsh/config"
#
#   alias ls="eza -1 --icons=always -F --git --color=always -L 1 --group-directories-first -l --git -a --color-scale=size -h"
#   alias lsg="ezac --git-ignore"
#   alias lsa="ezac -a"
#   alias cat="bat"
#   alias grep="rg"
#   alias diff="diff-so-fancy"
#   alias neofetch="fastfetch"
#   alias makedb="compiledb -n make"
#
#   alias scd="cd"
#   alias cd="z"
#   alias cdi="zi"
#
#
#
#
#   function src() {
#     source "$HOME/.zshrc"
#   }
#
#   return
# fi
# source "$HOME/.local/share/omarchy/default/bash/rc"
# alias c='config'
#
# # Add your own exports, aliases, and functions here.
# #
# # Make an alias for invoking commands you use constantly
# # alias p='python'
# #
#
# # Make Ctrl-o open Neovim for command editing
# bind '"\C-o": edit-and-execute-command'
# bind -f ~/.inputrc
# if command -v fzf >/dev/null 2>&1; then
#   eval "$(fzf --bash)"
# fi
#
# # source $(wt shellenv)
#
# # export GTK_IM_MODULE='fcitx'
# export QT_IM_MODULE='fcitx'
# export XMODIFIERS='@im=fcitx'
# export INPUT_METHOD='fcitx'
# export SDL_IM_MODULE='fcitx'
#
# function src() {
#   source "$HOME/.bashrc"
# }
#
# function clear_dns() {
#   systemd-resolve --flush-caches
# }
#
# function clear-dns() {
#   systemd-resolve --flush-caches
# }
#
#
# [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
#
# function fuck() {
#   TF_PYTHONIOENCODING=$PYTHONIOENCODING
#   export TF_SHELL=bash
#   export TF_ALIAS=fuck
#   export TF_SHELL_ALIASES=$(alias)
#   export TF_HISTORY=$(fc -ln -10)
#   export PYTHONIOENCODING=utf-8
#   TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@") && eval "$TF_CMD"
#   unset TF_HISTORY
#   export PYTHONIOENCODING=$TF_PYTHONIOENCODING
#   history -s $TF_CMD
# }
# function y() {
#   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
#   command yazi "$@" --cwd-file="$tmp"
#   IFS= read -r -d '' cwd <"$tmp"
#   [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
#   rm -f -- "$tmp"
# }
#
# export GPG_TTY=$(tty)
#
# if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init bash)"; fi
