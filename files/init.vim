" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Preferences {{{
set number
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set mouse=a
inoremap jk <esc>
inoremap <esc> <nop>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
let maplocalleader="\<space>"

" Open new tab and show file explorer
" nnoremap <LocalLeader>tn :tabnew <bar> :Explore<CR>
nnoremap <LocalLeader>nh :noh<CR>
" nnoremap <LocalLeader>rn :set relativenumber!<CR>
nnoremap <LocalLeader>id :put! =strftime('%c')<CR>
nnoremap <LocalLeader>pwd :echo @%<CR>
" nnoremap <LocalLeader>ss :set spell spelllang=en_gb<CR>
" nnoremap <LocalLeader>us :set nospell<CR>
nnoremap <LocalLeader>sn :set number!<CR>
nnoremap <LocalLeader>st :Ack!<Space>
nnoremap <LocalLeader>sf :CtrlP<CR>
nnoremap <LocalLeader>tw :FloatermNew<CR>
tnoremap <LocalLeader>tw  <C-\><C-n>:FloatermNew<CR>
nnoremap <LocalLeader>tp  :FloatermPrev<CR>
tnoremap <LocalLeader>tp  <C-\><C-n>:FloatermPrev<CR>
nnoremap <LocalLeader>tn  :FloatermNext<CR>
tnoremap <LocalLeader>tn  <C-\><C-n>:FloatermNext<CR>
nnoremap <LocalLeader>tt  :FloatermToggle<CR>
tnoremap <LocalLeader>tt  <C-\><C-n>:FloatermToggle<CR>
let g:netrw_liststyle = 3
" }}}
 
" Install plugins {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Initialize plugin system

Plug 'itchyny/lightline.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-vagrant'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'voldikss/vim-floaterm'

call plug#end()
" }}}

" Plug Preferences {{{
" Use silver server for ack if available
if executable("ag")
  " Use ag over grep
  let ackprg='ag --vimgrep'

  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
cnoreabbrev Ack Ack!

colorscheme vim-monokai-tasty

let g:lightline = {'colorscheme': 'monokai_tasty'}
" Force lightline status
set laststatus=2

" set monokai theme
set termguicolors
colorscheme monokai_pro
" }}}
