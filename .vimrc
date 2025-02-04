" ==================================
"          Vim Configuration
" ==================================
set encoding=utf-8
set clipboard=unnamedplus
set relativenumber

" ==================================
"          Vim-plug Setup
" ==================================
" Specify the path for autoload/plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

" ==================================
"          Plugin List
" ==================================
call plug#begin()

" Development Plugins
Plug 'tpope/vim-sensible'          " Sensible defaults for Vim

" Snippet Plugins
Plug 'sirver/ultisnips'           " Ultimate snippet manager

" LaTeX Plugins
Plug 'lervag/vimtex'              " LaTeX support
Plug 'KeitaNakamura/tex-conceal.vim' " Conceal LaTeX commands

call plug#end()

" ==================================
"          Plugin Configuration
" ==================================
" Configuration for UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Configuration for vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Configuration for tex-conceal.vim
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" ==================================
"          Spell Check Configuration
" ==================================
setlocal spell
set spelllang=en_us

" ==================================
"          Mapping for Spell Check
" ==================================
" Mapping for quickly jumping to the next spelling error
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" ========== End of Configuration ==========
