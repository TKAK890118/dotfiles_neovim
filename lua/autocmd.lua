local autocmd = vim.api.nvim_create_autocmd
local bufset = vim.api.nvim_buf_set_keymap
--cpp
autocmd(
    "FileType",
    {
        pattern = "cpp",
        callback = function()
            bufset(
                0,
                "n",
                "<C-n>",
                --windows compile
                "<ESC>:w<CR>:!g++ -std=c++2a %:t:r.cpp -o %:t:r.exe<CR>",
                { silent = true, noremap = true }
            )
            bufset(
                0,
                "n",
                "<A-n>",
                --windows run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"%:t:r.exe\"<CR>",
                { silent = true, noremap = true }
            )
        end,
    }
)

--c
autocmd(
    "Filetype",
    {
        pattern = "c",
        callback = function()
            bufset(
                0,
                "n",
                "<C-n>",
                --windows compile
                "<ESC>:w<CR>:!gcc %:t:r.c -o %:t:r.exe<CR>",
                { silent = true, noremap = true }
            )
            bufset(
                0,
                "n",
                "<A-n>",
                --windows run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"%:t:r.exe\"<CR>",
                { silent = true, noremap = true }
            )
        end,
    }
)
--lua
autocmd(
    "Filetype",
    {
        pattern = "lua",
        callback = function()
            bufset(
                0,
                "n",
                "<A-n>",
                --lua run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"lua %:t:r.lua\"<CR>",
                { silent = true, noremap = true }
            )
        end,
    }
)
--rust
autocmd(
    "Filetype",
    {
        pattern = "rust",
        callback = function()
            bufset(
                0,
                "n",
                "<C-n>",
                --windows rust compile
                "<ESC>:w<CR>:!rustc %:t:r.rs<CR>",
                { silent = true, noremap = true }
            )
            bufset(
                0,
                "n",
                "<A-n>",
                --windows rust run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"%:t:r.exe\"<CR>",
                { silent = true, noremap = true }
            )
        end
    }
)
--python
autocmd(
    "Filetype",
    {
        pattern = "python",
        callback = function()
            bufset(
                0,
                "n",
                "<A-n>",
                --windows rust run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"python %:t:r.py\"<CR>",
                { silent = true, noremap = true }
            )
        end
    }
)
--go
autocmd(
    "Filetype",
    {
        pattern = "go",
        callback = function()
            bufset(
                0,
                "n",
                "<A-n>",
                --windows rust run
                "<ESC>:w<CR>:TermExec direction=horizontal cmd=\"go run %:t:r.go\"<CR>",
                { silent = true, noremap = true }
            )
        end
    }
)
