cd ~
sudo apt-get install cmake build-essential python2.7-dev zsh unzip htop exuberant-ctags -y
git clone https://github.com/haseebr/dotfiles ".dotfiles"
git clone --recursive https://github.com/sorin-ionescu/prezto.git ".dotfiles/.zprezto"
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zprezto ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
#sh ~/.dotfiles/vim/bundle/YouCompleteMe/install.sh
vim +BundleInstall
chsh -s $(which zsh)
