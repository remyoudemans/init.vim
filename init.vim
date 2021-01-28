 " Top-level setup >>>>>>>>>>>>>>
syntax on
set number
set relativenumber
set termguicolors
set mmp=5000

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#ffffff' gui=underline ctermfg=255 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

nmap <leader>q <plug>(QuickScopeToggle)

set expandtab

" for back end work
set shiftwidth=2
set tabstop=2

au BufNewFile,BufRead .eslintrc setlocal ft=json
au BufNewFile,BufRead .stylelintrc setlocal ft=json
au BufNewFile,BufRead .babelrc setlocal ft=json
au BufNewFile,BufRead .prettierrc setlocal ft=json

" for front end work
" set shiftwidth=4
" set tabstop=4

nnoremap j gj
nnoremap k gk

set autochdir
set hidden
set shell=/bin/zsh
set splitbelow
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" Enable live substitution
if has('nvim')
  set inccommand=nosplit
endif

au BufReadPost *.svelte set syntax=html 


"Editing and refreshing config file shortcuts
" command Rc e $MYVIMRC
" command Freshrc so $MYVIMRC
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" General remappings >>>>>>>>>
" Simplifies split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Simplifies repetition
nnoremap <leader>n n.
nnoremap <leader>N N.

" Simplifies command mode navigation
cnoremap <C-L> <right>
cnoremap <C-H> <left>


" Simplifies exiting terminal mode
tnoremap <C-\> <C-\><C-N>

" Simplifies insert mode navigation
inoremap <C-H> <left>
inoremap <C-J> <down>
inoremap <C-K> <up>
inoremap <C-L> <right>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" " Automatically closes brackets/parentheses/quotes in insert mode
" inoremap ( ()<left>
" inoremap () ()
" inoremap [ []<left>
" inoremap [] []
" inoremap { {}<left>
" inoremap {} {}
" inoremap {<CR> {<CR>}<ESC>O

" Makes deletions in insert mode undoable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Enhances repeatability in visual mode
vnoremap . :normal .<CR>

" nnoremap <space> l
nnoremap <Space> i<Space><Right><ESC>

" Adds BufOnly (close all but current buffer)
command! BufOnly silent! execute "%bd|e#|bd#"
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Custom javascript commands >>>>>>>>>>>>
" Append a comma and open a new line (useful for adding to objects)
nnoremap to A,
"  shortcut for making todos
nnoremap <leader>td A // TODO:
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Fzf >>>>>>>>>>>>>>>>>>> 
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -bang -nargs=+ -complete=dir AgRaw call fzf#vim#ag_raw(<q-args>, <bang>0)

function! Rag(...)
  echom "AgRaw " . a:1 . ' ' . s:find_git_root()
  execute "AgRaw " . a:1 . ' ' . s:find_git_root()
endfunction


function! Rack(...)
    echom "Ack " . a:1 . ' ' . s:find_git_root()
    execute "Ack " . a:1 . ' ' . s:find_git_root()
endfunction

function! CRack()
    echom "Ack " . expand("<cword>") ' ' . s:find_git_root()
    execute "Ack " . expand("<cword>") ' ' . s:find_git_root()
endfunction

function! Env()
  echom "e " . s:find_git_root() . '.env'
  execute "e " . s:find_git_root() . '/.env'
endfunction

command! Env call Env()

function! CallPrettier(...)
  execute '! npm run format -- %:p'
endfunction

command! CallPrettier call CallPrettier()
nnoremap <leader>cp :CallPrettier<CR>
" Searches from the git root (much more useful than searching from the current
" buffer's directory
command! -nargs=+ Rag call Rag(<q-args>)

command! -nargs=+ Rack call Rack(<q-args>)

command! CRack call CRack()

nnoremap <leader>ss :CRack<CR>


" " makes <leader>fi fix-up imports (space them correctly and remove semicolons, then write)
" nnoremap <leader>fi :%s/import {\([^ ]\+\)}/import { \1 }/ <bar> %s/;//g <bar> w <CR>

" Makes ctrlp an alias for :GFiles
nnoremap <C-P> :GFiles<CR>

" Makes ctrlb an alias for :Buffers
nnoremap <C-B> :Buffers<CR>
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Coc >>>>>>>>>>>>>>>>>>>>>>>> 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gt <Plug>(coc-definition)
nmap <silent> gvt :vs <CR><C-l>gt
nmap <silent> ght :sp <CR>gt
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gvi :vs <CR><C-l>gi
nmap <silent> ghi :sp <CR>gi
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gvy :vs <CR><C-l>gy
nmap <silent> ghy :sp <CR>gy
nmap <silent> ga <Plug>(coc-references)
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<

nmap <silent> vot :vs <CR><C-l>:e /Users/remy.oudemans/Documents/oodle-react-ui-library/src/theme/colors.js<CR>

nmap <silent> sot :sp <CR><C-j>:e /Users/remy.oudemans/Documents/oodle-react-ui-library/src/theme/colors.js<CR>


" Fugitive >>>>>>>>>>>>>>>>>>
" remap for git status
nmap <leader>gs :Gst<CR>
nmap <leader>gpn :!git branch <bar> grep \* <bar> cut -d ' ' -f2 <bar> xargs git push -u origin<CR>


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

" ignore certain buffer names (not terminal) for showing tab
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<


" Better comments >>>>>>>>>>>>>
let g:bettercomments_language_aliases = { 'javascript': 'js' }
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<

" make return implicit
nmap <leader>ri ds{frdt(:w<CR>


" Ale >>>>>>>>>>>>>>>
nmap <silent> ]w <Plug>(ale_next_wrap)
nmap <silent> [w <Plug>(ale_previous_wrap)
let g:ale_linter_aliases = {'jsx': ['css', 'javascript'], 'ts': ['css', 'javascript'], 'svelte': ['css', 'javascript']}
let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint'], 'ts': ['stylelint', 'eslint'], 'svelte': ['stylelint', 'eslint']}
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Prettier >>>>>>>>>>>>>>>>>>>
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Ultisnsips Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-s>"
" <<<<<<<<<<<<<<<

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'tpope/vim-endwise'
Plug 'robbles/logstash.vim'
Plug 'ayu-theme/ayu-vim'
" Plug 'townk/vim-autoclose'
Plug 'unblevable/quick-scope'
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jparise/vim-graphql'
Plug 'wincent/ferret'
Plug 'junegunn/gv.vim'
" Plug 'sheerun/vim-polyglot' !! tsx syntax highlighting breaks with this on.
" Language-specific plugins
Plug 'mxw/vim-jsx'
" post install then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'remyoudemans/vim-jesture'
Plug 'ianks/vim-tsx'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

" Ultisnips
Plug 'SirVer/ultisnips'
call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<

" colorscheme PaperColor 
" let ayucolor = "light"
let ayucolor = "mirage"
" let ayucolor = "dark"
colorscheme ayu

let g:airline_theme='powerlineish'
