set nocompatible
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
source $HOME/.vim/bundlerc

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

" wildignore
set wildignore+=*/vendor/ruby/**,*/node_modules/**,*/tmp/**,*/log/**,*.git,*.swp,*.zip,*.gz,*.bz2

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
highlight Comment cterm=italic

" mappings
nmap <Tab> :bn<CR>
map <S-Tab> :bp<CR>
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

" NERDTree
noremap <C-N> :NERDTree<CR>

" CTRLP
noremap <c-b> :CtrlPBuffer<cr>

"convenience
noremap <cr> :nohlsearch<cr>

set mouse=a
set backup
set undofile                "so is persistent undo ...
set undodir=$HOME/.vim/undo//
set undolevels=1000         "maximum number of changes that can be undone
set undoreload=10000        "maximum number lines to save for undo on a buffer reload
set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set viewdir=$HOME/.vim/views//

silent execute '!mkdir -p $HOME/.vim/backup'
silent execute '!mkdir -p $HOME/.vim/swap'
silent execute '!mkdir -p $HOME/.vim/views'
silent execute '!mkdir -p $HOME/.vim/undo'
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

let g:neocomplcache_enable_at_startup = 1

hi IndentGuidesOdd ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey

function! StartNerdTreeIfProject()
  if !&diff && (isdirectory(".git") || filereadable(".project"))
    NERDTree
  endif
endfunction
au VimEnter * call StartNerdTreeIfProject()

" don't display a preview window for completion support
set completeopt-=preview

" FUGITIVE commands
command! Gci Gcommit --verbose
command! Gds Git diff --staged
command! Gca Gcommit --amend


" VIM RSPEC & CUCUMBER
" https://gist.github.com/vlasar/1062296
function! RailsScriptIfExists(name)
  " Bundle exec
  if isdirectory(".bundle") || (exists("b:rails_root") && isdirectory(b:rails_root . "/.bundle"))
    return "bundle exec " . a:name
  " System Binary
  else
    return a:name
  end
endfunction

function! RunCucumber(args)
  let cucumber = RailsScriptIfExists("cucumber --drb")
  let cmd = cucumber . " " . @% . a:args
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunSpec(args)
  let spec = RailsScriptIfExists("rspec --drb")
  let cmd = spec . " " . a:args . " -fn -c " . @%
  execute ":! echo " . cmd . " && " . cmd
endfunction

function! RunTest(args)
  if @% =~ "\.feature$"
    call RunCucumber(":" . line('.') . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("-l " . line('.') . a:args)
  end
endfunction

function! RunTestFile(args)
  if @% =~ "\.feature$"
    call RunCucumber("" . a:args)
  elseif @% =~ "\.rb$"
    call RunSpec("" . a:args)
  end
endfunction

map <leader>; :call RunTest("")<cr>
map <leader>' :call RunTestFile("")<cr>
" END VIM RSPEC & CUCUMBER

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Neosnippet Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:SuperTabDefaultCompletionType = "<c-n>"
