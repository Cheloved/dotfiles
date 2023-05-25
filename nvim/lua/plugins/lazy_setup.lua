local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- File tree
	{
		'preservim/nerdtree',
		dependencies = { 'ryanoasis/vim-devicons' }
	},

	-- Fuzzy finder
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	
	-- Color scheme
	{
		'jacoborus/tender.vim',
		config = function()
			vim.cmd('colorscheme tender')
		end
	},

	-- Syntax highlight
	{
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	},

	-- Undo tree
	'mbbill/undotree',

	-- To handle git repos
	'tpope/vim-fugitive',


	-- LSP Autocomplete
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	},

    -- Status bar 
    'vim-airline/vim-airline',

    -- Tagbar for code navigation
    'preservim/tagbar',

    -- Autoclosing brackets
    'jiangmiao/auto-pairs',

    -- Showing tab lines
    -- 'Yggdroot/indentLine',
    'lukas-reineke/indent-blankline.nvim',

    -- Auto commenting with "gc"
    'tpope/vim-commentary',

    -- Bar for tabs
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
          -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            animation = true,
          -- insert_at_start = true,
          -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    -- For color preview
    'norcalli/nvim-colorizer.lua',

    -- Terminal emulator
    {'akinsho/toggleterm.nvim', version = "*", config = true},
}

local opts = {}

require("lazy").setup(plugins, opts)
