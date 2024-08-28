-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- add your plugins here
        {
            "ramojus/mellifluous.nvim",
            -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
            config = function()
                require("mellifluous").setup({}) -- optional, see configuration section.
                vim.cmd("colorscheme mellifluous")
            end,
        },
        {
            "craftzdog/solarized-osaka.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        },
        { 'sainnhe/gruvbox-material' },
        {
            "zenbones-theme/zenbones.nvim",
            -- Optionally install Lush. Allows for more configuration or extending the colorscheme
            -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
            -- In Vim, compat mode is turned on as Lush only works in Neovim.
            dependencies = "rktjmp/lush.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        },
        { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
        {
            'sainnhe/sonokai',
            config = function()
                vim.g.sonokai_enable_italic = '1'
                vim.g.sonokai_transparent_background = '2'
                vim.g.sonokai_diagnostic_virtual_text = 'highlighted'
            end,
        },

        -- tokyonight
        {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {
                transparent = true,
                styles = {
                    comments = { italic = true },
                    keywords = { bold = true },
                    sidebars = "transparent",
                    floats = "transparent",
                },
                integrations = {
                    nvimtree = {
                        enable = true,
                        show_root = false,
                        transparent_panel = true,
                    }
                },
            }
        },
        -- nvim-treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")
                configs.setup({
                    ensure_installed = { "c", "lua", "python", "bash", "cpp", "cmake", "go", "rust" },
                    sync_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end
        },
        -- nvim-web-devicons
        {
            'nvim-tree/nvim-web-devicons',
            config = function()
                require("nvim-web-devicons").set_icon({
                    go = {
                        icon = '󰟓 ',
                        color = '#48CAE4',
                        name = "Go"
                    },
                    dat = {
                        icon = '',
                        color = '#DDDDFF',
                        name = "dat"
                    },

                })
            end,
        },

        -- nvim-lspconfig
        { "neovim/nvim-lspconfig" },

        -- mason
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup({
                    ui = { border = "single" },
                })
            end,
        },

        -- mason-lsp-config
        { "williamboman/mason-lspconfig.nvim" },

        -- nvim-cmp
        { "hrsh7th/nvim-cmp" },

        -- snippet engine
        -- Luasnip
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
        },

        -- completion source
        { "hrsh7th/cmp-nvim-lsp" },     -- { name = nvim_lsp }
        { "hrsh7th/cmp-buffer" },       -- { name = 'buffer' },
        { "hrsh7th/cmp-path" },         -- { name = 'path' }
        { "hrsh7th/cmp-cmdline" },      -- { name = 'cmdline' }
        { 'saadparwaiz1/cmp_luasnip' }, -- luasnip

        -- lspsaga
        {
            'nvimdev/lspsaga.nvim',
            config = function()
                require('lspsaga').setup({})
            end,
            dependencies = {
                'nvim-treesitter/nvim-treesitter', -- optional
                'nvim-tree/nvim-web-devicons',     -- optional
            }
        },

        -- lualine
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
        },

        -- bufferline
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
                require("bufferline").setup {}
            end
        },

        -- Indent blankline
        {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("ibl").setup({
                    indent = {
                        char = "│",
                        tab_char = "│",
                    },
                    scope = { show_start = false, show_end = false },
                    exclude = {
                        filetypes = {
                            "help",
                            "dashboard",
                            "neo-tree",
                            "Trouble",
                            "lazy",
                            "mason",
                            "notify",
                            "toggleterm",
                        },
                    },
                })
            end
        },

        -- autopair
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true,
            opts = {

            }
            -- use opts = {} for passing setup options
            -- this is equalent to setup({}) function
        },

        -- toggleterm
        {
            'akinsho/toggleterm.nvim',
            version = "*",
            config = true,
        },

        -- comment
        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
            },
            lazy = false,
        },

        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = true,
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("nvim-tree").setup({

                })
            end
        },

        -- bufferline
        {
            'akinsho/bufferline.nvim',
            version = "*",
            dependencies = 'nvim-tree/nvim-web-devicons',
        },

        -- telescope
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.6',
            dependencies = { 'nvim-lua/plenary.nvim' },
            config = function()
                require("telescope").setup {}
            end
        },

        -- dashboard
        {
            'nvimdev/dashboard-nvim',
            dependencies = { { 'nvim-tree/nvim-web-devicons' } }
        },

        -- noice
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            config = function()
                require("notify").setup({
                    background_colour = "#000000"
                })
                require("noice").setup({
                    cmdline = {
                        view = "cmdline",
                    },
                })
            end,

            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        },
        -- trouble
        {
            "folke/trouble.nvim",
            opts = {}, -- for default options, refer to the configuration section for custom setup.
            cmd = "Trouble",
            keys = {
                {
                    "<leader>xx",
                    "<cmd>Trouble diagnostics toggle<cr>",
                    desc = "Diagnostics (Trouble)",
                },
                {
                    "<leader>xX",
                    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                    desc = "Buffer Diagnostics (Trouble)",
                },
                {
                    "<leader>cs",
                    "<cmd>Trouble symbols toggle focus=false<cr>",
                    desc = "Symbols (Trouble)",
                },
                {
                    "<leader>cl",
                    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                    desc = "LSP Definitions / references / ... (Trouble)",
                },
                {
                    "<leader>xL",
                    "<cmd>Trouble loclist toggle<cr>",
                    desc = "Location List (Trouble)",
                },
                {
                    "<leader>xQ",
                    "<cmd>Trouble qflist toggle<cr>",
                    desc = "Quickfix List (Trouble)",
                },
            },
        },
        { 'norcalli/nvim-colorizer.lua' },
        -- transparent
        {
            "xiyaowong/transparent.nvim",
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
    ui = {
        border = "single",
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 60,
    }
})
