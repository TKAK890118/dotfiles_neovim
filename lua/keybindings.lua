--定义快捷键时 <leader>就是空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数，之后就可以这样映射按键了 map('模式', '按键', '映射为', 'options')
local opt = { noremap = true, silent = true }
--格式化代码
vim.keymap.set('n', '<C-x>', vim.lsp.buf.format, {})

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

-- Terminal相关
--用 空格 + t 在下边窗口打开，或 空格 + vt 侧边窗口打开
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
--关闭内置命令行
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本 当然也可以用方向键
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

--normal模式u撤销改成Ctrl+z
map("n", "<C-z>", "u", opt)

--浏览代码
-- 上下滚动浏览
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

--visual模式复制改成C-c
map("v", "<C-c>", "y", opt)
-- 在visual 模式里粘贴不要复制
map("v", "<C-v>", '"_dP', opt)

-- 退出
map("n", "q", ":q<CR>", opt)
--强制退出
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

--Lspsaga
--Check function's definition
vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga hover_doc<cr>')
-- Comment 显示注释文档
vim.keymap.set('n', '<C-g>', '<cmd>Lspsaga lsp_finder<cr>')
-- Code action
vim.keymap.set('n', '<C-a>', '<cmd>Lspsaga code_action<cr>')
-- jump to declaration  跳转到声明
vim.keymap.set('n', '<A-d>', '<cmd>Lspsaga peek_definition<cr>')

local pluginKeys = {}

map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    -- 分屏打开文件
    { key = "v",                              action = "vsplit" },
    { key = "h",                              action = "split" },
    -- 显示隐藏文件
    { key = "i",                              action = "toggle_custom" },   -- 对应 filters 中的 custom (node_modules)
    { key = ".",                              action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "<F5>",                           action = "refresh" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "remove" },
    { key = "r",                              action = "rename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "s",                              action = "system_open" },
}

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":bdelete!<CR>", opt)

-- cmp
pluginKeys.cmp = function(cmp)
    return {
        -- Show completion
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- Hide completion
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- previous suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- next suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- confirm suggestion
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- scroll
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end

-- toggleterm
pluginKeys.mapToggleTerm = function(toggleterm)
    vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
    vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
    vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
end


-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

--Dashboard
map("n", "<F1>", ":Dashboard<CR>", opt)
--Mason
map("n", "<F2>", ":Mason<CR>", opt)
--LSPInfo
map("n", "<F3>", ":LspInfo<CR>", opt)

return pluginKeys
