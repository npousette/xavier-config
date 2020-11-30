" Plugins ( :PlugInstall )
" - Plug Onedark, provides the neovim color scheme.
" - Plug FZF, provides fuzzy finding capabilities.
" - Plug RG, provides fast text searching.
" - Plug Airline, provides an improved status bar.
" - Plug Signify, provides git signs in the gutter.
" - Plug Fugitive, provides git interactions within neovim.
" - Plug Endwise, provides auto completion to end certain structures.
" - Plug NERDTree, provides a file explorer menu within neovim.
" - Plug Devicons, provides devicons for NERDTree.
" - Plug Syntastic, provides syntax checking and displays errors.
" - Plug Polyglot, provides syntax styling for numerous languages.
" - Plug Conquer of Completion (coc), provides code completion.
" - Plug Rust, provides Rust syntax highlighting, works with Syntastic.
call plug#begin("~/.vim/plugged")
    Plug 'https://github.com/joshdick/onedark.vim.git'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-syntastic/syntastic'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " :CocInstall coc-rls
    " :CocInstall coc-tsserver
    " :CocInstall coc-eslint
    " :CocInstall coc-prettier
    " gem install solargraph
    " :CocInstall coc-solargraph
    " :CocInstall coc-java
    Plug 'rust-lang/rust.vim'
call plug#end()"Config Section

" Colorscheme configuration
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme onedark

" Behavioral configuration
set autoread
set rtp+=/usr/local/opt/fzf
set updatetime=100
set timeout timeoutlen=3000 ttimeoutlen=100

" Window configuration
set number
set showcmd
set signcolumn=yes
set colorcolumn=120

" Spacing configuration
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType javascriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set backspace=indent,eol,start
set linebreak

" Updated key configuration
nnoremap 0 ^
nnoremap ^ 0
nmap j gj
nmap k gk

" Leader key configuration
" - Space key leader key
" - space + sc: split plane and open the nvim config file (this)
" - space + so: source the nvim config file (this)
" - space + ff: fuzzy find
" - space + fg: fuzzy find git files
" - space + . : fuzzy find files in current directory
" - space + ft: fuzzy find text
" - space + n : turn off highlighting
" - space + y : yank into clipboard
" - space + p : paste from clipboard
" - space + t : NerdTree Toggle
let mapleader = "\<Space>"

nnoremap <leader>sc :tabedit $MYNVIM<cr>
nnoremap <leader>so :source $MYNVIM<cr>

" File searching
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fg :GFiles<cr>
nnoremap <silent> <leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
if filereadable('config/routes.rb')
    nnoremap <silent> <leader>fc :Files app/controllers<cr>
    nnoremap <silent> <leader>fm :Files app/models<cr>
    nnoremap <silent> <leader>fv :Files app/views<cr>
    nnoremap <silent> <leader>fs :Files spec<cr>
endif

"Text searching
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader>ft :RG<cr> 
nnoremap <silent> <leader>n :noh<cr>

"Buffers
nnoremap <silent> <leader>b :Buffers<cr>

" Copy / Paste
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Airline configuration
let g:airline_theme='onedark'

"Syntastic configuration
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" NerdTree configuration
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let NERDTreeWinSize = 60
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <leader>t :NERDTreeToggle<CR>

" Code Completion configuration
" - Tab: rotates through completion options
" - Ctrl + space: selects completion option
" - g + d/y/i/r: Goto definition/type-definition/implementation/reference
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)