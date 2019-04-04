" Top-level setup >>>>>>>>>>>>>>
syntax on
set number
set relativenumber
colorscheme PaperColor 
set expandtab
set shiftwidth=2
set autochdir
set hidden
set shell=/bin/zsh
set splitbelow
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

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

" Enhances repeatability in visual mode
vnoremap . :normal .<CR>

" Simplifies macros
nnoremap <space> @q
vnoremap <space> :normal @q<CR>

" Adds BufOnly (close all but current buffer)
command! BufOnly silent! execute "%bd|e#|bd#"
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Custom javascript commands >>>>>>>>>>>>
" Append a comma and open a new line (useful for adding to objects)
nnoremap to A,
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Fzf >>>>>>>>>>>>>>>>>>> 
set rtp+=/usr/local/opt/fzf

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

" Makes ctrlp an alias for :Files
nnoremap <C-P> :ProjectFiles<CR>

" Makes ctrlb an alias for :Buffers
nnoremap <C-B> :Buffers<CR>
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
nmap <silent> gt <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
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


" Better comments >>>>>>>>>>>>>
let g:bettercomments_language_aliases = { 'javascript': 'js' }
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Ale >>>>>>>>>>>>>>>
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <silent> [w <Plug>(ale_previous_wrap)
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Plugins >>>>>>>>>>>>>>>>>
call plug#begin('~/.vim/plugged')
" General-purpose plugins
Plug 'vim-scripts/ReplaceWithRegister'
" sort-motion ?
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'jbgutierrez/vim-better-comments'
Plug 'tpope/vim-endwise'
" Language-specific plugins
Plug 'pangloss/vim-javascript'
Plug 'jason0x43/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'remyoudemans/vim-jesture'
Plug 'ianks/vim-tsx'
call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<
