require("plugins")
require("basic")
require("keybindings")
require("autocmd")

require("lsp.cmp")
require("lsp.setup")
require("lsp.ui")

require("plugin-config.autopairs")
require("plugin-config.toggleterm")
require("plugin-config.lualine")
require("plugin-config.nvimtree")
require("plugin-config.bufferline")
require("plugin-config.dashboard")

vim.cmd[[colorscheme nightfly]]
vim.cmd[[TransparentEnable]]
