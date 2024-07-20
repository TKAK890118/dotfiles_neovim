require("plugins")

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree not found!")
    return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 显示 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 30,
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            resize_window = true,
            quit_on_open = true,
        },
    },
    renderer = {
        indent_markers = {
            --enable = enable,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            }
        }
    }
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
