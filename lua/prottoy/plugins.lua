-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
})
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Startup screen
    'goolord/alpha-nvim',
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Colorshceme
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    },
    -- Neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "MunifTanjim/nui.nvim" },
    },
    -- Indent lines
    {
        "shellRaining/hlchunk.nvim",
        opts = require("prottoy.plugin_config.others").hlchunk_opts,
        event = { "BufReadPre", "BufNewFile" },
    },
    -- Undotree
    {
        "jiaoshijie/undotree",
        opts = { float_diff = false }
    },
    -- LSP
    {
        -- Lsp config
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                -- Fidget
                { "j-hui/fidget.nvim", opts = require("prottoy.plugin_config.others").fidget_opts }
            }
        },
        -- Mason
        "williamboman/mason.nvim",
        -- mason lsp config,
        "williamboman/mason-lspconfig.nvim",
        -- Trouble
        {
            "folke/trouble.nvim",
            opts = {}, cmd = "Trouble"
        },
    },
    -- Autocomplete
    {
        -- Completion engine
        {"hrsh7th/nvim-cmp", event = "InsertEnter",
            config = require("prottoy.plugin_config.auto_complete"),
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                -- Snippets and snippet engine
                "saadparwaiz1/cmp_luasnip",
                { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
                -- Lazy Dev
                {
                    "folke/lazydev.nvim", ft = "lua", -- only load on lua files
                    opts = {
                        library = {{ path = "luvit-meta/library", words = { "vim%.uv" } }},
                    }
                },
            }
        },
        {
            'windwp/nvim-autopairs', event = "InsertEnter",
            opts = require("prottoy.plugin_config.others").nvim_autopairs_opts
        }
    },
    -- Comment.nvim
    {
        "numToStr/Comment.nvim", opts = {},
        event = { "BufReadPre", "BufNewFile" }
    },
    -- Glow
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
}

local opts = {}

require("lazy").setup(plugins, opts)
