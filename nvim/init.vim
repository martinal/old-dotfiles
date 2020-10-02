" ==============================================================================
" Links with tutorials, ideas, etc on vim:
" ==============================================================================
" https://medium.com/@voyeg3r/vim-nvim-useful-tricks-456efd767240
" https://of-vim-and-vigor.blogspot.com/
" https://vimawesome.com/
" https://github.com/mandus/cfg/
" https://learnvimscriptthehardway.stevelosh.com/
" https://devhints.io/vim
" https://dev.to/l04db4l4nc3r/vim-to-the-rescue-repetition-made-easy-a8c
" https://vim.works/2019/03/03/cursor-movement-in-vim/


" ==============================================================================
" Plugin list:
" ==============================================================================
call plug#begin(stdpath('data') . '/plugged')

" Color schemes
Plug 'https://github.com/danilo-augusto/vim-afterglow'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/reedes/vim-colors-pencil'
Plug 'https://github.com/drewtempelmeyer/palenight.vim'

" Info bar
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/mengelbrecht/lightline-bufferline'
" Plug 'https://github.com/vim-airline/vim-airline'

" Eye candy
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'

" Focused writing
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/junegunn/limelight.vim'

" Git
" Plug 'https://github.com/airblade/vim-gitgutter'
" Plug 'https://github.com/tpope/vim-fugitive'
" Plug 'https://github.com/tpope/vim-rhubarb'

" Snippets
" Plug 'https://github.com/honza/vim-snippets'
" Plug 'https://github.com/SirVer/ultisnips'

" Text objects and motions
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/vim-scripts/argtextobj.vim'
Plug 'https://github.com/tommcdo/vim-exchange'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/wellle/line-targets.vim'
Plug 'https://github.com/easymotion/vim-easymotion'
" Plug 'https://github.com/dahu/vim-fanfingtastic'
" Plug 'https://github.com/terryma/vim-expand-region'
" Plug 'https://github.com/thalesmello/vim-textobj-multiline-str' " Python only, adjust to support go?
" Plug 'https://github.com/tommcdo/vim-text-objects'
" vim-textobj-user list of textobject plugins
" https://github.com/coderifous/textobj-word-coloumn.vim
" vim-textobj-lastpat

" Adjusting cut/copy/paste/macro
" Plug 'https://github.com/svermeulen/vim-cutlass'
" Plug 'https://github.com/svermeulen/vim-subversive'
" Plug 'https://github.com/svermeulen/vim-yoink'
" Plug 'https://github.com/tpope/vim-repeat'
" Plug 'https://github.com/svermeulen/vim-macrobatics'

" Syntax aware all the things!
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

" Go plugins
" Plug 'https://github.com/govim/govim'

" SQL plugins
" Plug 'https://github.com/chrisbra/NrrwRgn'
" Plug 'https://github.com/tpope/vim-dadbod'
" vim-dadbod-ui

" Test running plugins
" Plug 'https://github.com/vim-test/vim-test'

" Project awareness plugins
" Plug 'https://github.com/tpope/vim-obsession'
" Plug 'https://github.com/tpope/vim-projectionist'

" Search plugins
" Plug 'https://github.com/junegunn/fzf.vim'
" Plug 'https://github.com/pbogut/fzf-mru.vim'
Plug 'https://github.com/brooth/far.vim'
" vim-which-key

" File management plugins
" Plug 'https://github.com/tpope/vim-vinegar'

" Alignment
Plug 'https://github.com/junegunn/vim-easy-align'
" Plug 'https://github.com/tommcdo/vim-lion'

" Unsorted plugins
" Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
" Plug 'https://github.com/AndrewRadev/splitjoin.vim'
" Plug 'https://github.com/chrisbra/Recover.vim'
" Plug 'https://github.com/jceb/vim-orgmode'
" Plug 'https://github.com/junegunn/vim-slash'
" Plug 'https://github.com/mg979/vim-visual-multi'
" Plug 'https://github.com/tpope/vim-abolish'
" Plug 'https://github.com/tpope/vim-characterize'
" Plug 'https://github.com/tpope/vim-dispatch'
" Plug 'https://github.com/tpope/vim-eunuch'
" Plug 'https://github.com/tpope/vim-flagship'
" Plug 'https://github.com/tpope/vim-haystack'
" Plug 'https://github.com/tpope/vim-jdaddy'
" Plug 'https://github.com/tpope/vim-sensible'
" Plug 'https://github.com/tpope/vim-speeddating'
" Plug 'https://github.com/tpope/vim-tbone'
" Plug 'https://github.com/tpope/vim-unimpaired'

" Also: vista.vim, nvim-lsp
" https://www.youtube.com/watch?v=C9X5VF9ASac
" https://www.reddit.com/r/neovim/comments/insnvz/neovim_builtin_lsp/
" https://neovim.io/doc/user/lsp.html#lsp-quickstart
" Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/neovim/nvim-lsp'
Plug 'https://github.com/liuchengxu/vista.vim'

" File managing
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" nerd-fonts
" https://github.com/Shougo/defx.nvim
" vim-startify

" Buffer and window management
" buffergator
" vim-bufferline
" bufexplorer
" https://github.com/qpkorr/vim-bufkill

" https://github.com/laher/gothx.vim
" vim-coloresque
" vim-hexokinase
" https://github.com/luochen1990/rainbow
" comfortable-motion
" vim-autoformat
" https://github.com/mg979/vim-visual-multi
" https://github.com/reedes/vim-pencil
" https://github.com/reedes/vim-thematic
" tender.vim
" lucario vim color scheme
" vim-submode
" https://github.com/ipod825/vim-bookmark
" vim-devicons
" switch.vim
" vim-ghost

" Unmanaged plugins (manually installed and updated):
" Plug 'https://github.com/~/my-prototype-plugin'

call plug#end()

" ==============================================================================
" Settings
" ==============================================================================

" ------------------------------------------------------------------------------
" Colors
" https://github.com/rafi/awesome-vim-colorschemes
set background="dark"  " "dark" or "light", used for highlight colors
let g:termguicolors = 1
colorscheme afterglow
set syntax=ON  " syntax to be loaded for current buffer

" ------------------------------------------------------------------------------
" Misc
set updatetime=100  " after this many milliseconds flush swap file
set lazyredraw      " don't redraw while executing macros
set nrformats="alpha,octal,hex,bin"  " number formats recognized for CTRL-A command
set tildeop  " tilde command "~" behaves like an operator
set display="lastline,msgsep,uhex"   " list of flags for how to display text
set scrolloff=5
set whichwrap=b,s,<,>,[,]  " wrap to next line for backspace, space, and arrows
set startofline  " commands move cursor to first non-blank in line
set mouse=ar  " enable the use of mouse clicks

" ------------------------------------------------------------------------------
" Parenthesis matching
set showmatch  " briefly jump to matching bracket if insert one
set matchpairs+=<:>  " pairs of characters that "%" can match
set matchtime=1  " tenths of a second to show matching paren

" ------------------------------------------------------------------------------
" Sidebar on left
set number            " print the line number in front of each line
set numberwidth=8     " number of columns used for the line number

" ------------------------------------------------------------------------------
" Statusline at bottom
set noshowmode   " message on status line to show current mode
" 'fillchars'	  'fcs'     characters to use for displaying special items
" 'ruler'		  'ru'	    show cursor line and column in the status line
" 'rulerformat'	  'ruf'     custom format for the ruler
" 'statusline'	  'stl'     custom format for the status line

" let g:airline_theme = 'afterglow'

" ------------------------------------------------------------------------------
"  Searching
set hlsearch    " highlight matches with last search pattern
set incsearch   " highlight match while typing search pattern
set ignorecase  " ignore case in search patterns
set smartcase   " no ignore case when pattern has uppercase

" ------------------------------------------------------------------------------
" Indentation
set smartindent   " smart autoindenting for C programs
set expandtab     " use spaces when <Tab> is inserted
set smarttab      " use 'shiftwidth' when inserting <Tab>
set softtabstop=4 " number of spaces that <Tab> uses while editing
set tabstop=4     " number of spaces that <Tab> in file uses
set shiftround    " round indent to multiple of shiftwidth
set shiftwidth=4  " number of spaces to use for (auto)indent step

" ------------------------------------------------------------------------------
" Buffers, windows, tabs
" https://github.com/qpkorr/vim-bufkill
set confirm  " ask what to do about unsaved/read-only files
set hidden " don't unload buffer when it is abandoned
set splitright  " new window is put right of the current one
" 'switchbuf'	  'swb'     sets behavior when switching to another buffer

" ------------------------------------------------------------------------------
" Guides
" set cursorcolumn  " highlight the screen column of the cursor
set cursorline    " highlight the screen line of the cursor
let g:indent_guides_enable_on_vim_startup = 1  " Turn on indent guides

" ------------------------------------------------------------------------------
" Folding
set foldmethod=manual  " folding type (manual, indent, syntax, expr, diff)
set foldnestmax=5      " maximum fold depth (file section, class, function, +3 levels = 5, should be plenty!)
" for which commands a fold will be opened:
" default   ="block,hor,mark,percent,quickfix,search,tag,undo"
set foldopen="block,hor,mark,percent,quickfix,search,tag,undo,jump,insert"

" ------------------------------------------------------------------------------
" System clipboard, cut/copy/paste, etc
set clipboard=unnamedplus  " use the clipboard as the unnamed register

" ------------------------------------------------------------------------------
" Undo
set undofile          " save undo information in a file
set undolevels=1000   " maximum number of changes that can be undone
set undoreload=30000  " max nr of lines to save for undo on a buffer reload

" ------------------------------------------------------------------------------
" Spelling
" 'spell'			    enable spell checking
" 'spellcapcheck'   'spc'     pattern to locate end of a sentence
" 'spellfile'	  'spf'     files where |zg| and |zw| store words
" 'spelllang'	  'spl'     language(s) to do spell checking for
" 'spellsuggest'	  'sps'     method(s) used to suggest spelling corrections
" 'thesaurus'	  'tsr'     list of thesaurus files for keyword completion


" ==============================================================================
" Other plugin options
" ==============================================================================

" ...

