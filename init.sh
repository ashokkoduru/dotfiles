cd ~

sudo apt-get install cmake build-essential python2.7-dev zsh unzip htop exuberant-ctags -y

git clone https://github.com/haseebr/dotfiles ".dotfiles"
git clone https://github.com/VundleVim/Vundle.vim ".dotfiles/vim/bundle/Vundle.vim"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ".dotfiles/zprezto"

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/screenrc ~/.screenrc
ln -s ~/.dotfiles/zprezto ~/.zprezto
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zlogin ~/.zlogin
ln -s ~/.dotfiles/zlogout ~/.zlogout
ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc
ln -s ~/.dotfiles/zprofile ~/.zprofile
ln -s ~/.dotfiles/zshenv ~/.zshenv

setopt EXTENDED_GLOB

#sh ~/.dotfiles/vim/bundle/YouCompleteMe/install.sh

vim +BundleInstall
chsh -s $(which zsh)

# Windows MKLINK

#mklink C:\Users\server\AppData\Roaming\.emacs.d\init.el C:\Users\server\.babun\cygwin\home\server\.dotfiles\init.el
#mklink C:\Users\server\AppData\Roaming\.emacs.d\private C:\Users\server\.babun\cygwin\home\server\.dotfiles\private
#mklink C:\Users\server\AppData\Roaming\.spacemacs C:\Users\server\.babun\cygwin\home\server\.dotfiles\.spacemacs

# Unix ln
ln -s ~/.dotfiles/init.el ~/.emacs.d/init.el
ln -s ~/.dotfiles/private ~/.emacs.d/private
ln -s ~/.dotfiles/.spacemacs ~/.spacemacs
