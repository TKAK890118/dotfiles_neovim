require("plugins")

local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("lualine not found!")
    return
end


--My theme: NeoLine
local colors = {
    black        = '#1c1e26',
    white        = '#6C6F93',
    red          = '#F43E5C',
    green        = '#98be65',
    blue         = '#a9a1e1',
    yellow       = '#fdee78',
    gray         = '#ec5f67',
    darkgray     = '#1A1C23',
    lightgray    = '#2E303E',
    inactivegray = '#1C1E26',
}

local NeoLine = {
    normal = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
    },
    insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
    },
    replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
    },
    command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
    },
    inactive = {
        a = { bg = colors.inactivegray, fg = colors.lightgray, gui = 'bold' },
        b = { bg = colors.inactivegray, fg = colors.lightgray },
        c = { bg = colors.inactivegray, fg = colors.lightgray },
    },
}

local function Text()
    return [[Non Terrae Plus Ultra !!!]]
end

local function Symbol()
    return [[]]
end

local function GetLSP()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

lualine.setup({
    options = {
        theme = auto,
        -- theme = NeoLine,
        section_separators = { left = '', right = '' },
        --component_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
        -- https://github.com/ryanoasis/powerline-extra-symbols
    },
    --根据不同窗口显示
    extensions = { "nvim-tree", "toggleterm", "trouble", "lazy" },
    sections = {
        lualine_a = {
            { Symbol },
            'mode'
        },
        lualine_b = {
            'diagnostics',
            { 'filename', color = { gui = 'italic' } },
        },
        lualine_c = {
            { GetLSP, icon = ' LSP:', color = { fg = '#ffffff', gui = 'italic' } }, -- Display LSP status
            { Text, color = { fg = '#ffffff', gui = 'italic' } }, -- Display a custom text
        },

        lualine_x = {
            --"filesize",
            -- {
            --     "fileformat",
            --     symbols = {
            --         unix = ' ',
            --         dos = ' ',
            --     },
            -- },
            { "encoding", color = { fg = '#ffffff', gui = 'italic' } },
            { "filetype", color = { fg = '#ffffff', gui = 'italic' } },
        },

        lualine_y = {
            { 'searchcount', color = { gui = 'italic' } },
            { 'progress',    color = { gui = 'italic' } },
        },
        lualine_z = { 'location' }
    },
    --Inserts a component in lualine_c at left section
})

-- local lualine = require('lualine')
--
-- -- Color table for highlights
-- -- stylua: ignore
-- local colors = {
--   bg       = '#202328',
--   fg       = '#bbc2cf',
--   yellow   = '#ECBE7B',
--   cyan     = '#008080',
--   darkblue = '#081633',
--   green    = '#98be65',
--   orange   = '#FF8800',
--   violet   = '#a9a1e1',
--   magenta  = '#c678dd',
--   blue     = '#51afef',
--   red      = '#ec5f67',
-- }
--
local conditions = {
    --   buffer_not_empty = function()
    --     return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    --   end,
    --   hide_in_width = function()
    --     return vim.fn.winwidth(0) > 80
    --   end,
    --   check_git_workspace = function()
    --     local filepath = vim.fn.expand('%:p:h')
    --     local gitdir = vim.fn.finddir('.git', filepath .. ';')
    --     return gitdir and #gitdir > 0 and #gitdir < #filepath
    --   end,
    -- }
    --
    -- -- Config
    -- local config = {
    --   options = {
    --     -- Disable sections and component separators
    --     component_separators = '',
    --     section_separators = '',
    --     theme = {
    --       -- We are going to use lualine_c an lualine_x as left and
    --       -- right section. Both are highlighted by c theme .  So we
    --       -- are just setting default looks o statusline
    --       normal = { c = { fg = colors.fg, bg = colors.bg } },
    --       inactive = { c = { fg = colors.fg, bg = colors.bg } },
    --     },
    --   },
    --   sections = {
    --     -- these are to remove the defaults
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_y = {},
    --     lualine_z = {},
    --     -- These will be filled later
    --     lualine_c = {},
    --     lualine_x = {},
    --   },
    --   inactive_sections = {
    --     -- these are to remove the defaults
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_y = {},
    --     lualine_z = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --   },
    -- }
    --
    -- -- Inserts a component in lualine_c at left section
    -- local function ins_left(component)
    --   table.insert(config.sections.lualine_c, component)
    -- end
    --
    -- -- Inserts a component in lualine_x at right section
    -- local function ins_right(component)
    --   table.insert(config.sections.lualine_x, component)
    -- end
    --
    -- ins_left {
    --   function()
    --     return '▊'
    --   end,
    --   color = { fg = colors.blue }, -- Sets highlighting of component
    --   padding = { left = 0, right = 1 }, -- We don't need space before this
    -- }
    --
    -- ins_left {
    --   -- mode component
    --   function()
    --     return ''
    --   end,
    --   color = function()
    --     -- auto change color according to neovims mode
    --     local mode_color = {
    --       n = colors.red,
    --       i = colors.green,
    --       v = colors.blue,
    --       [''] = colors.blue,
    --       V = colors.blue,
    --       c = colors.magenta,
    --       no = colors.red,
    --       s = colors.orange,
    --       S = colors.orange,
    --       [''] = colors.orange,
    --       ic = colors.yellow,
    --       R = colors.violet,
    --       Rv = colors.violet,
    --       cv = colors.red,
    --       ce = colors.red,
    --       r = colors.cyan,
    --       rm = colors.cyan,
    --       ['r?'] = colors.cyan,
    --       ['!'] = colors.red,
    --       t = colors.red,
    --     }
    --     return { fg = mode_color[vim.fn.mode()] }
    --   end,
    --   padding = { right = 1 },
    -- }
    --
    -- ins_left {
    --   -- filesize component
    --   'filesize',
    --   cond = conditions.buffer_not_empty,
    -- }
    --
    -- ins_left {
    --   'filename',
    --   cond = conditions.buffer_not_empty,
    --   color = { fg = colors.magenta, gui = 'bold' },
    -- }
    --
    -- ins_left { 'location' }
    --
    -- ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }
    --
    -- ins_left {
    --   'diagnostics',
    --   sources = { 'nvim_diagnostic' },
    --   symbols = { error = ' ', warn = ' ', info = ' ' },
    --   diagnostics_color = {
    --     color_error = { fg = colors.red },
    --     color_warn = { fg = colors.yellow },
    --     color_info = { fg = colors.cyan },
    --   },
    -- }
    --
    -- -- Insert mid section. You can make any number of sections in neovim :)
    -- -- for lualine it's any number greater then 2
    -- ins_left {
    --   function()
    --     return '%='
    --   end,
    -- }
    --
    -- ins_left {
    --   -- Lsp server name .
    --   function()
    --     local msg = 'No Active Lsp'
    --     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    --     local clients = vim.lsp.get_active_clients()
    --     if next(clients) == nil then
    --       return msg
    --     end
    --     for _, client in ipairs(clients) do
    --       local filetypes = client.config.filetypes
    --       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
    --         return client.name
    --       end
    --     end
    --     return msg
    --   end,
    --   icon = ' LSP:',
    --   color = { fg = '#ffffff', gui = 'bold' },
    -- }
    --
    -- -- Add components to right sections
    -- ins_right {
    --   'o:encoding', -- option component same as &encoding in viml
    --   fmt = string.upper, -- I'm not sure why it's upper case either ;)
    --   cond = conditions.hide_in_width,
    --   color = { fg = colors.green, gui = 'bold' },
    -- }
    --
    -- ins_right {
    --   'fileformat',
    --   fmt = string.upper,
    --   icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    --   color = { fg = colors.green, gui = 'bold' },
    -- }
    --
    -- ins_right {
    --   'branch',
    --   icon = '',
    --   color = { fg = colors.violet, gui = 'bold' },
    -- }
    --
    -- ins_right {
    --   'diff',
    --   -- Is it me or the symbol for modified us really weird
    --   symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    --   diff_color = {
    --     added = { fg = colors.green },
    --     modified = { fg = colors.orange },
    --     removed = { fg = colors.red },
    --   },
    --   cond = conditions.hide_in_width,
    -- }
    --
    -- ins_right {
    --   function()
    --     return '▊'
    --   end,
    --   color = { fg = colors.blue },
    --   padding = { left = 1 },
    -- }
    --
    -- -- Now don't forget to initialize lualine
    -- lualine.setup(config)
}
