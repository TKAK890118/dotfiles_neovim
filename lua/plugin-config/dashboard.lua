require("plugins")

local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("dashboard not found!")
    return
end

-- db.custom_footer = {
--     text[randomNum],
--     "",
--     "",
-- }

db.custom_center = {
    --New file
    {
        --icon = '⚡',
        icon = ' ',
        icon_hl = 'Title',
        desc = ' New File',
        desc_hl = 'String',
        key = 'n',
        keymap = '',
        key_format = ' %s', -- remove default surrounding `[]`
        key_hl = 'Number',
        action = 'enew'
    },
    --use telescope.nvim to get to recent file
    {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' Recently File',
        desc_hl = 'String',
        key = 'r',
        keymap = '',
        key_format = ' %s',
        key_hl = 'Number',
        action = 'Telescope oldfiles'
    },
    --use telescope.nvim to Search file
    {
        icon = '󰛔 ',
        icon_hl = 'Title',
        desc = ' Find File',
        desc_hl = 'String',
        key = 'f',
        keymap = '',
        key_format = ' %s',
        key_hl = 'Number',
        action = 'Telescope fd'
    },

    -- edit keybindings
    {
        icon = '󰘳 ',
        icon_hl = 'Title',
        desc = ' Edit Keybindings',
        desc_hl = 'String',
        key = 'k',
        keymap = '',
        key_format = ' %s',
        key_hl = 'Number',
        --windows
        action = "edit ~/AppData/Local/nvim/lua/keybindings.lua"
        --unix
        --action = "edit ..."
    },

    --Update plugin
    {
        icon = '󰘲 ',
        icon_hl = 'Title',
        desc = ' Update Plugins',
        desc_hl = 'String',
        key = 'u',
        keymap = '',
        key_format = ' %s', -- remove default surrounding `[]`
        key_hl = 'Number',
        action = 'Lazy update'
    },
    --Exit
    {
        icon = '󰈆 ',
        icon_hl = 'Title',
        desc = ' Exit',
        desc_hl = 'String',
        key = 'q',
        keymap = '',
        key_format = ' %s',
        key_hl = 'Number',
        action = 'exit',
    },
}

local text = {
    --octane
    "Non Terrae Plus Ultra!!!",
    "Run fast. Hit fast. Win fast.",
    "Harder, faster, stronger.",
    "All aboard the Octrain!",
    "By the time you see me coming, I'll be going, and you'll be gone.",
    --horizon
    "When you're a matser of balck holes... relativity becomes...well, relative.",
    "Time for bold action!",
    "I've seen the future. Now I just need to get there.",
    "When you see me, you'll know it's the end. Or a new beginnin'. It's all relative, really.",
    "Repulsors, check. Stabilisers, check. Best buddy, check.",
    --crypto
    "I'm not a pawn. I'm here to break the game.",
    "If I know who you are, so do they. Break the rules and you're gone.",
    "With an eye in the sky, there's nothing to fear.",
}
local randomNum = math.random(#text)
local len = string.len(text[randomNum])
local line = string.rep("─", len)

db.custom_header = {
    "",
    "",
    "",
    "",
    "",

    -- "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
    -- "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    -- "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ",
    -- "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    -- "          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    -- "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    -- "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    -- " ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    -- " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ",
    -- "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    -- "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",

    -- "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    -- "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    -- "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    -- "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    -- "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    -- "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    -- "                                                     ",
    -- [[                                                                       ]],
    -- [[  ██████   █████                   █████   █████  ███                  ]],
    -- [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
    -- [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
    -- [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
    -- [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
    -- [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
    -- [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
    -- [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
    -- [[                                                                       ]],

    -- [[                                                                       ]],
    -- [[                                                                     ]],
    -- [[       ████ ██████           █████      ██                     ]],
    -- [[      ███████████             █████                             ]],
    -- [[      █████████ ███████████████████ ███   ███████████   ]],
    -- [[     █████████  ███    █████████████ █████ ██████████████   ]],
    -- [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    -- [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    -- [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    -- [[                                                                       ]],

    -- [[░▒▓███████▓▒░░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓███████▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░   ░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░  ]],
    -- [[░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ]],
    -- [[░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ]],
    -- [[░▒▓███████▓▒░░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░       ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓███████▓▒░░▒▓████████▓▒░ ]],
    -- [[░▒▓█▓▒░      ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ]],
    -- [[░▒▓█▓▒░      ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ]],
    -- [[░▒▓█▓▒░      ░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░        ░▒▓██████▓▒░░▒▓████████▓▒░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ]],

    -- [[ ____  _             _   _ _ _             ]],
    -- [[|  _ \| |_   _ ___  | | | | | |_ _ __ __ _ ]],
    -- [[| |_) | | | | / __| | | | | | __| '__/ _` |]],
    -- [[|  __/| | |_| \__ \ | |_| | | |_| | | (_| |]],
    -- [[|_|   |_|\__,_|___/  \___/|_|\__|_|  \__,_|]],

    [[ ________  ___       ___  ___  ________           ___  ___  ___   _________  ________  ________     ]],
    [[|\   __  \|\  \     |\  \|\  \|\   ____\         |\  \|\  \|\  \ |\___   ___\\   __  \|\   __  \    ]],
    [[\ \  \|\  \ \  \    \ \  \\\  \ \  \___|_        \ \  \\\  \ \  \\|___ \  \_\ \  \|\  \ \  \|\  \   ]],
    [[ \ \   ____\ \  \    \ \  \\\  \ \_____  \        \ \  \\\  \ \  \    \ \  \ \ \   _  _\ \   __  \  ]],
    [[  \ \  \___|\ \  \____\ \  \\\  \|____|\  \        \ \  \\\  \ \  \____\ \  \ \ \  \\  \\ \  \ \  \ ]],
    [[   \ \__\    \ \_______\ \_______\____\_\  \        \ \_______\ \_______\ \__\ \ \__\\ _\\ \__\ \__\]],
    [[    \|__|     \|_______|\|_______|\_________\        \|_______|\|_______|\|__|  \|__|\|__|\|__|\|__|]],
    [[                                 \|_________|                                                       ]],


    " ╭" .. line .. "╮",
    " │" .. text[randomNum] .. "│",
    " ╰" .. line .. "╯",
    "",
}

db.setup({
    theme = 'doom',
    config = {
        header = db.custom_header,
        center = db.custom_center,
        footer = db.custom_footer,
    }
})
