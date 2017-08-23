syntax on
filetype off
set laststatus=2
set number
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set mouse=a
set wildmenu
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
   set wildignore+=.git\*,.hg\*,.svn\*
else
   set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
command W w !sudo tee % > /dev/null
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/neocomplete.vim'
Plugin 'quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'jceb/vim-orgmode'
call vundle#end()
let g:neocomplete#enable_at_startup = 1
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
augroup CursorLine
 au!
 au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
au WinLeave * setlocal nocursorline
augroup END
nnoremap <C-K> :call HighlightNearCursor()<CR>
function HighlightNearCursor()
 if !exists("s:highlightcursor")
   match Todo /\k*\%#\k*/
   let s:highlightcursor=1
 else
   match None
   unlet s:highlightcursor
 endif
endfunction
filetype plugin indent on
