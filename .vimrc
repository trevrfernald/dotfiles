set nocompatible  " turn off vi compatibility, but useless
set number 
set nobackup nowritebackup

set termguicolors
let g:sonokai_style = 'default'  " see github page for other styles
let g:sonokai_better_performance = 1
colorscheme sonokai 

syntax on
"set cursorline  " highlight current line

set shiftwidth=4
set tabstop=4
set expandtab  " use spaces in tabs

set ignorecase  " during search
set smartcase  " allow ignore case override
set incsearch  " highlight characters during incremental search
set showmatch
set hlsearch

set showcmd
set showmode
set history=1000

filetype plugin indent on

" search in subfolders
set path+=**

" autocompletion
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" netrw w/ ctrl-b and resizing
inoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-b> <Esc>:Lex<cr>:vertical resize 30<cr>

" center cursor when moving up/down pages
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" PLUGINS ---------------------------------------------------------------- {{{

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" enable code folding with marker method
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" autotoggle relative/absolute line numbers when changing focused buffer
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

" }}}


" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side: row; col; percent from top of file
set statusline+=\ row:\ %l\ col:\ %c\ pos:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
