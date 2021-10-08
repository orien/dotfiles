if &compatible
  set nocompatible
endif

set encoding=utf-8
filetype off

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('junegunn/fzf')
call minpac#add('morhetz/gruvbox')
call minpac#add('itchyny/lightline.vim')
call minpac#add('shinchu/lightline-gruvbox.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-sensible')
call minpac#add('tpope/vim-surround')

set hidden
set nojoinspaces

" integrate with the mouse
set mouse=a

" setup visuals
syntax on
filetype plugin indent on
set list
set number
set laststatus=2

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" colour scheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" change cursor in insert mode (iterm2)
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" formating
set ts=2 sts=2 sw=2 expandtab

" ruby
let ruby_no_expensive = 1

nnoremap <C-p> :<C-u>FZF<CR>
