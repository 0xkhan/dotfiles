set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

"######################### PLUG BEGINN #########################
call plug#begin('~/.vim/plugged')

" Side Numbers; https://github.com/myusuf3/numbers.vim.git
Plug 'myusuf3/numbers.vim' 

" Surround; https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Solarized 8; https://github.com/lifepillar/vim-solarized8.git
Plug 'lifepillar/vim-solarized8'

" Indentline; https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

call plug#end()
"########################## PLUG END ##########################


"######################### SOLARIZED 8 ########################
set background=dark
colorscheme solarized8

"######################### IndentLine #########################
let g:indentLine_char = '│'



