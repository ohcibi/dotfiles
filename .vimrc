let mapleader=","
let g:indent_guides_auto_colors = 1
" basic
set background=light
set number
set ruler
syn on
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set lbr
set laststatus=2
set hidden
set modeline
set wildignore+=vendor/ruby/**,tmp/**,log/**

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

" open nerdtree if no file is specified
autocmd vimenter * if !argc() | NERDTree | endif

" syntax
autocmd BufEnter *.thtml,*.ctp set syntax=php
autocmd BufEnter *.js.ctp set syntax=javascript
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" misc settings
filetype plugin on
filetype indent on
set grepprg="grep -nH $*"

" php syntax highlighting settings
let php_sql_query = 1
let php_smart_members = 1
let php_alt_properties = 1


" define quotes used by latex suite
let b:Tex_SmartQuoteOpen = '"`'
let b:Tex_SmartQuoteClose = "\"'"

call pathogen#infect()
call pathogen#helptags()
let g:solarized_termcolors=256    "default value is 16
"let g:solarized_termtrans=1
set t_Co=256
colorscheme solarized

"Highlight cursor
set cursorline
highlight CursorLine ctermbg=228 cterm=NONE

" mappings
nmap <Tab> :bn<CR>
map <S-Tab> :bp<CR>
nmap  :CommandT<CR>
nmap _E :EnableFastPHPFolds<CR>
nmap _D :DisablePHPFolds<CR>
nmap n nzz
nmap N Nzz

nmap h :vertical resize -1<CR>
nmap l :vertical resize +1<CR>
nmap j :resize -1<CR>
nmap k :resize +1<CR>

noremap <C-H> :wincmd h<CR>
noremap <C-J> :wincmd j<CR>
noremap <C-K> :wincmd k<CR>
noremap <C-L> :wincmd l<CR>

noremap <leader>r :!rspec %<cr>
nmap <leader>R :!rspec spec<CR>
"noremap <C-S-F11> :RunSpecs

set tags=./tags
