#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export TERM=xterm-256color

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOBIN=$GOROOT/bin
export GOPATH=~/go

autoload -U compinit
compinit

setopt autocd
setopt extended_glob	

prompt sorin
prompt steeef

# To list directories first
alias ls='ls --color -h --group-directories-first'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias dotfiles="cd ~/.dotfiles"
alias dev="cd ~/dev"
alias dotvim="cd ~/.vim"
alias home="cd ~"
alias gpom="git push origin master"
alias update="git fetch --all && git reset --hard origin/master"

source "/var/www/dlsite/alias.sh"

gacp() {
    git add --all . && git commit -m "$1" && git push origin master
}

mp3dl() {
    youtube-dl --extract-audio --audio-format mp3 $1
}

serveon() {
    python -m SimpleHTTPServer $1
}
