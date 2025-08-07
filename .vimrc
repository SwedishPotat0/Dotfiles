" Enable syntax highlighting and filetype support
syntax on
filetype plugin indent on

" UI enhancements
set number
set cursorline

" Status line
set laststatus=2
set statusline=%t\ %y\ [%{&fileencoding}]%=\ %l:%c\ %L\ [%p%%]

" Clipboard
set clipboard=unnamedplus

" Leader key
let mapleader = " "

" Key mappings
nnoremap <F5> :w<CR>:call RunFile()<CR>
nnoremap <leader>f :Vifm<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :terminal<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s /#


" Use <Tab> and <S-Tab> to navigate popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <CR> (Enter) to accept completion only when popup menu is visible
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"


" Function to run supported files
function! RunFile()
  if &filetype ==# 'python'
    execute '!python3' shellescape(@%)
  elseif &filetype ==# 'cpp'
    let output = expand('%:r')
    execute '!g++ -std=c++17 -Wall -Wextra -o ' . output . ' % && ./' . output
  elseif &filetype ==# 'html'
    execute '!xdg-open' shellescape(@%) . ' &'
  else
    echo "Unsupported filetype: " . &filetype
  endif
endfunction

" Plugin manager
call plug#begin('~/.vim/plugged')

" Plugins 
Plug 'vifm/vifm.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'EdenEast/nightfox.nvim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Color scheme
set background=dark

colorscheme carbonfox
" colorscheme nordfox
" colorscheme terafox
" colorscheme nightfox
