syntax on
colorscheme PaperColor 
set number
set expandtab
set shiftwidth=2
let g:gitgutter_grep=''
autocmd StdinReadPre * let s:std_in=1

set statusline+=%#warningmsg#
set statusline+=%*

set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=/usr/local/opt/fzf

" autocmd BufWritePost *.ts,*.tsx call tslint#run('a', get_winid())
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](node_modules|build|.git)$',
	\ }
command! Files CtrlP


" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gy <Plug>(coc-type-definition)

"let g:tsuquyomi_definition_split = 3
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

"augroup tslint
"  function! s:typescript_after(ch, msg)
"   let cnt = len(getqflist())
"    if cnt > 0
"      echomsg printf('[Tslint] %s errors', cnt)
"    endif
"  endfunction
"  let g:tslint_callbacks = {
"    \ 'after_run': function('s:typescript_after')
"    \ }
"
"  let g:tsuquyomi_disable_quickfix = 1
"  function! s:ts_quickfix()
"    let winid = win_getid()
"    execute ':TsuquyomiGeterr'
"    call tslint#run('a', winid)
"  endfunction
"
"  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
"  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
"augroup END

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Set the directory you started in as the root for ctrlp
let g:ctrlp_working_path_mode = 0

command Rc e ~/.vimrc

" Simplifies split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-]> :bn<CR>
nnoremap <C-[> :bp<CR>

tnoremap <C-\> <C-\><C-N>

inoremap <C-H> <left>
inoremap <C-J> <down>
inoremap <C-K> <up>
inoremap <C-L> <right>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

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
" Plug 'heavenshell/vim-tslint'
Plug 'w0rp/ale'
" Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'simeji/winresizer'
Plug 'airblade/vim-gitgutter'
call plug#end()

