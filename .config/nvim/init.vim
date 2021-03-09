" Plugins
call plug#begin(stdpath('data') . '/plugged')

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linter
Plug 'neomake/neomake'

" Python

" Indentation
Plug 'Vimjas/vim-python-pep8-indent'

" Deoplete in Python
Plug 'zchee/deoplete-jedi'

call plug#end()


set encoding=utf-8
set nu

let g:deoplete#enable_at_startup = 1

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
