" Top-level setup >>>>>>>>>>>>>>
syntax on
set number
set relativenumber
colorscheme PaperColor 
set expandtab
set shiftwidth=2
set hidden

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


" Deoplete >>>>>>>>>>>>>>>>>>>
let g:deoplete#enable_at_startup = 1
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Racer >>>>>>>>>>>>>>>>>>>>>
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


let g:racer_cmd = "/Users/remyoudemans/.cargo/bin/racer"
" Plugins >>>>>>>>>>>>>>>>>
call plug#begin('~/.vim/plugged')
" General-purpose plugins
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
" Language-specific plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<
