return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			pcall(require("nvim-treesitter.install").update { with_sync = true })
		end,
	},
	{
		"mbbill/undotree",
	},
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
	{
		"numToStr/Comment.nvim",
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"j-hui/fidget.nvim",
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = {"yarn install", "yarn build"},
	},
}