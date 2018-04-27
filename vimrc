set autoindent          " auto indenting
set expandtab           " tabs are spaces
set backspace=2         " backspace in insert mode works like normal editor
set shiftwidth=2        " indent by 2 spaces when auto-indenting
set softtabstop=2       " indent by 2 spaces when hitting tab

syntax on               " syntax highlighting
filetype indent on      " activates indenting for files

set number              " line numbers
colorscheme default     " colorscheme desert

set nobackup            " get rid of anoying ~file
set modelines=0
set wildmenu            " visual autocomplete for command menu
set autoread            " reload files when changed on disk, i.e. via `git checkout`
set scrolloff=3         " show context above/below cursorline

set incsearch
set hlsearch
set smartcase
set wrapscan

" move vertically by visual line
nnoremap j gj
nnoremap k gk
set pastetoggle=<F2>

