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
nnoremap <LocalLeader>fr :Format<CR>:write<CR>
nnoremap <LocalLeader>fx :AutoFix<CR>
nnoremap <LocalLeader>fo :OrgImports<CR>
nnoremap <LocalLeader>st :Ack!<Space>
nnoremap <LocalLeader>sf :CtrlP<CR>
nnoremap <LocalLeader>ss :CocList symbols<CR>
nnoremap <LocalLeader>tw :FloatermNew<CR>
tnoremap <LocalLeader>tw  <C-\><C-n>:FloatermNew<CR>
nnoremap <LocalLeader>tp  :FloatermPrev<CR>
tnoremap <LocalLeader>tp  <C-\><C-n>:FloatermPrev<CR>
nnoremap <LocalLeader>tn  :FloatermNext<CR>
tnoremap <LocalLeader>tn  <C-\><C-n>:FloatermNext<CR>
nnoremap <LocalLeader>tt  :FloatermToggle<CR>
tnoremap <LocalLeader>tt  <C-\><C-n>:FloatermToggle<CR>

augroup force_file_maps
  autocmd!
  autocmd BufReadPost *.conf.j2 set filetype=nginx
  autocmd BufReadPost *.html.twig.tmpl set filetype=htmldjango.twig
augroup END

" augroup format_file_types
"   autocmd!
"   autocmd FileType javascript nnoremap <LocalLeader>fr :!npx prettier --write %<CR>
"   autocmd FileType json nnoremap <LocalLeader>fr :%!jq '.'<CR>
" augroup END

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
" Plug 'lumiliet/vim-twig'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-vagrant'
" Plug 'vim-vdebug/vdebug'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" Plug 'lervag/vimtex'
" Plug 'leafgarland/typescript-vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'voldikss/vim-floaterm'
Plug 'hashivim/vim-terraform'

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
" Set vDebug php options
" let g:vdebug_options = { 'port' : 9000, 'timeout' : 20, 'server' : '', 'debug_file_level' : 0, 'debug_file' : '', 'path_maps' : { "/home/deploy/rizk": "/Users/shane.grech/Workspace/rizk/rizk", 'break_on_open': 0 } }

" let g:tex_flavor = 'latex'

" set monokai theme
set termguicolors
colorscheme monokai_pro


let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
" }}}

" Coc Config {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != \"-1\" ? \"\<C-y>\" : \"\<C-g>u\<CR>\"
" else
"  imap <expr> <cr> pumvisible() ? \"\<C-y>\" : \"\<C-g>u\<CR>\"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add `:AutoFix` command to execute tsserver Auto Fix.
command! -nargs=0 AutoFix   :call     CocAction('runCommand', 'tsserver.executeAutofix')

" Add `:OrgImports` command to execute tsserver organize imports.
command! -nargs=0 OrgImports   :call     CocAction('runCommand', 'tsserver.organizeImports')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" Typescript enforce file types {{{
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================
" }}}
