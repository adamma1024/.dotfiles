""""""""""""""""""""""""""""""
" Plugin List:
" Plugins Configure:
"   => fzf.vim 
"   => NERDTree
"   => Coc.nvim
"   => rainbow
"   => vim-airline
""""""""""""""""""""""""""""""


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let yarn_install = 'yarn install --frozen-lockfile'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'luochen1990/rainbow'
Plug 'myusuf3/numbers.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc-tsserver', {'do': yarn_install} 
    Plug 'neoclide/coc-prettier', {'do': yarn_install}
    Plug 'neoclide/coc-json', {'do': yarn_install}
    Plug 'neoclide/coc-snippets', {'do': yarn_install}
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""
"          fzf.vim           "
""""""""""""""""""""""""""""""
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>k :Commits<CR>
" nnoremap <silent> <Leader>H :Helptags<CR>
" nnoremap <silent> <Leader>hh :History<CR>
" nnoremap <silent> <Leader>h: :History:<CR>
" nnoremap <silent> <Leader>h/ :History/<CR>'


""""""""""""""""""""""""""""""
"         NERDTree           "
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>t :NERDTreeFind<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" avoid call vim-plug in NERDTree window
let g:plug_window = 'noautocmd vertical topleft new'


""""""""""""""""""""""""""""""
"         CoC.nvim           "
""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)
" Remap keys for applying codeAction to the current buffer
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" Add `:Prettier` command for formateFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

""""""""""""""""""""""""""""""
"         rainbow            "
""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


""""""""""""""""""""""""""""""
"       vim-airline          "
""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 1
