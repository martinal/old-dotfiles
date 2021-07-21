-- 1) After first load, remember to run PackerInstall!
-- 2) After changes to plugins used, remember to run PackerSync!

--------------------------------------------------------------------------------
print("init.lua bootstrapping packer")
-- https://github.com/wbthomason/packer.nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- FIXME: This is not enough, the init.lua file must be reloaded first: 
-- vim.api.nvim_exec(
--   [[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]],
--   false
-- )


--------------------------------------------------------------------------------
print("init.lua running packer startup")
require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TODO: Configure one by one starting from the top here, i.e. lots of work...:

  -- TREESITTER
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
  use 'vigoux/architext.nvim'
  use 'p00f/nvim-ts-rainbow'
  -- TODO: nvim-treesitter-context or similar
  use 'tpope/vim-commentary' -- TODO: Find a treesitter-based alternative
  -- TODO: surround or alternative

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- use 'mhartington/formatter.nvim' -- competes with LSP or not?

  -- DEBUGGER
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  
  -- SNIPPETS
  use 'norcalli/snippets.nvim'
  use 'nvim-telescope/telescope-snippets.nvim'

  -- TELESCOPE
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use 'nvim-telescope/telescope-hop.nvim'
  use 'nvim-telescope/telescope-github.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'

  -- AUTOCOMPLETION
  use 'hrsh7th/nvim-compe'

  -- STATUSLINE
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
  use 'norcalli/nvim-colorizer.lua'
  -- TODO: Color scheme

  -- MORE TO CHECK OUT:
  -- https://github.com/wellle
  -- tpope
  -- ...
end)


--------------------------------------------------------------------------------
print("init.lua running PackerInstall")
vim.api.nvim_command('PackerInstall')


--------------------------------------------------------------------------------
print("init.lua configuring basics")


--------------------------------------------------------------------------------
print("init.lua configuring plugins")


--------------------------------------------------------------------------------
print('init.lua setting up leadermappings')


--------------------------------------------------------------------------------
print('init.lua completed')

