" pathogen
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on
set grepprg="grep -nH $*"

let mapleader=","

" basic
set background=light
set number
set ruler
set lbr
set laststatus=2
set hidden
set modeline
set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set foldmethod=indent

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:→·,trail:·

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

"Highlight cursor
set cursorline
highlight CursorLine ctermbg=228 cterm=NONE


" eclipse like additions
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" command-t
set wildignore+=vendor/ruby/**,tmp/**,log/**,*.git

" syntax
autocmd BufEnter *.thtml,*.ctp set syntax=php
autocmd BufEnter *.js.ctp set syntax=javascript
autocmd BufEnter *.eco set filetype=eco

au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Guardfile,*.rb} set ft=ruby
au BufRead,BufNewFile {*.yml} set ft=yaml

" make and python use real tabs
au FileType make set noexpandtab
au FileType python set noexpandtab

" define quotes used by latex suite
let b:Tex_SmartQuoteOpen = '"`'
let b:Tex_SmartQuoteClose = "\"'"

colorscheme solarized


" mappings
nmap <Tab> :bn<CR>
map <S-Tab> :bp<CR>
noremap ,t :CommandT<CR>
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

noremap <C-c> :BD<CR>

noremap <leader>c :CoffeeCompile vert<CR>

map <leader>a :A<cr>

noremap <leader>r :!bundle exec rspec %<cr>
nmap <leader>R :!bundle exec rspec spec<CR>
