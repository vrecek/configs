""" vim-plug

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'davidhalter/jedi-vim'
call plug#end()

set number
set showcmd
set encoding=utf-8

map <silent> <C-t> :NERDTreeToggle<CR>
map <C-q> :q!<CR>
map <C-w> :wq<CR>

autocmd VimEnter * NERDTree

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O<TAB>
