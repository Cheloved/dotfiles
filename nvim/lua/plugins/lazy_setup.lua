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
		-- tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Color schemes
	{ 'jacoborus/tender.vim', },
	{ 'Matsuuu/pinkmare', },
    { "rebelot/kanagawa.nvim", },
    { "Yagua/nebulous.nvim", },

	-- Syntax highlight
	{
		'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
	},

    -- Emacs-like orgmode
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            }

            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end,
    },

	-- Undo tree
	'mbbill/undotree',

	-- To handle git repos
	'tpope/vim-fugitive',

    -- Autocompletion
    --{
    --    'saghen/blink.cmp',
    --    -- optional: provides snippets for the snippet source
    --    dependencies = 'rafamadriz/friendly-snippets',

    --    -- use a release tag to download pre-built binaries
    --    version = '*',
    --    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    --    -- build = 'cargo build --release',
    --    -- If you use nix, you can build from source using latest nightly rust with:
    --    -- build = 'nix run .#build-plugin',

    --    ---@module 'blink.cmp'
    --    ---@type blink.cmp.Config
    --    opts = {
    --        -- 'default' for mappings similar to built-in completion
    --        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    --        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    --        -- See the full "keymap" documentation for information on defining your own keymap.
    --        keymap = { preset = 'enter' },

    --        appearance = {
    --            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    --            -- Useful for when your theme doesn't support blink.cmp
    --            -- Will be removed in a future release
    --            use_nvim_cmp_as_default = true,
    --            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --            -- Adjusts spacing to ensure icons are aligned
    --            nerd_font_variant = 'mono'
    --        },

    --        -- Default list of enabled providers defined so that you can extend it
    --        -- elsewhere in your config, without redefining it, due to `opts_extend`
    --        sources = {
    --            default = { 'lsp', 'path', 'snippets', 'buffer' },
    --        },
    --    },
    --    opts_extend = { "sources.default" }
    --},

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
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',

    -- Transparency
    'xiyaowong/transparent.nvim',

    -- Tagbar for code navigation
    'preservim/tagbar',

    -- Autoclosing brackets
    'jiangmiao/auto-pairs',

    -- Showing tab lines
    'lukas-reineke/indent-blankline.nvim',

    -- Auto commenting with "gc"
    'tpope/vim-commentary',

    -- Bar for tabs
    -- {
    --     'romgrk/barbar.nvim',
    --     dependencies = {
    --         'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --         'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --     },
    --     init = function() vim.g.barbar_auto_setup = false end,
    --     opts = {
    --       -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --         animation = true,
    --         icons = {
    --             button = '󱎘',
    --         },
    --       -- insert_at_start = true,
    --       -- …etc.
    --     },
    --     version = '^1.0.0', -- optional: only update when a new 1.x version is released
    -- },

    {
        'nanozuki/tabby.nvim',
        -- event = 'VimEnter', -- if you want lazy load, see below
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- configs...
        end,
    },

    -- For color preview
    'norcalli/nvim-colorizer.lua',

    -- Terminal emulator
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- File explorer
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Discord Presence
    'andweeb/presence.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)
