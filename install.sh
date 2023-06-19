# create symbol links for configuration files
if [[ ! -f ~/.vimrc ]]; then
	ln -s ~/dotfiles/.vimrc ~
	echo "created symbol link for .vimrc"
fi

if [[ ! -f ~/.zshrc ]]; then
	ln -s ~/dotfiles/.zshrc ~
	echo "created symbol link for .zshrc"
fi

if [[ ! -f ~/.config/nvim/init.vim ]]; then
	ln -s ~/dotfiles/init.vim ~/.config/nvim
	echo "created symbol link for nvim init.vim"
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

if [[ ! -f ~/.local/share/nvim/plugged/vim-easymotion/t/all.snippets ]]; then
	ln -s ~/dotfiles/all.snippets ~/.local/share/nvim/plugged/vim-easymotion/t
	echo "created symbol link for ultisnip all.snippets"
fi


if [[ ! -f ~/.local/share/nvim/plugged/vim-easymotion/t/tex.snippets ]]; then
	ln -s ~/dotfiles/tex.snippets ~/.local/share/nvim/plugged/vim-easymotion/t
	echo "created symbol link for ultisnip tex.snippets"
fi

if [[ ! -f ~/.local/share/nvim/plugged/vim-easymotion/t/sinppets.snippets ]]; then
	ln -s ~/dotfiles/snippets.snippets ~/.local/share/nvim/plugged/vim-easymotion/t
	echo "created symbol link for ultisnip sinppets.snippets"
fi
