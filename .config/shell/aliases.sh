
alias cdi="zi"

alias upd='docker compose up -d'
alias down='docker compose down'
alias dl='lazydocker'
alias lg='lazygit'

# git aliases

alias gbm='git branch -m'
alias ga='git add'
alias gc='git commit'

alias gs='clear -x; git status; git log --oneline -4'

log="log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
diff="diff --output-indicator-new=' ' --output-indicator-old=' '"
diffs="diff --staged --output-indicator-new=' ' --output-indicator-old=' '"
gap="add --patch"


alias gl="git $log"
alias gd="git $diff"
alias gds="git $diffs"
alias gap="git $gap"
# config alias for managing dotfiles with bare git repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias c='config'

alias cgs='clear -x; config status; config log --oneline -4'
alias cgd="config $diff"
alias cgds="config $diffs"
alias cgap="config $gap"
alias cgl="config $log"
alias ca="config add"
alias cc="config commit"

alias ls="eza -1 --icons=always -F --color=always -L 1 --group-directories-first -l --git --color-scale=size -h"
alias lsg="ls --git-ignore"
alias lsa="ls -a"
alias cat="bat"
alias grep="rg"
alias diff="diff-so-fancy"
alias neofetch="fastfetch"
alias makedb="compiledb -n make"

function venv() {
  if [ -z "$1" ]; then 
    echo "Usage: venv <venv_path>"
    return 1
  fi
  if command -v python3 &> /dev/null; then
    echo "Creating virtual environment at: ${PWD}/${1}"
    python3 -m venv "${1}"
    if $? -ne 0; then
      echo "Failed to create virtual environment. Please check the path and try again."
      return 1
    fi
    activate "${1}"
  else
    echo "Python3 not found. Please ensure you have Python3 installed."
  fi
}

function activate() {
  
  if [ -z "$1" ]; then
    echo "Usage: activate <venv_path>"
    return 1
  fi
  echo "Using env: $PWD/$1/bin/activate"
  source "$PWD/$1/bin/activate"
  if command -v pip &> /dev/null; then
    echo "Installing dependencies from requirements.txt"
    pip install --upgrade pip
    if [ -f "$PWD/requirements.txt" ]; then
      pip install -r "$PWD/requirements.txt"
    else
      echo "requirements.txt not found in the current directory."
    fi
  else
    echo "pip not found. Please ensure you have pip installed in your virtual environment."
  fi
}
