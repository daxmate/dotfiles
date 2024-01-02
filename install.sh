# create symbol links for configuration files

if [[ ! -f ~/.vimrc ]]; then
	ln -s ~/dotfiles/.vimrc ~
	echo "created symbol link for .vimrc"
fi

if [[ ! -f ~/.zshrc ]]; then
	ln -s ~/dotfiles/.zshrc ~
	echo "created symbol link for .zshrc"
fi

if [[ ! -f ~/.gitconfig ]]; then
	ln -s ~/dotfiles/.gitconfig ~
	echo "created symbol link for .gitconfig"
fi

if [[ ! -f ~/.latexmkrc ]]; then
	ln -s ~/dotfiles/.latexmkrc ~
	echo "created symbol link for .latexmkrc"
fi

if [[ ! -f ~/.local/share/nvim/site/pack/packer/start/neoformat/autoload/neoformat/formatters/cpp.vim ]]; then
	ln -s ~/dotfiles/cpp-neoformatter.vim ~/.local/share/nvim/site/pack/packer/start/neoformat/autoload/neoformat/formatters/cpp.vim
	echo "created symbol link for cpp neoformatter"
else
	ln -fs ~/dotfiles/cpp-neoformatter.vim ~/.local/share/nvim/site/pack/packer/start/neoformat/autoload/neoformat/formatters/cpp.vim
	echo "cpp neoformatter existed, force linking to the one in dotfiles folder"
fi

if [[ ! -f ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme ]]; then
	ln -s ~/dotfiles/agnoster-customized.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme
	echo "created symbol link for agnoster-customized theme"
fi


if [[ ! -d ~/.oh-my-zsh/custom/plugins/myhistory ]]; then
	ln -s ~/dotfiles/myhistory ~/.oh-my-zsh/custom/plugins/myhistory
	echo "created symbol link for myhistory plugin"
fi

function install(){
	cmd=$2
	if type $cmd > /dev/null 2>&1; then
		echo "$cmd already existed"
	else
		if [[ "$1" = formulae ]]; then
			brew install $cmd
		else
			brew install --casks $cmd
		fi
	fi
}

# formulae
install formulae rg
install formulae eza
install formulae autojump
install formulae fd
install formulae ffmpeg
install formulae fzf
install formulae figlet
install formulae gcc
install formulae git
install formulae llvm
install formulae lua
install formulae luarocks
install formulae python
install formulae thefuck
install formulae tree
install formulae yt-dlp
install formulae neovim
install formulae zoxide
install formulae zsh-autopair
install formulae zsh-autosuggestions
install formulae zsh-syntax-highlighting
install formulae zsh-vi-mode
install formulae zsh-you-should-use

# casks
install casks alt-tab
install casks mactex
install casks sioyek
install casks anki
install casks macvim
install casks squirrel
install casks calibre
install casks mks
install casks tex-live-utility
install casks google-chrome
install casks mpv
install casks wechat
install casks iina
install casks obs
install casks wpsoffice-cn
install casks karabiner-elements
install casks pycharm-ce
install casks keycastr
install casks rectangle
