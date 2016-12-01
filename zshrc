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
export PATH=/usr/local/Cellar/smlnj/110.80/libexec/bin:$PATH
#export GOROOT=/usr/local/go
#export PATH=$PATH:$GOROOT/bin
#export GOBIN=$GOROOT/bin
#export GOPATH=~/go
# For Mac
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
#export PATH=$PATH/Applications/Electron.app/Contents/MacOS/
export PATH=$PATH:/usr/local/Cellar/node/6.9.1/libexec/npm/bin

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
