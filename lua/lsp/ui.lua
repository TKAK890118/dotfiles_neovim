require("plugins")

vim.diagnostic.config({
    --右侧显示文字
    virtual_text = true,
    --左侧图标
    signs = true,
    -- 在输入模式下也更新提示，设置为 true 也许会影响性能
    update_in_insert = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- lspsaga
local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
    debug = false,
    saga_winblend = 0.8,

    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = " ",
    warn_sign = " ",
    hint_sign = " ",
    infor_sign = " ",
    diagnostic_header_icon = " ",

    --正在写入的行的提示
    -- code action title icon
    show_code_action = true,
    show_layout = 'float',
    code_action_icon = " ",
    code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
    },
    code_action_keys = {
        quit = "<Esc>",
        exec = "<CR>",
    },
    rename_action_keys = {
        quit = "<Esc>",
        exec = "<CR>",
    },

    --finder
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    max_preview_lines = 10,
    finder_action_keys = {
        -- open = "o",
        open = "<CR>",
        vsplit = "s",
        split = "i",
        -- quit = "q",
        quit = "<ESC>",
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
    },

    definition_preview_icon = "  ",
    border_style = "single",
    rename_prompt_prefix = "➤ ",
    rename_output_qflist = {
        enable = false,
        auto_open_qflist = false,
    },
    server_filetype_map = {},
    diagnostic_prefix_format = "%d. ",
    diagnostic_message_format = "%m %c",
    highlight_prefix = false,

    ui = {
        theme = "round",
        border = "rounded",
        expand = "", -- shown in sagaoutline
        collapse = "", -- shown in sagaoutline
        code_action = " ",
        lines = { "└", "├", "│", "─", "┌" },
    },
}

-- lspconfig
require("lspconfig.ui.windows").default_options.border = 'single'

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = "single"
    }
)
vim.diagnostic.config({ float = { border = "single" } })
