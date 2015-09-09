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

# To list directories first
alias ls='ls --color -h --group-directories-first'

gacp() {
    git add --all . && git commit -m "$1" && git push origin master
}

update() {
    git fetch --all && git reset --hard origin/master
}

gpom() {
    git push origin master
}

dev() {
    cd ~/dev
}
zshrc() {
    vim ~/.zshrc
}

vimrc() {
    vim ~/.vimrc
}

dotfiles() {
    cd ~/.dotfiles
}
dotvim() {
    cd ~/.vim
}

home() {
    cd ~
}

mp3dl() {
    youtube-dl --extract-audio --audio-format mp3 $1
}

serveon() {
    python -m SimpleHTTPServer $1
}
