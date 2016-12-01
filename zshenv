#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

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
