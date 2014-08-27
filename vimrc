set nocompatible

" Pathogen
execute pathogen#infect()
execute pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
" Nerdtree
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
 

set background=dark
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set whichwrap+=<,>,h,l,[,] 

set t_Co=256
let g:molokai_original=1 
let g:rehash256 = 1 
colorscheme molokai


" tabs
let tabMinWidth=0
let tabMaxWidth=40
let tabMinWidthResized=15
let tabScrollOff=5
let tabEllipsis="..."
let tabDivideEquel=0
set showtabline=2
set ambiwidth=double
map <C-q>:tabp<cr>
map <C-w>:tabn<cr>

map <f9>:Tlist<CR>


"ctags : look for tags from . to home
set tags=./tags,tags;$HOME


"auto load plugins 
"just copy the plugin directory in ~/.vim/bundle/
call pathogen#infect() 

"Tagbar outliner
nmap <F8> :TagbarToggle<CR>



set hlsearch


set encoding=utf-8
