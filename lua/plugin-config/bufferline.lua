require("plugins")

require("bufferline").setup({
    offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
            --外观
        },

        diagnostics = "nvim_lsp",

        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or " ")
                s = s .. n .. sym
            end
            return s
        end,
})
