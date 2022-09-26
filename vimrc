set nocompatible
filetype plugin on
syntax on

set backspace=indent,eol,start
set belloff=all
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set cursorline
set cursorcolumn
set termwinsize=10x0

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'l3nkz/ycmconf'
Plug 'bfrg/vim-cpp-modern'
Plug 'mg979/vim-visual-multi'
Plug 'SirVer/ultisnips'
Plug 'vimwiki/vimwiki'
Plug 'uiiaoo/java-syntax.vim'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching=0

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" " Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

let g:UltiSnipsExpandTrigger="<c-s-a>"
let g:UltiSnipsJumpForwardTrigger="<c-s-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-z>"

let g:vimwiki_list = [{'path': '~/vimwiki/'}]
let g:vimwiki_folding = 'list'

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>t gt<CR>
nnoremap <leader>T gT<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>

" open terminal below your current window  
nnoremap <leader>tr :wa<CR>:belowright term ++kill=term<CR>

" some fast run or compilation commands                                         
nnoremap <expr> <leader><leader>p ':w<cr><c-w><c-j>python ' . expand('%:p') . '<cr><c-w><c-k>'
nnoremap <expr> <leader><leader>cp ':w<cr><c-w><c-j>g++ ' . expand('%:p') . ' -o out; ./out <cr><c-w><c-k>'
nnoremap <expr> <leader><leader>cc ':w<cr><c-w><c-j>gcc ' . expand('%:p') . ' -o out; ./out <cr><c-w><c-k>' 
 
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
