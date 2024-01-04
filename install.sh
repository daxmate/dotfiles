#!/usr/bin/env zsh

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

if [[ ! -d ~/.oh-my-zsh/custom/plugins/mytimer ]]; then
	ln -s ~/dotfiles/myhistory ~/.oh-my-zsh/custom/plugins/mytimer
	echo "created symbol link for mytimer plugin"
fi

function install(){
	cmd=$2
	if [[ -n `brew list | rg $cmd` ]]; then
		echo "$cmd already existed"
	else
		if [[ "$1" = formula ]]; then
			brew install $cmd
		else
			brew install --cask --force $cmd
		fi
	fi
}

# formulae
formulae=(
autojump
eza
fd
ffmpeg
figlet
fzf
gcc
git
llvm
lua
luarocks
neovim
python
rg
thefuck
tree
yt-dlp
zoxide
zsh-autopair
zsh-autosuggestions
zsh-syntax-highlighting
zsh-you-should-use
)


# casks
casks=(
alt-tab
anki
calibre
google-chrome
iina
karabiner-elements
keycastr
mactex
macvim
mks
mpv
obs
pycharm-ce
rectangle
sioyek
squirrel
tex-live-utility
wechat
wpsoffice-cn
)

for formula in $formulae
do
	install formula $formula
done

for cask in $casks
do
	install cask $cask
done

