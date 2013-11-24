set ruler
set cursorline
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed

execute pathogen#infect()
syntax on
filetype plugin indent on

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Neocomplcache stuff
let g:neocomplcache_enable_at_startup = 1

" Powerline stuff
language en_US.UTF-8
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Solarized stuff
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized

" Tomorrow stuff
set background=dark
colorscheme Tomorrow-Night-Eighties

