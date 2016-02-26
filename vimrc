set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
" show functions/vars with ctags
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'steffanc/cscopemaps.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
" python autocomplete
Plugin 'davidhalter/jedi-vim'
" html & css fast coding
Plugin 'mattn/emmet-vim'
" close tag (xml, html ..)
Plugin 'alvan/vim-closetag'
" markdown
Plugin 'gabrielelana/vim-markdown'
" for table support in markdown
Plugin 'godlygeek/tabular'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



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

" toggle paste mode with <F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" omni completion
filetype plugin on
"set omnifunc=syntaxcomplete#Complete


" ## ctags : look for tags from . to home ##
set tags=./tags,tags;$HOME


" ## colors ##
set t_Co=256
let g:molokai_original=1
let g:rehash256 = 1
colorscheme molokai
syntax on


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

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-s-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-s-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-s-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-s-l> :wincmd l<CR>


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



"" ## neocomplete ##
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

    if !exists('g:neocomplete#force_omni_input_patterns')
      let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.c =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
    let g:neocomplete#force_omni_input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    let g:neocomplete#force_omni_input_patterns.objc =
          \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
    let g:neocomplete#force_omni_input_patterns.objcpp =
          \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_default_keymappings = 0
    "let g:clang_use_library = 1


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
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ 13
" enable powerline-fonts
let g:airline_powerline_fonts = 1"


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

" ## Auto-Pairs ##
" auto-pairs workaround for buggy <CR> mapping
let g:AutoPairsMapCR=0
imap <silent><CR> <CR><Plug>AutoPairsReturn

" fast wrap: <|>hello -> <hello>
let g:AutoPairsShortcutFastWrap='<c-s-e>'


" ## emmet (html & css fast coding)
let g:user_emmet_install_global=0
autocmd FileType html,css,php EmmetInstall

" ## closetag.vim (html xml auto close tag)
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames="*.html,*.xhtml,*.phtml,*.php"

set smartindent
