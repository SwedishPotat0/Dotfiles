let mapleader = " "

nnoremap <F5> :w<CR>:call RunFile()<CR>
nnoremap <leader>f :Vifm<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :terminal<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s /

nnoremap <leader>b :bp<CR>
nnoremap <leader>n :bn<CR>

" Use <Tab> and <S-Tab> to navigate popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <CR> (Enter) to accept completion only when popup menu is visible
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
