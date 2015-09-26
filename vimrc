set nocompatible
filetype off
set modifiable

set scrolljump=5

" Shortcut to rapidly toggle `set list`
nmap <leader>ls :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"""""""""""""""""""""""
" Vim Airline Settings
"""""""""""""""""""""""
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme='kolor'
"let g:airline_theme='laederon'
"let g:airline_theme='light'
let g:airline_theme='murmur'
"let g:airline_theme='luna'
let g:airline_section_b = '%{getcwd()}'
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = "%3p%% %{g:airline_symbols.branch}%#__accent_bold#%4l%#__restore__#:%3c"
let g:airline#extensions#tabline#fnametruncate = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"""""""""""""""""""""""""""""""""""""""
" Enable these options to keep NERDTree
" open all the time
"""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * NERDTree
"autocmd BufEnter * lcd %:p:h
"autocmd VimEnter * wincmd p
"autocmd BufEnter * NERDTreeMirrorOpen
"autocmd VimEnter <C-W>j
"autocmd BufEnter <C-W>j

"""""""""""""""""""""
" NERDTree binding
"""""""""""""""""""""
noremap <leader>t :NERDTreeToggle<cr>
noremap <leader>ntf :NERDTreeFind<cr>
noremap <leader>nf :NERDTreeFocus<cr>
""""""""""""""""""""""""
" YouCompleteMe Settings
""""""""""""""""""""""""
set completeopt=menuone
let g:ycm_add_preview_to_completeopt=0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


set background=dark
colorscheme gruvbox 
set rnu " Toggle number line
set nu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Bundle 'lsdr/monokai'
Plugin 'tpope/vim-surround'
Plugin 'Auto-Pairs'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'jstemmer/gotags'
Plugin 'majutsushi/tagbar'
Plugin 'klen/python-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/swamplight'
Plugin 'vim-scripts/ZoomWin'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/unite.vim'
Plugin 'szw/vim-ctrlspace'
Bundle 'StanAngeloff/php.vim'
Bundle 'mattn/emmet-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'goldfeld/vim-seek'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'valloric/MatchTagAlways'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
"Plugin 'tpope/vim-fugitiv'

call vundle#end()            " required
filetype plugin indent on    " required

let g:bufferline_echo=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = '\'
let g:mapleader = '\'
nmap \ ;
" Fast saving
nmap <leader>w :w!<cr>

" Open new windows to the right and bottom
" Taken from thoughbot's vimrc
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
"set hlsearch
nnoremap <leader>hl :set hlsearch!<cr>


" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""
"Copy paste related stuff
"""""""""""""""""""""""""""
imap <c-d> <esc>ddi


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
set t_Co=256
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
set noundofile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
		        
            
" Be smart when using tabs ;)
"set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
nnoremap <leader>h :tabprevious<cr>
nnoremap <leader>l :tabnext<cr>


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
     "\ if line("'\"") > 0 && line("'\"") <= line("$") |
     "\   exe "normal! g`\"" |
     "\ endif
"Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Ctrl-U to uppper case a word in Insert Mode
inoremap <c-U> <esc>viwU

" vimrc mappings
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


"""""""""""""""""""""""""""""""""""""""""""
" Operator mappings                       "
" """""""""""""""""""""""""""""""""""""""""
" Inside Mappings "
" """""""""""""""""
onoremap p i(
onoremap f i{
onoremap " i"
onoremap ' i'
"""""""""""""""""""""""
" Inside next mappings
" """""""""""""""""""""" 
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
""""""""""""""""""""""""
" Inside last mappings
" """"""""""""""""""""""
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

"""""""""""""""""""""""""""""""""""""""""""



if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


" Go lang stuff
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)

" Map TagBarToggle to <leader>T
nmap <leader>T :TagbarToggle<CR>

" Folding related
nnoremap <Space> za
nnoremap <leader>j zm
nnoremap <leader>k zr

" Pymode related stuff
let g:pymode_rope=0
let g:pymode_folding=1
let g:pymode_lint = 0
let g:pymode_options_max_line_length = 500

" Quit on <leader>q
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
inoremap <C-s> :w<CR>
inoremap <C-q> :q<CR>

" Split | and  -
nnoremap <leader>- :split<CR> 
nnoremap <leader>/ :vsplit<CR> 

" Maximize Buffer
noremap <leader>fu :only<CR>

" No ! I'm not using hjkl keys.
" Moving around windows.
noremap <C-Up> <C-w>k
noremap <C-Down> <C-w>j
noremap <C-Left> <C-w>h
noremap <C-Right> <C-w>l

" Window resizing commands, copied from derekwyatt's github
noremap <silent> <C-F9> :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>

" Best Vim mappings ever !
noremap <Up> k
noremap <Down> j
noremap <Left> h
noremap <Right> l

inoremap <C-O> <Esc>O
inoremap <C-o> <Esc>o
inoremap <C-d> <Esc>caw

noremap <C-B> :CtrlPBuffer<cr>
noremap <leader>p :CtrlP<cr> 
noremap <leader>b :CtrlPBuffer<cr> 

" Switching to previously edited buffer
noremap <Home> :b#<CR>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Useful Buffer Mappings
nnoremap <leader>l :bnext<CR> 
nnoremap <leader>h :bNext<CR> 
nnoremap <C-l> :bnext<CR> 
nnoremap <C-h> :bNext<CR> 
noremap <Tab> :bnext<CR>
noremap <S-Tab> :bNext<CR>

" Ctrl-Space Mappings
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0
let g:CtrlSpaceSaveWorkspaceOnSwitch = 0
let g:CtrlSpaceSaveWorkspaceOnExit = 0
let g:CtrlSpaceUseUnicode = 0
let g:CtrlSpaceProjectRootMarkers =  []

" php stuff 
let g:php_syntax_extensions_enabled = ["bcmath", "bz2", "core", "curl", "date", "dom", "ereg", "gd", "gettext", "hash", "iconv", "json", "libxml", "mbstring", "mcrypt", "mhash", "mysql", "mysqli", "openssl", "pcre", "pdo", "pgsql", "phar", "reflection", "session", "simplexml", "soap", "sockets", "spl", "sqlite3", "standard", "tokenizer", "wddx", "xml", "xmlreader", "xmlwriter", "zip", "zlib"]

" Vundle Mappings 
nnoremap <leader>vi :BundleInstall<cr>
nnoremap <leader>vc :BundleClean<cr>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <leader><leader>1 <Plug>(easymotion-s)
nmap <leader><leader>2 <Plug>(easymotion-s2)

let g:EasyMotion_smartcase = 1

"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)

"map <Leader><leader>w <Plug>(easymotion-w)

au BufRead,BufNewFile *.tpl setl filetype=html.php sw=2 sts=2 et 

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
	\ 'tpl': 1,
    \}


noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
