" ############################# system source ############################

" load plugins 
source $DOTFILES/plugin.vim

" ############################# user perference ############################

" set encoding
set encoding=utf-8

" Turn syntax highlighting on.
syntax on

" disabled vi mode
set nocompatible

" set line number
set number

" tab indent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" backspace 
set backspace=2

set cursorline
set cursorcolumn

" without it, whenever u switch buffers and you current buffers is not saved
set hidden

" define keymap
let mapleader = "\<space>"

" ############################# color and theme ####################################

" cursor
" Set cursor shape and color
if &term =~ "xterm"
    " INSERT mode
    let &t_SI = "\<Esc>[6 q" . "\<Esc>]12;blue\x7"
    " REPLACE mode
    let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;black\x7"
    " NORMAL mode
    let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;green\x7"
endif
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
highlight Cursor guifg=orange guibg=steelblue

" p10k theme 
colorscheme fruity

" ############################## key mapping config ############################

" -------------------- gernal map

" didn't know what to do
map <leader>f :Files<CR>
map <leader>fg :GFiles<CR>

" jump to other window
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

" -------------------- normal keymap 

" save file and exit
noremap <leader>w :w<CR>
noremap <leader>q :wq<CR>

" set nerdTree map
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" -------------------- insert keymap 

" exit insert mode
inoremap jj <esc>

" ############################## plugin config ############################

" NERDTree Config
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ############################## template of code #############################
" cpp template 
:autocmd BufNewFile *.cpp 0r ~/.vim/template/cpp_temp.cpp

