if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"





" micah added the following to the rhel's initial vimrc:
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
"set ignorecase         " Do case insensitive matching
"set smartcase          " Do smart case matching
"set incsearch          " Incremental search
"set autowrite          " Automatically save before commands like :next and
":make
"set hidden             " Hide buffers when they are abandoned
set mouse=a             " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

  " vvvvvvvvv micah's vimisms vvvvvvvv
  set number
  set hlsearch
  set incsearch
  set ruler
  set shiftwidth=4
  set autoindent
  set smartindent
  colorscheme darkblue
  let $MYVIMRC = "/usr/share/vim/vimrc"
  let mapleader = "-"
  nnoremap <leader>ok 0r✓
  nnoremap <leader>ok 0i✓ <esc>:.s/✓  /✓ /<cr>:.s/✓  /✓ /<cr> 
" replace first character of line, presumably a comment indicator, with a
" space.  would prefer to allow to replace with any character desired and to
" return the cursor position. don't think i can use ctrl-o as the current
" cursor position may not be on the jumplist.
  nnoremap <leader>0<space> 0r<space>;
  nnoremap <leader>0# 0r#
  nnoremap <leader>viv :split $MYVIMRC<cr> 
  nnoremap <leader>sov :source $MYVIMRC
  nnoremap <leader><leader> :
  nnoremap <leader>a @

  inoremap fj <esc>
  vnoremap fj <esc>
  inoremap <Tab> <C-N>
  vnoremap <Tab> <C-N>

