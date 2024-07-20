require("plugins")

local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("lualine not found!")
    return
end

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
        theme = 'palenight',
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
            { 'filename', icon = '󰷈 ', color = { gui = 'italic' } },
        },
        lualine_c = {
            { GetLSP, icon = ' LSP:', color = { fg = '#ffffff', gui = 'italic' } }, -- Display LSP status
            --{ Text, color = { fg = '#ffffff', gui = 'italic' } }, -- Display a custom text
        },

        lualine_x = {
            { "encoding", color = { fg = '#ffffff', gui = 'italic' } },
            { "filetype", color = { fg = '#ffffff', gui = 'italic' } },
        },

        lualine_y = {
            { 'searchcount', color = { gui = 'italic' } },
            { 'progress',    color = { gui = 'italic' } },
        },
        lualine_z = { 'location' }
    },
})
