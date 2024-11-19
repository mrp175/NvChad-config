-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

opt.scrolloff = 10
opt.swapfile = false
opt.relativenumber = true
opt.hlsearch = true
opt.spell = false

g.mapleader = "`"

vim.filetype.add {
  extension = {
    mdx = "mdx",
  },
}

-- vim.cmd [[highlight CurrentSearch ctermfg=0 guibg=black]]
vim.cmd [[highlight CurrentSearch ctermbg=0 guibg=#639fff]]
vim.cmd [[highlight CurrentSearch ctermbg=0 guibg=#ff6969]]
-- vim.cmd [[highlight CurrentSearch ctermbg=0 guifg=black]]
-- vim.cmd [[highlight SearchCursor ctermbg=0 guibg=red]]
--
-- highlight link Searchlight Incsearch

-- vim.api.nvim_set_hl(0, "Searchlight", { link = "blue" })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = vim.api.nvim_create_augroup("group", { clear = true }),
--   pattern = "**/*.rs",
--   callback = function()
--     local format_rust_job = vim.fn.jobstart { "cargo", "fmt" }
--     vim.fn.jobwait { format_rust_job }
--     vim.cmd "e!"
--     vim.cmd "w"
--   end,
-- })

vim.treesitter.language.register("markdown", "mdx")
