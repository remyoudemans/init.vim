" Top-level setup >>>>>>>>>>>>>>
syntax on
set number
colorscheme PaperColor 
set expandtab
set shiftwidth=2
set hidden

" Stops netrw tree from opening
let loaded_netrwPlugin = 1

"Editing and refreshing config file shortcuts
command Rc e $MYVIMRC
command Freshrc so $MYVIMRC
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" General remappings >>>>>>>>>
" Simplifies split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Simplifies buffer navigation
nnoremap <C-]> :bn<CR>
nnoremap <C-[> :bp<CR>

" Simplifies exiting terminal mode
tnoremap <C-\> <C-\><C-N>

" Simplifies insert mode navigation
inoremap <C-H> <left>
inoremap <C-J> <down>
inoremap <C-K> <up>
inoremap <C-L> <right>

" Makes deletions in insert mode undoable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" CtrlP >>>>>>>>>>>>>>>>>>>>> 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Set the directory you started in as the root for ctrlp
let g:ctrlp_working_path_mode = 0

let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](node_modules|build|.git)$',
	\ }

" Overrides fzf's Files command with ctrlp
command! Files CtrlP
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Fzf >>>>>>>>>>>>>>>>>>> 
set rtp+=/usr/local/opt/fzf
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Coc >>>>>>>>>>>>>>>>>>>>>>>> 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gy <Plug>(coc-type-definition)
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" NERDComment >>>>>>>>>>>>>>>>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Airline >>>>>>>>>>>>>>>>>>
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Plugins >>>>>>>>>>>>>>>>>
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'jason0x43/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'simeji/winresizer'
call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<
