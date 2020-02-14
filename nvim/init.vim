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
set showtabline=2
set cursorline
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

if &compatible
 set nocompatible
endif

call plug#begin('~/.vim/plugged')
Plug 'thinca/vim-quickrun'
Plug 'simeji/winresizer'
Plug '~/.cache/dein'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
"Plug 'Shougo/deoplete.nvim' 
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/neocomplete.vim'
"Plug 'Shougo/neomru.vim'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'jdkanani/vim-material-theme'
Plug 'mhinz/neovim-remote'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber
autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
tnoremap <silent> <C-j> <C-\><C-n>
tnoremap <silent> <esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <C-w>q <C-\><C-n><C-w>q
tnoremap <C-a>t <C-\><C-n>:tabnew %<CR>
tnoremap <C-a>n <C-\><C-n>:tabNext<CR>
tnoremap <C-a>p <C-\><C-n>:tabprevious<CR>
tnoremap <C-a>x <C-\><C-n>:tabclose<CR>
tnoremap <C-a>f <C-\><C-n>:NERDTreeToggle<CR>


let g:lsp_log_verbose = 1  " デバッグ用ログを出力
let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')  " ログ出力のPATHを設定
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

"MarkdownPreview
"plantumlサーバーをlocalのものにする
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': { 'server': 'http://localhost:8080'},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
