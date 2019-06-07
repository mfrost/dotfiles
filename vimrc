set nocompatible

call plug#begin()
Plug 'bsl/obviousmode'
Plug 'danielwe/base16-vim' " https://github.com/chriskempson/base16-vim/pull/198
Plug 'elzr/vim-json'
Plug 'kien/ctrlp.vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mileszs/ack.vim'
Plug 'robbyrussell/oh-my-zsh'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Jump to last line when the file was last loaded
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set exrc        " enable per-directory .vimrc files
set secure      " disable unsafe commands in local .vimrc files

set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set autowrite   " Automatically save before commands like :next and :make

" Searching
set ignorecase  " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set hlsearch  " Highlight matching search terms

"set hidden     " Hide buffers when they are abandoned
set title
set scrolloff=3
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" Makefile uses real tabs
au FileType make set noexpandtab

" Turn on Spell check
setl spell spelllang=en_us

set ruler
set number
set numberwidth=4
let mapleader = ","
nmap <Leader>n :set number! :set number?<CR>

" Keep those lines short, please.
set textwidth=120
set colorcolumn=+1

" tagbar settings
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
map <C-MiddleMouse> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <Leader>j :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <C-\> :pop<CR>

set foldmethod=indent
set foldnestmax=20
set foldenable
set foldlevel=10
set foldcolumn=0

set guifont=Monaco\ 9
set statusline=%F\ %=[%c,%l]\ (%P)
set autoread

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 3

"Cut'n'Paste to system clipboard
noremap <C-S-c> "+y
"noremap <C-S-v> "+p<CR>

syntax enable
set synmaxcol=250

let g:jsx_ext_required = 0

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Visualize tabs and trailing spaces
set list
set listchars=tab:␣␣,trail:○

" set mouse=a   " Enable mouse usage (all modes)

" ctrlp options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\.git$\|log$\|tmp\|node_modules\|cookbooks\|coverage\|target$'

" Gist Options
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Status bar
set laststatus=2

" turn off json concealing
let g:vim_json_syntax_conceal = 0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set tabpagemax=50

set nowrap

" Experiment w/ disabled arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Diable that escape key. Ctrl-C!
inoremap  <Esc>    <NOP>

" Navigate tabs using the arrow keys
nnoremap <silent> <C-t> :tabnew<cr>
nnoremap <silent> <Right> gt
nnoremap <silent> <Left> gT

nnoremap <silent> <Up> <c-w>k
nnoremap <silent> <Down> <c-w>j
nnoremap <silent> <S-Up> <c-w>c
nnoremap <silent> <S-Down> <c-w>s

let g:ale_fixers = {'javascript': ['prettier']}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background

  call Base16hi("SpellBad",   g:base16_gui08, g:base16_gui00, g:base16_cterm08, g:base16_cterm00, "underline", g:base16_gui08)
  call Base16hi("SpellCap",   g:base16_gui0A, g:base16_gui00, g:base16_cterm0A, g:base16_cterm00, "underline", g:base16_gui0A)
  call Base16hi("SpellLocal", g:base16_gui0D, g:base16_gui00, g:base16_cterm0D, g:base16_cterm00, "underline", g:base16_gui0D)
  call Base16hi("SpellRare",  g:base16_gui0B, g:base16_gui00, g:base16_cterm0B, g:base16_cterm00, "underline", g:base16_gui0B)
endif
