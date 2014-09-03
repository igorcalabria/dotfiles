set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'jpalardy/vim-slime'
call vundle#end()
filetype plugin indent on
"--- Theme
set colorcolumn=80
color xoria256
"--- End Theme

"--- Mappings
let mapleader = ","
map <leader>c <c-_><c-_>
nmap <leader>tt :TagbarToggle<CR>
imap <C-F> <c-r>=expand('%:t:r')<cr>
nnoremap <CR> :noh<CR><CR>
map <leader>p :mksession! .session.vim<CR>

"--- The following commands make the navigation keys work like standard editors
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
"--- Ends navigation commands

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"--- End Mappings

"--- Autoload Session.vim
function! LoadSession()
  let b:sessionfile = getcwd() . "/.session.vim"
  if (filereadable(b:sessionfile))
    let i = input(".session.vim found!, do you want to load it(y,n) ? ")
    if (i == "y")
      exe 'source ' b:sessionfile
      echo "Session loaded!"
    endif
  else
    echo "No session loaded."
  endif
endfunction
au VimEnter * nested :call LoadSession()
"--- End

"--- Toggle maximization of splits(like tmux zoom)
function! MaximizeSplit()
  if exists("s:maximize_session")
    let current_line = line(".")
    let current_col = col(".")
    tabclose
    call cursor(current_line, current_col)
    unlet s:maximize_session
  else
    let s:maximize_session = tempname()
    let current_line = line(".")
    let current_col = col(".")
    tabnew
    b #
    call cursor(current_line, current_col)
  endif
endfunction
nmap <silent> ,z :call MaximizeSplit()<cr>
set showtabline=0
"--- End

"--- Filetype hacks
au BufRead,BufNewFile *.zsh set filetype=sh
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
"--- End filetype hacks

set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
syntax on  "Enables syntax highlighting for programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=2  "How much space Vim gives to a tab
set expandtab
set number  "Enables line numbering
set smarttab  "Improves tabbing
set shiftwidth=2  "Assists code formatting
set hlsearch
set hidden
set incsearch
set foldmethod=manual "Lets you hide sections of code
set wildmenu
set noswapfile
set t_Co=256
set winminheight=0
set winminwidth=0
set updatetime=750
"--- Plugin stuff below...

"---- Indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
"--- End

"--- airline
set laststatus=2
"--- Ends airline

"--- ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
"--- End UltSnips

"--- EasyMotionConfig
let g:EasyMotion_leader_key='<Leader>'
"--- Ends EasyMotionConfig

"--- Ctrlp
let g:ctrlp_match_window = 'max:30'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|venv|target|node_modules|bower_components)$',
  \ 'file': '\v\.(exe|so|dll|class|jar|ttf|png|jpg|pyc)$',
  \ 'link': '',
  \ }
"--- End Ctrlp

"--- vim-gitgutter
highlight clear SignColumn
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'
"--- Ends vim-gitgutter
