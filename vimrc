call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'skywind3000/asyncrun.vim'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
call plug#end()

set autoindent          " auto indenting
set expandtab           " tabs are spaces
set backspace=2         " backspace in insert mode works like normal editor
set shiftwidth=2        " indent by 2 spaces when auto-indenting
set softtabstop=2       " indent by 2 spaces when hitting tab

syntax on               " syntax highlighting
filetype indent on      " activates indenting for files

set number              " line numbers
colorscheme onedark

set hidden              " can open multiple buffers without saving
set nobackup            " get rid of anoying ~file
set modelines=0
set wildmenu            " visual autocomplete for command menu
set autoread            " reload files when changed on disk, i.e. via `git checkout`
set scrolloff=3         " show context above/below cursorline

set incsearch
" set hlsearch          " search highlights temporarily disabled
set smartcase
set wrapscan

set pastetoggle=<F2>
let mapleader=" "
let maplocalleader=","
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>g :Goyo<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap  <localleader>mt :Toc<CR>

"NERDTree Configuration
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

" Pencil
autocmd FileType markdown,mkd,tex call pencil#init({'wrap': 'soft'})

" Latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" nnoremap <leader>m :AsyncRun livedown start % --port 4242<CR>
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser = "firefox"

" Fast text search using rg
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" True color support
set termguicolors
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
