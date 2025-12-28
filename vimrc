" ==========================================
"  MyDotfiles Modern Vim Configuration
" ==========================================

" --- 1. Plugins (Vim-Plug) ---
call plug#begin('~/.vim/plugged')

" Essentials
Plug 'tpope/vim-fugitive'        " Git integration
Plug 'tpope/vim-fugitive'        " Git integration
Plug 'preservim/nerdcommenter'   " Commenter
Plug 'vim-airline/vim-airline'   " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'    " Colors
Plug 'liuchengxu/vista.vim'      " Modern Code Outline (LSP)

" Modern Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP & Completion (The VSCode killer)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'          " Fuzzy finder

" Syntax & Language Support
Plug 'sheerun/vim-polyglot'      " Multi-language syntax support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'           " HTML/CSS expansion
Plug 'alvan/vim-closetag'        " Auto close HTML tags

call plug#end()

" --- 2. Basic Settings ---
let mapleader=","
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
set number
set cursorline            " Highlight current line
set expandtab             " Use spaces instead of tabs
set tabstop=4
set shiftwidth=4
set smartindent
set mouse=a               " Enable mouse
set hidden                " Allow switching buffers without saving
set nobackup
set nowritebackup
set updatetime=300        " Faster completion
set shortmess+=c          " Don't pass messages to |ins-completion-menu|
set signcolumn=yes        " Always show sign column (for lints)
set splitright
set splitbelow
set scrolloff=8           " Keep cursor in middle
set backspace=indent,eol,start

" Performance
set timeoutlen=400        " Faster leader key response
set ttimeoutlen=0         " No delay for key codes

" Colors
set t_Co=256
set background=dark
try
    colorscheme molokai
catch
    colorscheme desert
endtry

" --- 3. Key Mappings ---

" Fast saving
nmap <leader>w :w<CR>

" Window navigation (Ctrl+h/j/k/l)
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" Quick Buffer Switching (Shift+H / Shift+L)
nnoremap H :bp<CR>
nnoremap L :bn<CR>

" NERDTree -> Coc-explorer
" Install via: :CocInstall coc-explorer
nmap <F9> :CocCommand explorer<CR>

" Fzf (Ctrl+P replacement)
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Rg<CR>

" Tagbar -> Vista
" Uses Coc (LSP) instead of ctags
let g:vista_default_executive = 'coc'
nmap <F8> :Vista!!<CR>

" --- 4. Coc.nvim Configuration (The Magic) ---

" Use Tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting
command! -nargs=0 Format :call CocActionAsync('format')
nmap <leader>fm :Format<CR>

" --- 5. Language Specific ---

" Go
let g:go_def_mapping_enabled = 0 " Let Coc handle definition jump
let g:go_doc_keywordprg_enabled = 0 " Let Coc handle hover

" Python
let g:python3_host_prog = '/usr/bin/python3' " Adjust if needed

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
