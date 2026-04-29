
alias cdi="zi"

alias upd='docker compose up -d'
alias updb='docker compose up --build -d'
alias down='docker compose down'
alias dps='docker compose ps'
alias dlogs='docker compose logs -f'
alias dbuild='docker compose build'
alias dpull='docker compose pull'
alias dl='lazydocker'
alias lg='lazygit'

# git aliases

alias gbm='git branch -m'
# alias ga='git add'
alias gc='git commit'

alias gs='clear -x; git status; git log --oneline -4'

log="log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto)  %D%n%s%n'"
diff="diff --output-indicator-new=' ' --output-indicator-old=' '"
diffs="diff --staged --output-indicator-new=' ' --output-indicator-old=' '"
gap="add --patch"


alias gl="git $log"
# alias gd="git $diff"
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

if command -v eza &> /dev/null; then
  alias ls="eza -1 --icons=always -F --color=always -L 1 --group-directories-first -l --git --color-scale=size -h"
  alias lsg="ls --git-ignore"
fi
alias lsa="ls -a"
if command -v bat &> /dev/null; then
  alias cat="bat"
fi
if command -v rg &> /dev/null; then
  alias grep="rg"
fi
if command -v diff-so-fancy &> /dev/null; then
  alias diff="diff-so-fancy"
fi
alias neofetch="fastfetch"
alias makedb="compiledb -n make"

function venv() {
  if [ "$1" = "-h" ]; then
    echo "Usage: venv <venv_path>"
    echo "Creates a Python virtual environment at the specified path and activates it."
    echo "If no path is provided, it defaults to 'venv' in the current directory."
    return 0
  fi
  if [ -z "$1" ]; then 
    echo "Using default path: venv"
    path="venv"
  else
    path="$1"
  fi
  if command -v python3 &> /dev/null; then
    echo "Creating virtual environment at: ${PWD}/${path}"
    python3 -m venv "${path}"
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
  
  if [ "$1" = "-h" ]; then
    echo "Usage: activate <venv_path>"
    echo "Activates a Python virtual environment at the specified path."
    echo "If no path is provided, it defaults to 'venv' in the current directory."
    return 0
  fi
  if [ -z "$1" ]; then
    echo "Using default path: venv"
    path="venv"
  else
    path="$1"
  fi
  echo "Using env: $PWD/$path/bin/activate"
  source "$PWD/$path/bin/activate"
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

function axbuild() {
  if [ "$1" = "-h" ]; then
    echo "Usage: axBuild <project_path>"
    echo "Builds the project at the specified path using ax build."
    echo "If no path is provided, it defaults to the current directory."
    return 0
  fi

  dotnet publish --os win --sc -c Debug --output "$PWD/publish" "$1"
}
