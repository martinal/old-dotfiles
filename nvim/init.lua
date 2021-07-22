--------------------------------------------------------------------------------
print("init.lua bootstrapping packer")
-- https://github.com/wbthomason/packer.nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local first_install = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  first_install = true
end

--------------------------------------------------------------------------------
print("init.lua running packer startup")

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
  use 'tommcdo/vim-lion'
  use 'tpope/vim-commentary' -- TODO: Find treesitter based alternative?
  use 'tpope/vim-surround'

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
  -- use 'mhartington/formatter.nvim' -- TODO: competes with LSP or not?
  
  -- SNIPPETS
  use 'norcalli/snippets.nvim' -- TODO: Configure and add useful snippets

  -- DEBUGGER
  use 'mfussenegger/nvim-dap' -- TODO: Test go adapter, configure more debug adapters

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
-- TODO: Configure one by one below this point:
  use 'hoob3rt/lualine.nvim'

  -- BUFFERLINE
  use 'akinsho/nvim-bufferline.lua'

  -- CODE OUTLINE
  use 'stevearc/aerial.nvim'
  -- use '???/minimap.vim'

  -- FILETREE
  use { 'kyazdani42/nvim-tree.lua', requires = { { 'kyazdani42/nvim-web-devicons' } } }

  -- GIT
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'TimUntersberger/neogit'
  -- TODO: octo.nvim?
  -- TODO: vira?

  -- UTILITIES
  use 'windwp/nvim-autopairs'

  -- MOVEMENT
  use 'phaazon/hop.nvim'

  -- VISUAL
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  use 'folke/twilight.nvim'
  use 'folke/zen-mode.nvim'

  -- COLORS
  -- TODO: Color scheme
  use 'norcalli/nvim-colorizer.lua'

  -- SQL
  -- https://github.com/tpope/vim-dadbod
  -- https://github.com/lighttiger2505/sqls
  -- https://github.com/nanotee/sqls.nvim

  -- LUA
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua

  -- GO
end)


--------------------------------------------------------------------------------
-- TODO: When packer gets better autosync this might be unncessesary
if first_install == true then
	print("init.lua running PackerInstall")
	vim.api.nvim_command('PackerInstall')
else
	-- print("init.lua running PackerSync")
	-- vim.api.nvim_command('PackerSync')
	-- vim.api.nvim_command('PackerCompile')
end


--------------------------------------------------------------------------------
print("init.lua configuring basics")

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

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


--------------------------------------------------------------------------------
print("init.lua configuring treesitter")
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
print("init.lua configuring LSP")
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


--------------------------------------------------------------------------------
print("init.lua configuring DAP")
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
        print('dlv exited with code', code)
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
print("init.lua configuring telescope")

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
print("init.lua configuring color scheme")
vim.o.termguicolors = true
-- TODO: Pick and configure colorscheme
--vim.g.onedark_terminal_italics = 2
--vim.cmd [[colorscheme TODONAME]]

--------------------------------------------------------------------------------
print("init.lua configuring other plugins")

-- Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}


--------------------------------------------------------------------------------
print('init.lua setting up leadermappings')


--------------------------------------------------------------------------------
print('init.lua completed')

