set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=1000

set encoding=utf8
set t_Co=256
set t_ti=
set t_te=
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>
"colorscheme desert256
syntax on

" fance crosshair
set nocursorcolumn
set cursorline
set foldmethod=marker
set foldclose=all

set t_vb=
set cmdheight=2
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :call ToggleMouse()<CR>
function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
		echo "Mouse usage DISABLED"
	else
		set mouse=a
		echo "Mouse usage ENABLED"
	endif
endfunction
map Y y$
set nocompatible
set iskeyword+=:
set bs=2
set backup
set backupdir=~/.vim/backup/
set swapfile
set directory=~/.vim/temp/
set nonumber
set noinsertmode
set ruler
set incsearch
set nohlsearch
set showmatch
set path=.,~/
set undolevels=1000
set updatecount=50
set ttyfast
set report=0
set enc=utf-8
set wildmenu
set hidden
set showcmd
set tenc=utf-8
set fileformat=unix
set showmatch
set noexpandtab " Used to be expandtab not noexpandtab
set autoindent
set nostartofline
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nomodeline
set nohlsearch
set ignorecase
set smartcase
set novisualbell
set noerrorbells
set lazyredraw
set backspace=indent,eol,start
set autoread

set laststatus=2

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
hi EOLWS ctermbg=red

"if (&termencoding == "utf-8") || has("gui_running")
"    if v:version >= 700
"        set list listchars=tab:»·,trail:,extends:…,nbsp:‗
"    else
"        set list listchars=tab:»·,trail:,extends:…
"    endif
"else
"    if v:version >= 700
"        set list listchars=tab:>-,trail:,extends:>,nbsp:_
"    else
"        set list listchars=tab:>-,trail:,extends:>
"    endif
"endif

if has("unix")
    if !isdirectory(expand("~/.vim/"))
        !mkdir -p ~/.vim/backup/
        !mkdir -p ~/.vim/temp/
    endif
endif

"if has("folding")
"    set foldenable
"    set foldmethod=indent
"    set foldlevelstart=99
"endif

if has("title")
    set title
endif

filetype on
filetype indent on
filetype plugin on

if has("autocmd")
    autocmd BufNewFile,BufRead *.txt                     setf txt
    autocmd FileType mail,txt set nohlsearch formatoptions+=t textwidth=72 spell spelllang=en nonu
endif

let g:secure_modelines_verbose = 1
let g:secure_modelines_modelines = 15

map <F6> <Esc>:setlocal spell spelllang=en_us<CR>
map <F7> <Esc>:setlocal nospell<CR>
nmap <F5> :make<cr>
nnoremap <C-L> :nohl<CR><C-L>
let g:tex_flavor='latex'
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set mouse=a
set pastetoggle=<F2>

au BufNewFile,BufRead *.dm setfiletype dm
