mv ~/dotfiles ~/.dotfiles
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/oh-my-zsh ~/.oh-my-zsh
sudo apt-get install cmake build-essential python2.7-dev zsh unzip htop exuberant-ctags -y
sh ~/.dotfiles/vim/bundle/YouCompleteMe/install.sh
vim +BundleInstall
chsh -s $(which zsh)
