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


autoload -U compinit

setopt autocd
setopt extended_glob	

prompt sorin
prompt steeef

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# To list directories first
#alias ls='ls --color -h --group-directories-first'
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias dotfiles="cd ~/.dotfiles"
alias dev="cd ~/dev"
alias dotvim="cd ~/.vim"
alias home="cd ~"
alias gpom="git push origin master"
alias update="git fetch --all && git reset --hard origin/master"

gacp() {
    git add --all . && git commit -m "$1" && git push origin master
}

mp3dl() {
    youtube-dl --extract-audio --audio-format mp3 $1
}

serveon() {
    python -m SimpleHTTPServer $1
}

export NVM_DIR="/Users/haseeb/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
