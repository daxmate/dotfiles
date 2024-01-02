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


if [[ ! -f ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme ]]; then
	ln -s ~/dotfiles/agnoster-customized.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme
	echo "created symbol link for agnoster-customized theme"
fi


if [[ ! -d ~/.oh-my-zsh/custom/plugins/myhistory ]]; then
	ln -s ~/dotfiles/myhistory ~/.oh-my-zsh/custom/plugins/myhistory
	echo "created symbol link for myhistory plugin"
fi

function install(){
	cmd=$1
	if type $cmd > /dev/null 2>&1; then
		echo "$cmd already existed"
	else
		brew install $cmd
	fi
}

# formulae
install rg
install eza
install autojump
install fd
install ffmpeg
install fzf
install figlet
install gcc
install git
install llvm
install lua
install luarocks
install python
install thefuck
install tree
install yt-dlp
install neovim
install zoxide
install zsh-autopair
install zsh-autosuggestions
install zsh-syntax-highlighting
install zsh-vi-mode
install zsh-you-should-use

# casks
install alt-tab
install mactex
install sioyek
install anki
install macvim
install squirrel
install calibre
install mks
install tex-live-utility
install google-chrome
install mpv
install wechat
install iina
install obs
install wpsoffice-cn
install karabiner-elements
install pycharm-ce
install keycastr
install rectangle
