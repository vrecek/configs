call plug#begin()
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set number
set showcmd
set encoding=utf-8
set title
set shiftwidth=4
set mouse=

lua require('main')

:colorscheme catppuccin-mocha

map <silent> <C-s> :NvimTreeToggle<CR>
map <silent> <C-a> :wincmd p<CR>
map <silent> <C-n> :set invnumber<CR>

map <silent> <Esc> :noh<CR>

map <C-q> :NvimTreeClose<CR>:q!<CR>
map <C-w> :NvimTreeClose<CR>:wq<CR>

map <A-Up> :tabedit<CR>
map <A-Down> :tabclose<CR>
map <A-Left> :tabp<CR>
map <A-Right> :tabn<CR>

autocmd VimEnter * NvimTreeOpen
autocmd VimEnter * ColorizerToggle
autocmd VimEnter * wincmd p

autocmd Filetype html inoremap < <><left>
autocmd Filetype css inoremap /* /**/<left><left>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap {<CR> {<CR>}<ESC>O<TAB>
