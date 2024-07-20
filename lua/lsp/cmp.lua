require("plugins")

local cmp = require("cmp")
local winhighlight = {
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}

require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({

    snippet = {
        expand = function(args)
            -- For `luasnip` users.
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, --lsp
        { name = "buffer" },   --text within current buffer
        { name = "path" },     --file system paths
        { name = "luasnip" }   --for luasnip users
    }),

    mapping = require("keybindings").cmp(cmp),
    window = {
        completion = cmp.config.window.bordered(winhighlight),
        documentation = cmp.config.window.bordered(winhighlight),
    },
    preselect = cmp.PreselectMode.None,
    formatting = {
        fields = {
            "kind",
            "abbr",
            "menu"
        },
    }
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
        option = {
            ignore_cmds = { 'Man', '!' },
        }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
