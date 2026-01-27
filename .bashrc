# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#

alias dl='lazydocker'
alias upd='docker compose up -d'
alias down='docker compose down'
alias gs='clear -x; git status; git log --oneline -4'
alias gl="git log --all --graph --pretty=\
  format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
alias gds="git diff --output-indicator-new=' ' --output-indicator-old=' ' --staged"
alias gap="git add --patch"
alias lg="lazygit"
alias cdi="zi"

# source $(wt shellenv)

# export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
export INPUT_METHOD='fcitx'
export SDL_IM_MODULE='fcitx'

function src() {
  source ~/.bashrc
}

function clear_dns() {
  systemd-resolve --flush-caches
}

function clear-dns() {
  systemd-resolve --flush-caches
}

. "$HOME/.cargo/env"

