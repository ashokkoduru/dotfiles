cd ~

sudo apt-get install cmake build-essential python2.7-dev zsh unzip htop exuberant-ctags -y

git clone https://github.com/haseebr/dotfiles ".dotfiles"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ".dotfiles/zprezto"

ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
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
