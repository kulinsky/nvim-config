return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- Themes
		use 'folke/tokyonight.nvim'
		use 'Mofiqul/dracula.nvim'

		-- LSP
		use 'neovim/nvim-lspconfig'

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		}

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		}

		-- LuaLine
		use {
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		}

		-- Autocomplete
		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-cmdline", -- command line
				"hrsh7th/cmp-buffer", -- buffer completions
				"hrsh7th/cmp-nvim-lua", -- nvim config completions
				"hrsh7th/cmp-nvim-lsp", -- lsp completions
				"hrsh7th/cmp-path", -- file path completions
				"saadparwaiz1/cmp_luasnip", -- snippets completions
			},
		}

		-- snippets
		use {
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets",
			},
		}

		-- tpope
		use 'tpope/vim-fugitive'
		use 'tpope/vim-surround'

		-- commenting
		use 'JoosepAlviste/nvim-ts-context-commentstring'
		use { "numToStr/Comment.nvim", tag = "v0.6" }

		-- windwp
		use 'windwp/nvim-autopairs'
		use 'windwp/nvim-spectre' -- Spectre for find and replace

		use 'airblade/vim-gitgutter'

		-- icons
		use 'kyazdani42/nvim-web-devicons'

		-- icons in completion
		use 'onsails/lspkind-nvim'

		use {
			'folke/trouble.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			config = function()
				require('trouble').setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				}
			end
		}

		use {
		    'nvim-tree/nvim-tree.lua',
		    requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		    },
		    tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}

		-- WhichKey
		use 'folke/which-key.nvim'

		-- Todo comments
		use {
			'folke/todo-comments.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = function()
				require('todo-comments').setup({})
				end,
		}

		use {
		    'akinsho/bufferline.nvim',
		    tag = 'v2.*',
		    requires = 'kyazdani42/nvim-web-devicons'
		}

		-- better code action menu
		use {
		    "weilbith/nvim-code-action-menu",
		    cmd = "CodeActionMenu",
		}

		-- sessions
		use {
		    'rmagatti/auto-session',
		    config = function()
			require('auto-session').setup({
			    log_level = 'error',
			    auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/'},
			})
		    end,
		}

		use {
		    'rmagatti/session-lens',
		    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
		    config = function()
			require("session-lens").setup({--[[your custom config--]]})
		    end,
		}

        -- Database
        use 'tpope/vim-dadbod'
        use 'kristijanhusak/vim-dadbod-ui'

        use 'ThePrimeagen/vim-be-good'

    end
})
