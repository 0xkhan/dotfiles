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

" ++++++++++++++++++++ Start Themes ++++++++++++++++++++ 
" Solarized 8; https://github.com/lifepillar/vim-solarized8.git
Plug 'lifepillar/vim-solarized8'

" Vim One; https://github.com/rakr/vim-one
Plug 'rakr/vim-one'
" ++++++++++++++++++++++ End Themes +++++++++++++++++++++ 

" Indentline; https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" Nerd Tree; https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

call plug#end()
"########################## PLUG END ##########################


"######################### SOLARIZED 8 ########################
"set background=dark
"colorscheme solarized8

"########################### Vim One ###########################
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
colorscheme one

"######################### IndentLine #########################
let g:indentLine_char = '│'

"##################### Nerdtree Settings  #####################
"Keep NERDTree on the left side
let g:NERDTreeWinPos = "left"
map <C-n> :NERDTreeToggle<CR>
