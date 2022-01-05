set expandtab
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set nosmartindent
set number

set noshowmode
set list
set listchars=tab:»-
set clipboard+=unnamedplus
set wrap

" <Leader>
let mapleader = "\<Space>"

" move
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"" キーマップ
" タブを作成する
nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>

" terminal esc
tnoremap <ESC> <C-\><C-n>

" window move keymap
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-w> <C-w>w

" status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'luna'

" fern (filer)
nnoremap <silent> <Leader>e :<C-u>Fern . -drawer -width=30 -toggle<CR>
let g:fern#default_hidden = 1

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
