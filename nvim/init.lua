function section(msg)
--	print(msg)
end

--------------------------------------------------------------------------------
section("init.lua running packer startup")

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Enables plugins to register operations for repeat with .
  use 'tpope/vim-repeat'

  -- BASIC SEARCH
  use 'bronson/vim-visual-star-search'

  -- BASIC TEXT OBJECTS
  use 'wellle/targets.vim'
  use 'wellle/line-targets.vim'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  -- TODO: Look for more textobjects at: https://github.com/kana/vim-textobj-user/wiki
  -- TODO: Consolidate textobject mappings for these basic plugins and treesitter-textobjects

  -- BASIC EDITING
  use 'wellle/vim-exchange'
  use 'inkarkat/vim-ReplaceWithRegister'
  use 'tpope/vim-commentary' -- TODO: Find treesitter based alternative?
  use 'tpope/vim-surround'

  -- ALIGNMENT
  use 'tommcdo/vim-lion'
  -- use 'junegunn/vim-easy-align' -- TODO: which?

  -- MORE TO CHECK OUT:
  -- https://github.com/wellle/targets.vim
  -- https://github.com/wellle/visual-split.vim
  -- https://github.com/tpope/vim-unimpaired

  -- TREESITTER
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'romgrk/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
  use 'vigoux/architext.nvim'
  use 'p00f/nvim-ts-rainbow'

  -- LSP
  -- TODO: Configure LSP more and add servers:  https://github.com/neovim/nvim-lspconfig
  use 'neovim/nvim-lspconfig'
  -- use 'kabouzeid/nvim-lspinstall' -- TODO: Try this
  -- use 'folke/trouble.nvim' -- TODO: Try this
  -- use 'glepnir/lspsaga.nvim' -- TODO: Try this

  -- use 'mhartington/formatter.nvim' -- TODO: competes with LSP or not?
  
  -- SNIPPETS
  use 'norcalli/snippets.nvim' -- TODO: Configure and add useful snippets

  -- DEBUGGER
  use 'mfussenegger/nvim-dap' -- TODO: Test go adapter, configure more debug adapters
  -- use 'Pocco81/DAPInstall.nvim' -- TODO: Try this

  -- TELESCOPE
  -- TODO: Configure telescope and its variants, bigger project!
  use { 'nvim-telescope/telescope.nvim',
    requires = {
		{ 'nvim-lua/popup.nvim' },
		{ 'nvim-lua/plenary.nvim' }
	}
  }
  use 'nvim-telescope/telescope-hop.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-snippets.nvim'
  use 'nvim-telescope/telescope-dap.nvim'

  -- AUTOCOMPLETION
  -- TODO: Configure completion and integration with treesitter, snippets, lsp
  use 'hrsh7th/nvim-compe'

  -- STATUSLINE
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

  -- BUFFERLINE
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons' }

  -- CODE OUTLINE
  use 'stevearc/aerial.nvim'
  -- use '???/minimap.vim'

  -- FILETREE
  -- TODO: Configure one by one below this point:
  use { 'kyazdani42/nvim-tree.lua', requires = { { 'kyazdani42/nvim-web-devicons' } } }

  -- GIT
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'TimUntersberger/neogit' -- TODO: Use this and/or gitsigns?
  -- TODO: octo.nvim?
  -- TODO: vira?

  -- UTILITIES
  use 'windwp/nvim-autopairs'

  -- MOVEMENT
  use 'phaazon/hop.nvim'
  use "folke/which-key.nvim"

  -- VISUAL
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  use 'folke/twilight.nvim'
  use 'folke/zen-mode.nvim'

  -- COLORSCHEMES
  use 'projekt0n/github-nvim-theme'
  -- use 'sainnhe/edge'
  -- use 'sainnhe/neon'

  -- COLOR ADJUSTMENTS
  use 'norcalli/nvim-colorizer.lua'

  -- TESTING
  -- use 'https://github.com/vim-test/vim-test'

  -- SQL
  -- https://github.com/tpope/vim-dadbod
  -- vim-dadbod-ui
  -- https://github.com/lighttiger2505/sqls
  -- https://github.com/nanotee/sqls.nvim
  -- 'https://github.com/chrisbra/NrrwRgn'
  -- sniprun

  -- LUA
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua

  -- GO
  -- use 'https://github.com/ray-x/go.nvim' -- TODO: Try this
end)


--------------------------------------------------------------------------------
section("init.lua configuring basics")

--Indentation
--vim.bo.smartindent = true  -- smart autoindenting for C programs
--vim.bo.expandtab = true -- use spaces when <Tab> is inserted
--vim.bo.smarttab = true -- use 'shiftwidth' when inserting <Tab>
--vim.bo.softtabstop = 4 -- number of spaces that <Tab> uses while editing
--vim.bo.tabstop = 4 -- number of spaces that <Tab> in file uses
--vim.bo.shiftround = true -- round indent to multiple of shiftwidth
--vim.bo.shiftwidth = 4 -- number of spaces to use for (auto)indent step

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false -- true?

--Make line numbers default
vim.wo.number = true
-- vim.wo.numberwidth = 8?

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- TODO: Merge wanted parts from below into above
--------------------------------------------------------------------------------
--Misc
--set updatetime=100  " after this many milliseconds flush swap file
--set lazyredraw      " don't redraw while executing macros
--set nrformats="alpha,octal,hex,bin"  " number formats recognized for CTRL-A command
--set tildeop  " tilde command "~" behaves like an operator
--set display="lastline,msgsep,uhex"   " list of flags for how to display text
--set scrolloff=5
--set whichwrap=b,s,<,>,[,]  " wrap to next line for backspace, space, and arrows
--set startofline  " commands move cursor to first non-blank in line
--set mouse=ar  " enable the use of mouse clicks
--filetype on

--------------------------------------------------------------------------------
--Statusline at bottom
--set noshowmode   " message on status line to show current mode
--'fillchars'	  'fcs'     characters to use for displaying special items
--'ruler'		  'ru'	    show cursor line and column in the status line
--'rulerformat'	  'ruf'     custom format for the ruler
--'statusline'	  'stl'     custom format for the status line


--------------------------------------------------------------------------------
--Buffers, windows, tabs
--https://github.com/qpkorr/vim-bufkill
--set confirm  " ask what to do about unsaved/read-only files
--set hidden " don't unload buffer when it is abandoned
--set splitright  " new window is put right of the current one
--'switchbuf'	  'swb'     sets behavior when switching to another buffer

--------------------------------------------------------------------------------
--Guides
--set cursorcolumn  " highlight the screen column of the cursor
--set cursorline    " highlight the screen line of the cursor

--------------------------------------------------------------------------------
--Folding
--set foldmethod=manual  " folding type (manual, indent, syntax, expr, diff)
--set foldnestmax=5      " maximum fold depth (file section, class, function, +3 levels = 5, should be plenty!)
--for which commands a fold will be opened:
--default   ="block,hor,mark,percent,quickfix,search,tag,undo"
--set foldopen="block,hor,mark,percent,quickfix,search,tag,undo,jump,insert"

--------------------------------------------------------------------------------
--System clipboard, cut/copy/paste, etc
--set clipboard=unnamedplus  " use the clipboard as the unnamed register

--------------------------------------------------------------------------------
--Undo
--set undofile          " save undo information in a file
--set undolevels=1000   " maximum number of changes that can be undone
--set undoreload=30000  " max nr of lines to save for undo on a buffer reload


--------------------------------------------------------------------------------
section("init.lua configuring treesitter")
-- TSInstall go lua json yaml html css c cpp
require('nvim-treesitter.configs').setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
    textsubjects = {
        enable = true, -- TODO: Not sure, test in go before deciding
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
        }
    }, -- textsubjects
  textobjects = {
    -- TODO: Refine keymaps later
    -- Built-in textobjects:
    -- @block.inner
    -- @block.outer
    -- @call.inner
    -- @call.outer
    --  @class.inner
    --  @class.outer
    --  @comment.outer
    --  @conditional.inner
    --  @conditional.outer
    --  @frame.inner not go
    --  @frame.outer not go
    --  @function.inner
    --  @function.outer
    --  @loop.inner
    --  @loop.outer
    -- @parameter.inner
    --  @parameter.outer not go
    --  @scopename.inner not go
    -- @statement.outer
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aq"] = "@commment.outer",
        ["an"] = "@conditional.outer",
        ["in"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
	-- TODO: Add more!

        -- Or you can define your own textobjects like this
        -- ["iF"] = {
        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
  }, -- textobjects
  refactor = {
	highlight_definitions = { enable = true },
	highlight_current_scope = { enable = false },
	smart_rename = {
		enable = true,
		keymaps = {
			smart_rename = "grr",
		},
	},
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
	-- goto_definition_lsp_fallback = "gnd", -- TODO: Try this with lsp
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
	-- TODO: Refine keymaps, don't like a-*, a-#
      },
    },
  }, -- refactor
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }, -- playground
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 2000, -- Do not enable for files with more than 1000 lines, int
    -- TODO: Define colors here depending on chosen color scheme:
    colors = { -- table of hex strings
    },
    termcolors = { -- table of colour name strings
    }
  }, -- rainbow
})
-- Folding is not a module but part of treesitter
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'


require('treesitter-context.config').setup({
    enable = false, -- TODO: Didn't work very well on this file, see how it works with go
})


--------------------------------------------------------------------------------
section("init.lua configuring LSP")
-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
require('lspconfig').gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}
-- TODO: consider goimports function here: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
-- TODO: autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc


-- FIXME: Figure out on_attach stuff for lspconfig and what aerial does here
-- local aerial = require('aerial')

-- local custom_attach = function(client)
--   aerial.on_attach(client)

--   -- Aerial does not set any mappings by default, so you'll want to set some up
--   -- Toggle the aerial window with <leader>a
--   vim.api.nvim_buf_set_keymap(0, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
--   -- Jump forwards/backwards with '{' and '}'
--   vim.api.nvim_buf_set_keymap(0, 'n', '{', '<cmd>AerialPrev<CR>', {})
--   vim.api.nvim_buf_set_keymap(0, 'n', '}', '<cmd>AerialNext<CR>', {})
--   -- Jump up the tree with '[[' or ']]'
--   vim.api.nvim_buf_set_keymap(0, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
--   vim.api.nvim_buf_set_keymap(0, 'n', ']]', '<cmd>AerialNextUp<CR>', {})

--   -- TODO: This is a great place to set up all your other LSP mappings
-- end

-- -- Set up your LSP clients here, using the custom on_attach method
-- require('lspconfig').vimls.setup{
--   on_attach = custom_attach,
-- }


--------------------------------------------------------------------------------
section("init.lua configuring DAP")
local dap = require('dap')

-- TODO: lua in nvim:
-- https://github.com/jbyuki/one-small-step-for-vimkind

-- go DAP directly via delve, copy-pasted from nvim-dap docs:
dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        section('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages 
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    } 
}

--------------------------------------------------------------------------------
section("init.lua configuring telescope")

-- " Find files using Telescope command-line sugar.
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

-- " Using Lua functions
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

--------------------------------------------------------------------------------
section("init.lua configuring other plugins")

-- Gitsigns TODO: Check out default keymaps here
require('gitsigns').setup{
  -- keymaps = {
  --   -- Default keymap options
  --   noremap = true,

  --   ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
  --   ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

  --   ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
  --   ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
  --   ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
  --   ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
  --   ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
  --   ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
  --   ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  --   ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

  --   -- Text objects
  --   ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  --   ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  -- },
}

-- Lualine
require('lualine').setup{
  -- TODO: Configure lualine contents
  options = {
    theme = 'github',
    -- For round icons (require Nerd-Font)
    -- section_separators = {"", ""},
    -- component_separators = {"", ""},
    -- ... your lualine config
  }
}

-- Bufferline
require('bufferline').setup{
  -- TODO: Configure, consider keymaps
}

-- Indent lines
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Color scheme
vim.o.termguicolors = true
require('github-theme').setup{
  -- TODO: Adjust theme here
}

--------------------------------------------------------------------------------
section('init.lua setting up leadermappings')
require("which-key").setup{
  -- TODO: Configure keymappings here
}

--------------------------------------------------------------------------------
section('init.lua completed')
