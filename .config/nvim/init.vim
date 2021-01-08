"" fetch the latest copy of vim-plug if local copy does not exist
if !filereadable(expand($XDG_CONFIG_HOME.'/nvim/autoload/plug.vim'))
	echo 'Missing local copy of vim-plug! Fetching latest from master!'
	!curl -fLo "$XDG_CONFIG_HOME/nvim/autoload/plug.vim" --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin(stdpath('data') . '/plugged')

"" literally just colourschemes and a fancy status bar
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'

"" for quickly searching through a directory structure for a given file
"" usage:
"" 	:Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" allows for editing pairs of tokens (i.e. matching parentheses)
"" usage:
"" 	cs<token-to-change><replacement-token>
"" example: cs"' when on a " will turn:
"" 	"Hello" into 'Hello'
Plug 'tpope/vim-surround'

"" .editorconfig support for vim
Plug 'editorconfig/editorconfig-vim'

"" html editing for vim: https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

"" linting and other language server features
Plug 'dense-analysis/ale'

"" shows git information like edited lines in the gutter
"" usage:
"" 	:GitGutterToggle	<= global toggle
""	:GtGutterSignsToggle	<= toggle signs
Plug 'airblade/vim-gitgutter'

call plug#end()

"" general editor settings
syntax on

set lazyredraw

set cc=80,120,160

set number
set relativenumber

"" colourscheme settings
if (has("termguicolors"))
	set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

colorscheme tender

"" lightline settings
set noshowmode "" dont show the additional `-- INSERT --` text
let g:lightline = { 'colorscheme': 'one' }

"" ale settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

""let g:ale_lint_on_enter = 0 "" lint when a file is opened
""let g:ale_lint_on_save = 0 "" lint when a file is saved
