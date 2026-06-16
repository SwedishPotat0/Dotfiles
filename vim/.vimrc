" Enable syntax highlighting and filetype support
syntax on
filetype plugin indent on

if filereadable(expand("~/.vim/config/mapping.vim"))
  source ~/.vim/config/mapping.vim
endif

" UI enhancements
set number                                 
set cursorline                             
set nowrap                                 

set mouse=a

" Status line                              
set laststatus=2                           
set statusline=%t\ %y\ [%{&fileencoding}]%=
" Clipboard                                
set clipboard=unnamedplus 

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
Plug 'jiangmiao/auto-pairs'
Plug 'SwedishPotat0/waypoint.vim'

call plug#end()

" Color scheme
set background=dark
