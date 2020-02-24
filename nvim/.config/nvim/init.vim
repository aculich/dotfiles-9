let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

let g:loaded_2html_plugin      = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_netrw             = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1

let mapleader = ","

"========================================="
" plugins
"========================================="
if &compatible
 set nocompatible
endif
filetype off

if empty( glob($CONFIG . '/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

set rtp+=~/.config/nvim/plugged/vim-plug

set tags+=tags
call plug#begin($CONFIG . '/nvim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'itchyny/lightline.vim'
  Plug 'justinmk/vim-dirvish'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'kassio/neoterm'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'

  Plug 'tomtom/tcomment_vim'
  " Plug 'tpope/vim-surround'
  " Plug 'tpope/vim-repeat'

  " Plug 'prabirshrestha/async.vim'
  " Plug 'prabirshrestha/asyncomplete.vim'
  " Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'mattn/vim-lsp-settings'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "
  Plug 'editorconfig/editorconfig-vim'
  Plug 'hashivim/vim-terraform' , { 'for': 'terraform' }

  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

call plug#end()

filetype plugin indent on

"========================================="
" Basic settings
"========================================="
set autoread
set autowrite
set backspace=indent,eol,start
set confirm
set encoding=utf-8
set expandtab
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp
set fileformats=unix,dos,mac
set gdefault
set hidden
set hlsearch
set history=200
set incsearch
set ignorecase
set laststatus=2
set number
set nobackup
set noerrorbells
set noswapfile
set nowritebackup
set pastetoggle=<C-E>
set ruler
set scrolloff=8
set shiftwidth=2
set showcmd
set showmode
set smartcase
set smartindent
set softtabstop=2
set splitright
set splitbelow
set suffixesadd+=.rb
set tabstop=2
set title
set t_Co=256
set vb t_vb=
set wildmenu
set wildmode=full
set wrapscan

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

set noshowmatch
set nocursorcolumn
set lazyredraw

set ttyfast

set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=128
set re=1

syntax enable

augroup ColorScheme
  autocmd!
  autocmd Colorscheme * highlight Normal ctermbg=none
  autocmd Colorscheme * highlight NonText ctermbg=none
  autocmd Colorscheme * highlight LineNr ctermbg=none ctermbg=none
  autocmd Colorscheme * highlight Folded ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
  autocmd Colorscheme * highlight Search ctermbg=none ctermbg=none

augroup END

"========================================="
" Keymap settings
"========================================="
nmap ; :Buffers
" nmap t :Files
" nmap r :Tags
nmap f :Rg<Space>

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-h> <Backspace>
inoremap <C-d> <Del>
inoremap <C-[> <ESC>

nnoremap <Leader>tt :Ttoggle<CR>
tnoremap <Leader>tt <C-\><C-n>:Ttoggle<CR>
tnoremap <C-[> <C-\><C-n>

nnoremap <silent> <C-p> :FZFFileList<CR>
nnoremap <silent> <C-x><C-f> :FZFCd<CR>

" - buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" - split window
nnoremap <C-x>1 :only<CR>
nnoremap <C-x>2 :split<CR>
nnoremap <C-x>3 :vsplit<CR>
nnoremap <C-x>4 :close<CR>

" - highlight
nnoremap <silent> <C-L> :noh<C-L><CR>

let s:ignore_patterns = [
    \ '__pycache__/',
    \ '__pycache__',
    \ '\.git',
    \ '\.gitmodules',
    \ '*\.meta',
    \ '*\.min\.js',
    \ '*\.o',
    \ '*\.pyc',
    \ '*\.sqlite3',
    \ '*\.swp',
    \ '*\.csproj',
    \ '*\.sln',
    \ '*\.unityproj',
    \ '*\.userprefs',
    \ '\.sass-cache',
    \ 'tags',
    \ ]

set wildignore+=\.hg,\.git,\.svn                      " Version control
set wildignore+=*\.aux,*\.out,*\.toc                  " LaTeX intermediate files
set wildignore+=*\.jpg,*\.bmp,*\.gif,*\.png,*\.jpeg   " binary images
set wildignore+=*\.o,*\.obj,*\.exe,*\.dll,*\.manifest " compiled object files
set wildignore+=*\.spl                                " compiled spelling word lists
set wildignore+=*\.sw?                                " Vim swap files
set wildignore+=*\.DS_Store                           " OSX bullshit
set wildignore+=*\.luac                               " Lua byte code
set wildignore+=*\.vagrant                            " Vagrant
set wildignore+=go/pkg                                " Go static files
set wildignore+=go/bin                                " Go bin files
set wildignore+=go/bin-vagrant                        " Go bin-vagrant files
set wildignore+=*\.pyc                                " Python byte code
set wildignore+=*/tmp/*,*\.so,*\.swp,*\.zip           " MacOSX/Linux
set wildignore+=*\\tmp\\*,*\.swp,*\.zip,*\.exe        " Windows

function! s:ChangeCurrentDirectory()
  let l:dir = expand("%:p:h")
  if isdirectory(fnamemodify(l:dir, ":p"))
    execute printf('lcd `=%s`', string(fnamemodify(l:dir, ":p")))
  endif
endfunction

autocmd BufEnter * call s:ChangeCurrentDirectory()
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
autocmd BufWritePre * :%s/\s\+$//e
autocmd InsertLeave * set nopaste
"
" augroup TemplatesAu
"   autocmd!
"   autocmd BufNewFile *.c       0r $HOME/.vim/templates/tpl.c
"   autocmd BufNewFile *.cpp     0r $HOME/.vim/templates/tpl.cpp
"   autocmd BufNewFile *.cs      0r $HOME/.vim/templates/tpl.cs
"   autocmd BufNewFile *.go      0r $HOME/.vim/templates/tpl.go
"   autocmd BufNewFile *.html    0r $HOME/.vim/templates/tpl.html
"   autocmd BufNewFile *.java    call NewJavaFile()
"   autocmd BufNewFile *.proto   0r $HOME/.vim/templates/tpl.proto
"   autocmd BufNewFile *.py      0r $HOME/.vim/templates/tpl.py
"   autocmd BufNewFile *.rb      0r $HOME/.vim/templates/tpl.rb
"   autocmd BufNewFile *.service 0r $HOME/.vim/templates/tpl.service
"   autocmd BufNewFile Makefile  0r $HOME/.vim/templates/tpl.Makefile
"   autocmd BufNewFile README.md 0r $HOME/.vim/templates/tpl.README.md
"   autocmd BufNewFile docker-compose.* 0r $HOME/.vim/templates/tpl.docker-compose.yml
" augroup END

augroup FileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf*  setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.cafe setf cafe
  autocmd BufNewFile,BufRead *.cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *.go,go.mod setlocal noet tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *.go.testing setlocal noet tabstop=4 shiftwidth=4 softtabstop=4
  " autocmd BufWritePre *.go GoFmt
  autocmd BufNewFile,BufRead *_test.go setlocal filetype=go.testing tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufNewFile,BufRead *Test.php setlocal filetype=php.phpunit
  autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
  autocmd BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType javascript setlocal smartindent cinwords=if,else,for,while,try,except,finally,def,class
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType cs setlocal  tabstop=4 shiftwidth=4 softtabstop=4
  " autocmd BufWritePre *.cs OmniSharpCodeFormat
  autocmd FileType yml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead Dockerfile*  setf dockerfile
  autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType scala setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType make setlocal noexpandtab
  autocmd FileType gitconfig setlocal noexpandtab
  autocmd FileType rego setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType hs setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
augroup END

""
set list listchars=tab:»\ ,
set background=dark
colorscheme solarized

function! InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'botright'

function! LightlineModified() abort
  return &buftype ==# 'terminal' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline = {
\   'colorscheme': 'powerline',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'branch' ],
\       [ 'readonly', 'filename', 'modified' ],
\     ],
\     'right': [
\       [ 'lineinfo' ],
\       [  ],
\       [ 'filetype' ],
\       [  ],
\       [ ],
\     ],
\   },
\   'inactive': {
\     'left': [
\       [  ],
\       [  ],
\       [ 'readonly', 'filename' ],
\     ],
\     'right': [
\       [ 'lineinfo' ],
\       [  ],
\       [ 'filetype' ],
\     ],
\   },
\   'component_function':{
\     'branch': 'fugitive#head',
\     'modified': 'LightlineModified',
\     'filename' : 'LightlineFilename'
\   },
\ }

" dirvish
augroup dirvish_commands
  autocmd!
  autocmd FileType dirvish nnoremap <silent> <buffer> <C-r> :<C-u>Dirvish %<CR>
  autocmd FileType dirvish unmap <silent> <buffer> <CR>
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
  autocmd FileType dirvish nnoremap <silent> <buffer> <CR> :<C-u> call <SID>dirvish_open()<CR>
  autocmd FileType dirvish setlocal nonumber norelativenumber
  autocmd FileType dirvish nnoremap <buffer><silent> <C-j> <C-\><C-n>j:call feedkeys("p")<CR>
  autocmd FileType dirvish nnoremap <buffer><silent> <C-k> <C-\><C-n>k:call feedkeys("p")<CR>
  "autocmd FileType dirvish silent! keeppatterns g@\v/\.[^\/]+/?$@d

  " au User DirvishEnter let b:dirvish.showhidden = 1
  for pat in s:ignore_patterns
    autocmd FileType dirvish silent! keeppatterns g@\v/\.pat./?$@d
  endfor
augroup END

" snippets
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<C-N>"
    else
      return "\<TAB>"
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif
  return ""
endfunction

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:UltiSnipsExpandTrigger = "<tab>"

if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
" fzf
command! FZFCd call fzf#run({
  \ 'down': '50%',
  \ 'source': 'find . -type d -maxdepth 5',
  \ 'sink': 'e'})
command! FZFFileList call fzf#run({
  \ 'down': '50%',
  \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
  \ 'sink': 'e'})
command! -bang -nargs=* Ripgrep
  \ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
	\   <bang>0)

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.config/local/share/fzf-history'
