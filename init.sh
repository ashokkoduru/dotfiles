cd ~

sudo apt-get install cmake build-essential python2.7-dev zsh unzip htop exuberant-ctags tofrodos -y

git clone https://github.com/haseebr/dotfiles ".dotfiles"
git clone https://github.com/VundleVim/Vundle.vim ".dotfiles/vim/bundle/Vundle.vim"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ".dotfiles/zprezto"

ln -s ~/.dotfiles/vim ~/.vim && fromdos ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc && fromdos ~/.vimrc
ln -s ~/.dotfiles/screenrc ~/.screenrc && fromdos ~/.screenrc
ln -s ~/.dotfiles/zprezto ~/.zprezto && fromdos ~/.zprezto
ln -s ~/.dotfiles/zshrc ~/.zshrc && fromdos ~/.zshrc
ln -s ~/.dotfiles/zlogin ~/.zlogin && fromdos ~/.zlogin
ln -s ~/.dotfiles/zlogout ~/.zlogout && fromdos ~/.zlogout
ln -s ~/.dotfiles/zpreztorc ~/.zpreztorc && fromdos ~/.zpreztorc
ln -s ~/.dotfiles/zprofile ~/.zprofile && fromdos ~/.zprofile
ln -s ~/.dotfiles/zshenv ~/.zshenv && fromdos ~/.zshenv

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
