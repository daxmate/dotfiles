let mapleader=","
set path+=~/Codes/**

let g:python3_host_prog='/opt/homebrew/Frameworks/Python.framework/Versions/3.10/bin/python3.10'

" jk to escape
inoremap jk <esc>
cnoremap jk <esc>



" customize personally
set splitright

" Automatically change the current directory
autocmd BufEnter * silent! cd %:p:h

" assumes set ignorecase smartcase
augroup dynamic_smartcase:
    autocmd!
    autocmd CmdLineEnter : set ignorecase
    autocmd CmdLineLeave : set smartcase
augroup END

" moving between buffers
nnoremap gb :bn<cr>
nnoremap gB :bp<cr>

" Jump out of cpp brackets
inoremap g; <right>;
inoremap ;; <right>
inoremap ;;; <esc>A


""source after saveing .vimrc
au! BufWritePost $MYVIMRC nested source $MYVIMRC | echom "Reloaded $VIMRC"

" Expand active buffer path
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

" javascript formatter
autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin

" Search and replace
nnoremap <leader>s :%s///g<left><left>
set incsearch

" edit vimrc (ev)
nnoremap <leader>ev :e! $MYVIMRC<cr>
nnoremap <leader>ep :e! /Users/dax/Library/Application Support/V2RayX/pac/pac.js<cr>
nnoremap <leader>eu :e! /Users/dax/Library/Rime/wubi86_user.dict.yaml<cr>
nnoremap <leader>ez :e! ~/.zshrc<cr>


" Move lines up and down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
inoremap <leader>c <c-r>"
inoremap <leader>* <c-r>*

" windows
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l
nnoremap <leader>wk <c-w>k
nnoremap <leader>wj <c-w>j
nnoremap <leader>wH <c-w>H
nnoremap <leader>wL <c-w>L
nnoremap <leader>wK <c-w>K
nnoremap <leader>wJ <c-w>J
nnoremap <leader>vs :vs<cr>

nnoremap L Lzz
nnoremap H Hzz
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" themes
Plug 'NLKNguyen/papercolor-theme'
" comments
Plug 'tpope/vim-commentary'
" surround
Plug 'tpope/vim-surround'

" git 
Plug 'tpope/vim-fugitive'

" bash commands 
Plug 'tpope/vim-eunuch'

" auto save
Plug '907th/vim-auto-save' 

" airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'

" easy motion
Plug 'easymotion/vim-easymotion'

" markdown and paste image
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'ferrine/md-img-paste.vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Python mode and virtual environment
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop'}
" Plug 'jmcantrell/vim-virtualenv'

Plug 'voldikss/vim-floaterm'

" coc and neoformat
Plug 'sbdchd/neoformat'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'michaeljsmith/vim-indent-object'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim'

"c++
Plug 'alepez/vim-gtest'
Plug 'cdelledonne/vim-cmake'

Plug 'itchyny/calendar.vim'

"latex
Plug 'lervag/vimtex'

" Plug 'SirVer/ultisnips'

call plug#end()

" Auto save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Appearance
set background=light
syntax enable
filetype plugin indent on
colorscheme papercolor
set guifont=JetBrainsMonoNLNFM-Regular:h18
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" display current virtual environment.
" let g:airline_section_x = '%{virtualenv#statusline()}'


" latex, lsp texlab, formatter latexindent
let maplocalleader=","
let g:coc_filetype_map = {'tex': 'latex'}
let g:vimtex_format_enabled = 1

" display line number, exchange / and \ for easy typing
let g:vimtex_view_method = 'zathura'
" set build directory to the base name of current file
" let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}
augroup tex
	autocmd!
	autocmd FileType tex :set nu
	autocmd FileType tex :inoremap <buffer> / \
	autocmd FileType tex :inoremap <buffer> \ /
	autocmd FileType tex :set tabstop=1 shiftwidth=1 textwidth=80
	" autocmd FileType tex :setlocal spell | setlocal spelllang=en_us,cjk | setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
augroup end

nnoremap <leader>f :Neoformat<cr>
let g:python3_host_prog='/opt/homebrew/Cellar/python@3.10/3.10.9/bin/python3.10'

let g:UltiSnipsSnippetDirectories = 'ultisnips'
let g:UltiSnipsEditSplit="vertical"

