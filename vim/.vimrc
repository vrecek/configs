""" vim-plug

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'davidhalter/jedi-vim'
Plug 'chrisbra/Colorizer'
call plug#end()

set number
set showcmd
set encoding=utf-8
set title

:colorscheme sorbet
:highlight Normal ctermbg=none

map <silent> <C-a> :wincmd p<CR>
map <silent> <C-s> :NERDTreeToggle<CR>
map <silent> <C-n> :set invnumber<CR>
map <C-q> :q!<CR>
map <C-w> :wq<CR>

map <A-Up> :tabedit<CR>
map <A-Down> :tabclose<CR>
map <A-Left> :tabp<CR>
map <A-Right> :tabn<CR>

let NERDTreeShowHidden=1

autocmd VimEnter * ColorHighlight
autocmd VimEnter * NERDTree
autocmd Filetype html inoremap < <><left>
autocmd Filetype css inoremap /* /**/<left><left>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O<TAB>
