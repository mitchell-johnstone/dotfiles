alias resource="source ~/.profile"
alias wslconfig="vim /mnt/c/Users/mitchelj/.wslconfig"
alias vim="nvim"
alias myvimrc="nvim ~/.config/nvim/init.lua"
alias downloads="cd /mnt/c/Users/mitchelj/Downloads"
alias up="docker compose up -d"
alias down="docker compose down"
alias cat="batcat"
alias sonnet="ANTHROPIC_MODEL='us.anthropic.claude-3-7-sonnet-20250219-v1:0' claude"
alias haiku="ANTHROPIC_MODEL='us.anthropic.claude-3-5-haiku-20241022-v1:0' claude"
alias hq="harlequin"
alias clauded="claude --dangerously-skip-permissions"

tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

alias gen=". climb dssi.menuing.generateoptimizationsuggestions.processor"
alias mlapi=". climb dssi.menuing.mlapi"
alias menu=". climb dssi.menuing.api"
alias db=". climb dssi.menuing.database"
alias web=". climb dssi.gourmet.web"
alias api=". climb dssi.gourmet.api"

alias run_local='dotnet run --launch-profile "https - local"'

# Formatting for specific repos
format() {
  dir_name="$(basename "$(pwd)")"
  if [[ "$dir_name" == "dssi.menuing.mlapi" ]]; then
    mise run install
    mise format
    mise lint
  elif [[ "$dir_name" == "dssi.menuing.api" ]]; then
    dotnet csharpier .
  else
    echo "No idea"
  fi
}

# I tend to search for something and then want to open it in vim
rgv() {
  vim -q <(rg --vimgrep "$@") -c "copen"
}
