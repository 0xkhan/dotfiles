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

" Indentline; https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" Nerd Tree; https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" Spelunker - Spell check; https://github.com/kamykn/spelunker.vim
Plug 'kamykn/spelunker.vim'

" Vdebug; https://github.com/vim-vdebug/vdebug
Plug 'vim-vdebug/vdebug'

" ######### Plugins for JS ############
" Vim JavaScript; https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'

" Vim JSX Pretty; https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty'

" Emmet Vim; https://github.com/MaxMEllon/vim-jsx-pretty
Plug 'mattn/emmet-vim'

" ##########################################
" Neovim plugins

" php.vim (syntax highlighting); https://github.com/StanAngeloff/php.vim
Plug 'StanAngeloff/php.vim'

" PHP Style fixer; https://github.com/stephpy/vim-php-cs-fixer
Plug 'stephpy/vim-php-cs-fixer' " you need to add config files visit github page 

" Python code formatter; https://github.com/psf/black
" Plug 'psf/black', { 'branch': 'stable' }

" Markdown Preview; https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" PHPactor; https://phpactor.readthedocs.io/en/master/usage/vim-plugin.html
" Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" NCM2; https://github.com/ncm2/ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'phpactor/ncm2-phpactor'

" ++++++++++++++++++++ Start Themes ++++++++++++++++++++ 
" Solarized 8; https://github.com/lifepillar/vim-solarized8.git
Plug 'lifepillar/vim-solarized8'

" Vim One; https://github.com/rakr/vim-one
Plug 'rakr/vim-one'
" ++++++++++++++++++++++ End Themes +++++++++++++++++++++ 

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

"##################### Quote Concealing ######################
" Disable quote concealing in JSON files - with that not being
" set to 0 vim will hide double quotes. However conceallevel is 
" set to 2 by indentLine that means when we set it to 0 which
" is default indentLine will not work.
" So when finished with json file comment out this code!
" let g:indentLine_setConceal = 0

"######################### IndentLine #########################
let g:indentLine_char = '│'

" For excluding file types so the syntax highlighting work properly
let g:indentLine_fileTypeExclude = ['json', 'markdown']

"##################### Nerdtree Settings  #####################
"Keep NERDTree on the left side
let g:NERDTreeWinPos = "left"
map <C-n> :NERDTreeToggle<CR>

"################### Turn off Vim's spell  ####################
"Turn off Vim's spell as it highlights the same words.
set nospell

"##################### Turn off MD folding  #####################
"Turn off folding in Markdown file
set nofoldenable

"################### For True Colors In Tmux ###################
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"###################### Vdebug Port Setup  ######################
"Make Vdebug to listen to a specific port
let g:vdebug_options = {
\   'port' : 9004,
\}

"##################### Vim JavaScript Setup #####################
let g:javascript_plugin_jsdoc = 1

"####################### Emmet Shortcuts ########################
let g:user_emmet_mode = 'n'     "Only enable normal mode functions
let g:user_emmet_leader_key = ','     "Set leader key to comma -> <,>, -> ,,

"############### Black python code formatter Setup ##############
" autocmd BufWritePre *.py execute ':Black'

"########################## NCM2 Config ##########################
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"############### For Markdown Syntax Highlighting ###############
" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


"######## Set textwidth to 80 in Markdown and Text Files #########
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.txt setlocal textwidth=80

"#################### Markdown Preview Config ####################
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '?${name}?'
let g:mkdp_filetypes = ['markdown']
