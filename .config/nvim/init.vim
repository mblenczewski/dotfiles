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
Plug 'w0rp/ale'

"" shows git information like edited lines in the gutter
"" usage:
"" 	:GitGutterToggle	<= global toggle
""	:GtGutterSignsToggle	<= toggle signs
Plug 'airblade/vim-gitgutter'

call plug#end()

"" general editor settings
set cc=80,120,160

:set number relativenumber

if (has("termguicolors"))
	set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

syntax enable
colorscheme tender

"" lightline settings
set noshowmode "" dont show the additional `-- INSERT --` text
let g:lightline = { 'colorscheme': 'one' }
