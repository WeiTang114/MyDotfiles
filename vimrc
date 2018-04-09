:" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" the following are examples of different formats supported.
" keep plug commands between vundle#begin/end.
" plugin on github repo
Plug 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
" show functions/vars with ctags
Plug 'majutsushi/tagbar'
"Plug 'Shougo/neocomplete.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'kien/ctrlp.vim'
Plug 'cohama/lexima.vim'
"Plug 'steffanc/cscopemaps.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdcommenter'
" python autocomplete
"Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" html & css fast coding
Plug 'mattn/emmet-vim'
" close tag (xml, html ..)
Plug 'alvan/vim-closetag'
" markdown
Plug 'gabrielelana/vim-markdown'
" for table support in markdown
Plug 'godlygeek/tabular'
" split maxmize-restore by <F3>
Plug 'szw/vim-maximizer'
" pythonmode
Plug 'python-mode/python-mode', { 'for': 'python' }

" deoplete (neocomplete replace for vim8.0)
" NEEDS INSTALL pip3 install --user neovim
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-jedi'
" show doc (argumetns) when typing a function (especially python)
" jedi-vim has this function, while deplete-jedi needs this extension
Plug 'Shougo/echodoc.vim'

" vim-go
" NEEDS INSTALL STEPS on github
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }

Plug 'Shougo/denite.nvim'

" c++ c format
Plug 'rhysd/vim-clang-format'

call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" ## basic setups ##
" set leader to ,
let mapleader=","
set background=dark
set nu
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set whichwrap+=<,>,h,l,[,]
set hlsearch
set encoding=utf-8
set backspace=indent,eol,start
set smartcase
" lines always seen below or behind the cursor
set scrolloff=8
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winheight(0) * 2/3)<CR>

nnoremap <Leader>v :vertical resize 
" http://stackoverflow.com/questions/7163947/paste-multiple-times
xnoremap p pgvy

" toggle paste mode with <F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set noeb vb t_vb=

" omni completion
"set omnifunc=syntaxcomplete#Complete

"don't fold by default
set foldlevel=99

" don't replace tab with space
autocmd FileType proto set noexpandtab
autocmd FileType proto set smartindent

autocmd FileTYpe c,cpp,h set smartindent 
    
    


" ## ctags : look for tags from . to home ##
set tags=./tags,tags;$HOME


" ## colors ##
set t_Co=256
let g:molokai_original=1
let g:rehash256 = 1
colorscheme molokai
syntax on
highlight Visual term=reverse ctermbg=White ctermfg=Black


" ## tabs ##
let tabMinWidth=0
let tabMaxWidth=40
let tabMinWidthResized=15
let tabScrollOff=5
let tabEllipsis="..."
let tabDivideEquel=0
set showtabline=2
set ambiwidth=double

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>


" ## buffers ##
" switching buffers without saving warning
set hidden

nnoremap bn :bn<CR>
nnoremap bf :bp<CR>
nnoremap bg :e#<CR>
nnoremap b1 :1b<CR>
nnoremap b2 :2b<CR>
nnoremap b3 :3b<CR>
nnoremap b4 :4b<CR>
nnoremap b5 :5b<CR>
nnoremap b6 :6b<CR>
nnoremap b7 :7b<CR>
nnoremap b8 :8b<CR>
nnoremap b9 :9b<CR>
nnoremap b0 :10b<CR>


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-s-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-s-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-s-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-s-l> :wincmd l<CR>
set splitright
set splitbelow


" ## Tagbar outliner ##
nmap <F8> :TagbarToggle<CR>




" ## clangcomplete ##
let g:clang_use_library=1
if has('mac')
    let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
elseif has('unix')
    let g:clang_library_path='/usr/lib/x86_64-linux-gnu/libclang.so.1'
endif

" if there's an error, allow us to see it
let g:clang_complete_copen=0
let g:clang_hl_errors=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Limit memory use
let g:clang_memory_percent=70
" Remove -std=c++11 if you don't use C++ for everything like I do.
let g:clang_user_options=' -std=c++11 || exit 0'
" Set this to 0 if you don't want autoselect, 1 if you want autohighlight,
" and 2 if you want autoselect. 0 will make you arrow down to select the first
" option, 1 will select the first option for you, but won't insert it unless you
" press enter. 2 will automatically insert what it thinks is right. 1 is the most
" convenient IMO, and it defaults to 0.
let g:clang_auto_select=1

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

let g:clang_periodic_quickfix=0
let g:clang_jumpto_declaration_key=""
let g:clang_jumpto_declaration_in_preview_key=""




" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set completeopt=longest,menuone


" ## deoplete ##
" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#enable()

" for tab to select options
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" ## cscope ##
if has("cscope")
  let &csprg=substitute(system('which cscope'), '\n\+$', '', '')
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" ## airline ##
set laststatus=2
"set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ 13
set guifont=Monaco\ for\ Powerline\ 12.5
" enable powerline-fonts
let g:airline_powerline_fonts = 1"
" show opened buffers
let g:airline#extensions#tabline#enabled = 1


" ## NERDTree ##
autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeMapOpenInTab='<ENTER>'
map <f9> :NERDTreeToggle<CR>

" ## emmet (html & css fast coding)
let g:user_emmet_install_global=0
autocmd FileType html,css,php EmmetInstall

" ## closetag.vim (html xml auto close tag)
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames="*.html,*.xhtml,*.phtml,*.php"

" ## python-mode
let g:pymode_rope_goto_def_newwin = "new" " open found definition in new window
let g:pymode_python='python3'
let g:pymode_lint_on_write=1
let g:pymode_trim_whitespaces=1
let g:pymode_lint_checkers=['pyflakes', 'pep8', 'mccabe', 'pylint'] 
let g:pymode_indent=2
"let g:pymode_lint_ignore = "C0111"
let g:pymode_lint_options_pylint = {'disable':'C0111'}

" disable autocompletion by pymode, use jedi-vim &neo complete
" due to conflict with jedi-vim. 
" (don't want to auto-select first complete item)
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope=0
autocmd BufWritePost *.py :PymodeLintAuto


" ## vim-go
" auto import at save
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1


" ## denite
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', 'dd', '<denite:do_action:delete>', 'noremap')
noremap .d :Denite -auto-resize -highlight-mode-insert=Search file_rec buffer<CR>
noremap .b :Denite -auto-resize -highlight-mode-insert=Search buffer<CR>
noremap .j :Denite -auto-resize -highlight-mode-insert=Search jump<CR>
noremap .l :Denite -auto-resize -highlight-mode-insert=Search line<CR>
noremap .p :Denite -auto-resize -highlight-mode-insert=Search file_rec<CR>
noremap .r :Denite -auto-resize -highlight-mode-insert=Search outline<CR>


" ## deoplete-jedi
"set omnifunc=jedi#completions
setlocal omnifunc=python3complete#Complete


let g:python3_host_prog = '/usr/local/bin/python3'


" ## vim-clang-format
" auto format on saving
let g:clang_format#auto_format=1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "UseTab" : "false",
            \ "ColumnLimit" : 0,
            \ "BreakBeforeBraces" : "Linux",}

