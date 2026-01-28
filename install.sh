#!/usr/bin/env zsh

# create symbol links for configuration files

# 定义链接创建函数
# 参数: mode src dst
# mode: "skip" - 如果目标存在则跳过；"force" - 强制覆盖
create_link() {
    local mode=$1
    local src=$2
    local dst=$3
    
    case $mode in
        skip)
            if [[ -e $dst ]]; then
                echo "$dst already exists, skip"
                return
            fi
            ln -s "$src" "$dst"
            echo "created symbol link for $dst"
            ;;
        force)
            if [[ -e $dst ]]; then
                echo "$dst existed, force linking to $src"
            else
                echo "created symbol link for $dst"
            fi
            ln -sf "$src" "$dst"
            ;;
    esac
}

# 使用数组存储链接配置：每行包含 mode src dst
links=(
    # 如果目标不存在则创建的链接
    "skip" "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
    "skip" "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
    "skip" "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
    "skip" "$HOME/dotfiles/.latexmkrc" "$HOME/.latexmkrc"
    # oh-my-zsh 主题和插件
    "skip" "$HOME/dotfiles/agnoster-customized.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/agnoster-customized.zsh-theme"
    # 强制覆盖的链接
    "force" "$HOME/dotfiles/.mylatexindent.yaml" "$HOME/.mylatexindent.yaml"
    "force" "$HOME/dotfiles/.indentconfig.yaml" "$HOME/.indentconfig.yaml"
    # sioyek 配置
    "force" "$HOME/dotfiles/sioyek/keys_user.config" "$HOME/Library/Application Support/sioyek/keys_user.config"
    "force" "$HOME/dotfiles/sioyek/prefs_user.config" "$HOME/Library/Application Support/sioyek/prefs_user.config"
)


# 批量创建符号链接
for mode src dst in $links; do
	create_link $mode "$src" "$dst"
done


installed_formulae=($(brew list --formulae))
installed_casks=($(brew list --casks))

function install(){
    local type=$1
    local cmd=$2
    
    if [[ $type == formula ]]; then
        # 使用 -gt 0 检查精确匹配
        if [[ ${installed_formulae[(Ie)$cmd]} -gt 0 ]]; then
            echo "$cmd already installed, skip"
        else
            brew install "$cmd"
        fi
    else
        if [[ ${installed_casks[(Ie)$cmd]} -gt 0 ]]; then
            echo "$cmd already installed, skip"
        else
            brew install --cask --force $cmd
        fi
    fi
}

# formulae
formulae=(
	awk
	black
	cmake
	curl
	dust
	gh
	imagemagick
	jq
	qt
	rename
	tmux
    bat
    eza
    fd
    ffmpeg
    figlet
    fortune
    fzf
    gcc
    git
    llvm
    lolcat
    lua
    luarocks
    neovim
    python
    ripgrep
    tlrc
    yt-dlp
    zoxide
)

# casks
casks=(
    alt-tab
    anki
    calibre
    iina
    karabiner-elements
    keycastr
    vimr
    mks
    stolendata-mpv
    obs
    qbittorrent
    qq
    rectangle
    sioyek
    squirrel
    the-unarchiver
    wechat
)

for formula in $formulae; do
    install formula $formula
done

for cask in $casks; do
    install cask $cask
done
