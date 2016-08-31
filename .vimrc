" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility
set nocompatible
" hidden chars
set list
" replaced by sensible.vim
" set listchars=tab:▸\ ,eol:¬
" indent
set autoindent
set smartindent
set cindent
" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" syntax highlighting
set t_Co=256
syntax on
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" show line/column numbers
set ruler
set number
" set relativenumber
" completion mode
set wildmode=longest,list
" search options
set incsearch
set ic
set hlsearch
" change leader char
" let mapleader=","
" scroll option
set scrolloff=2
" no auto linebreak
set nolbr
" allow editing other files without saving current
set hidden
" show status lines
" set laststatus=2
" set statusline
" set statusline=%-10.3n
" mark wrapped lines
set showbreak=>
set wrap

set tags=tags

if has("autocmd")
    " Enable file type detection
    filetype on
    " Reload .vimrc on save
    autocmd BufWritePost .vimrc source $MYVIMRC
    " Treat .json as Javascript
    autocmd BufNewFile,BufRead *.json set ft=javascript
endif

" custom mappings

:nmap <leader>l :setlocal number!<CR>
:nmap <leader>q :nohlsearch<CR>
:nmap <leader>ne :NERDTreeToggle<CR>
:nmap <leader>u :UndotreeToggle<CR>
:nmap <Up> gk
:nmap <Down> gj

" custom mappings for vimdiff
" map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
" map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
" map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

" plugins
execute pathogen#infect()
filetype plugin indent on

" color
set background=light
colorscheme solarized

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" CommandT settings
" nnoremap <silent> <leader>b :CommandTMRU<CR>
" nnoremap <silent> <leader>T :CommandTTag<CR>
" let g:CommandTMaxFiles=20000
" let g:CommandTFileScanner="git"
" let g:CommandTSuppressMaxFilesWarning=1

" CtrlP settings
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" " let g:ctrlp_user_command = 'find %s -type f'
" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
" nnoremap <silent> <leader>t :CtrlPTag<CR>
" nnoremap <silent> <leader>T :CtrlPBufTagAll<CR>
" nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" wildmenu
set wildchar=<Tab> wildmenu wildmode=full

" Fugitive settings
let g:fugitive_github_domains = ['git.corp.yahoo.com', 'partner.git.corp.yahoo.com']
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" easier window navigation
:noremap <C-j> <C-w>j
:noremap <C-k> <C-w>k
:noremap <C-h> <C-w>h
:noremap <C-l> <C-w>l

" easier <Esc>
:imap jk <Esc>

" -- syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Other plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" fzf settings
:noremap <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
