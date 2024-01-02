# create symbol links for configuration files
if [[ ! -f ~/.vimrc ]]; then
	ln -s ~/dotfiles/.vimrc ~
	echo "created symbol link for .vimrc"
fi

if [[ ! -f ~/.zshrc ]]; then
	ln -s ~/dotfiles/.zshrc ~
	echo "created symbol link for .zshrc"
fi

if [[ ! -f ~/.config/zathura/zathurarc ]]; then
	ln -s ~/dotfiles/zathurarc ~/.config/zathura
	echo "created symbol link for zathurarc"
fi

if [[ ! -f ~/.gitconfig ]]; then
	ln -s ~/dotfiles/.gitconfig ~
	echo "created symbol link for .gitconfig"
fi

if [[ ! -f ~/.latexmkrc ]]; then
	ln -s ~/dotfiles/.latexmkrc ~
	echo "created symbol link for .latexmkrc"
fi


if [[ ! -f ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme ]]; then
	ln -s ~/dotfiles/agnoster-customized.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme
	echo "created symbol link for agnoster-customized theme"
fi


if [[ ! -d ~/.oh-my-zsh/custom/plugins/myhistory ]]; then
	ln -s ~/dotfiles/myhistory ~/.oh-my-zsh/custom/plugins/myhistory
	echo "created symbol link for myhistory plugin"
fi


