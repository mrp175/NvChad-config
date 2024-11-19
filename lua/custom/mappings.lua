---@type MappingsTable
local M = {}

M.general = {
  -- n = {
  --   [";"] = { ":", "enter command mode", opts = { nowait = true } },
  --   ["<leader>tt"] = {
  --     function()
  --       require("base46").toggle_transparency()
  --     end,
  --     "toggle transparency",
  --   },
  -- },
  v = {
    ["Y"] = { '"*y', "Yank text to clipboard" },
  },
}

M.telescope = {
  n = {
    ["<leader>rr"] = { ":Telescope resume<CR>", "Resume last search" },
    ["<leader>fs"] = { "<cmd> Telescope live_grep search_dirs=. <CR>", "Live grep in current directory" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.minimap = {
  n = {
    ["<leader>m"] = { "<cmd> MinimapToggle <CR>", "Toggle Minimap" },
  },
}

M.movement = {
  n = {
    ["f + char"] = { "", "Go to first character in line" },
  },
}

M.Search_and_Replace = {
  n = {
    ["<leader>lr"] = { ":s/", "Search and replace on current line" },
    ["<leader>rl"] = { ':s/<C-r>"/', "Search and replace on current line with last yank" },
    ["<leader>ar"] = { ":%s/", "Search and replace across all lines" },
    ["<leader>ra"] = { ':%s/<C-r>"/', "Search and replace across all lines with last yank" },
  },
  v = {
    ["<leader>vr"] = { ":s/", "Search and replace in visual selection" },
    ["<leader>rv"] = { ':s/<C-r>"/', "Search and replace in visual selection with last yank" },
  },
}

M.Rust = {
  n = {
    ["<leader>;"] = {
      function()
        local format_rust_job = vim.fn.jobstart { "cargo", "fmt" }
        vim.fn.jobwait { format_rust_job }
        vim.cmd "e!"
        vim.cmd "w"
      end,
      "format rust",
    },
  },
}

-- M.harpoon = {
--   n = {
--     ["<leader>a"] = {
--       function()
--         harpoon.ui:toggle_quick_menu(harpoon:list())
--       end,
--       "Toggle quick menu",
--     },
--   },
-- }

-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- more keybinds!

return M
