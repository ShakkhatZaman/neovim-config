-- Lazy plugin manager
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
	-- Impatient
	'lewis6991/impatient.nvim',
	-- Startup screen
	'goolord/alpha-nvim',
	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- Colorshceme
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	-- Deviocons
	"nvim-tree/nvim-web-devicons",
	{
		-- Lualine
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
	},
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- Neotree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "MunifTanjim/nui.nvim" }
	},
	-- Indent lines
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, lazy = true },
	-- Toggletrerm 
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	-- LSP 
	{
		-- Mason 
		"williamboman/mason.nvim",
		-- mason lasp config,
		"williamboman/mason-lspconfig.nvim",
		-- Lsp config
		"neovim/nvim-lspconfig",
		--"ranjithshegde/ccls.nvim"
		"folke/trouble.nvim",
	},
	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "hrsh7th/cmp-nvim-lu"hrsh7th/cmp-nvim-lua",
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
		"saadparwaiz1/cmp_luasnip",
		{ 'windwp/nvim-autopairs', event = "InsertEnter", }
	},
    { 'numToStr/Comment.nvim', lazy = false, }
}

local opts = {}

require("lazy").setup(plugins, opts)
