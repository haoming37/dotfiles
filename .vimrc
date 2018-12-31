set fenc=utf-8
set list
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set autoindent
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
noremap <C-a>m :tabnew %<CR>
noremap <C-a>n :tabNext<CR>
noremap <C-a>p :tabprevious<CR>
noremap <C-a>t :tabnew<CR>
noremap <C-a>f :NERDTreeToggle<CR>
noremap <C-a>x :tabclose<CR>
noremap <C-a>v "0p
tnoremap <silent> <C-j> <C-\><C-n>
tnoremap <silent> <esc> <C-\><C-n>

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-fugitive')
 
    if ! has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    else
        autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
        tnoremap <C-w>h <C-\><C-n><C-w>h
        tnoremap <C-w>j <C-\><C-n><C-w>j
        tnoremap <C-w>k <C-\><C-n><C-w>k
        tnoremap <C-w>l <C-\><C-n><C-w>l
    endif

    if has('python3')
        call dein#add('davidhalter/jedi-vim')
        call dein#add('ervandew/supertab')
        let g:SuperTabContextDefaultCompletionType = "context"
        let g:SuperTabDefaultCompletionType = "<c-n>"
    endif

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif
