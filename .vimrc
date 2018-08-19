set fenc=utf-8
set list
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set smartindent
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set incsearch
set hlsearch
map <C-g> :Gtags 
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
noremap <C-j> <esc>
noremap! <C-j> <esc>
