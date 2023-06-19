let mapleader=","
set path+=~/Codes/**
set rnu

let g:python3_host_prog='/opt/homebrew/bin/python3'

" jk to escape
inoremap jk <esc>
vnoremap jk <esc>
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
Plug 'preservim/tagbar'

Plug 'itchyny/calendar.vim'

"latex
Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'


call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto save
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Appearance
set background=light
syntax enable
filetype plugin indent on
colorscheme papercolor
set guifont=DejaVuSansMonoPowerline:h18
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
let g:vimtex_view_method = 'sioyek'
" set build directory to the base name of current file
" let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}
augroup tex
	autocmd!
	autocmd FileType tex :set nu
	autocmd FileType tex :inoremap <buffer> / \
	autocmd FileType tex :inoremap <buffer> \ /
	autocmd FileType tex :set tabstop=4 shiftwidth=4 textwidth=80 colorcolumn=80
	" autocmd FileType tex :setlocal spell | setlocal spelllang=en_us,cjk | setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
augroup end

nnoremap <leader>f :Neoformat<cr>

" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: There's always complete item selected by default, you may want to enable
" " no select by `"suggest.noselect": true` in your configuration file.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call ShowDocumentation()<CR>

" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" " xmap <leader>f  <Plug>(coc-format-selected)
" " nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocActionAsync('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:UltiSnipsSnippetDirectories = 'ultisnips'
let g:UltiSnipsEditSplit="vertical"

au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

nmap <F8> :TagbarToggle<CR>

lua require('plugins')
lua require('config')
