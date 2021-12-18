" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

" vim-surround
Plug 'tpope/vim-surround'

" easymotion
Plug 'easymotion/vim-easymotion'

" colorschemes
Plug 'flazz/vim-colorschemes'

" fzf & fzf.vim, If installed using Homebrew
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" auto add () "" ...
Plug 'jiangmiao/auto-pairs'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

