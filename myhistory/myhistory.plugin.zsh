alias h='history'
alias hl='history | nvim'
alias hs="history | awk '{\$1=\"\"; sub(/^ /, \"\"); print \$0}' | sort | uniq | rg"
alias hsi="history | awk '{\$1=\"\"; sub(/^ /, \"\"); print \$0}' | sort | uniq | rg -i"
