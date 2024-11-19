local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = overrides.treesitter,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "comment",
        "rust",
        "glsl",
        "graphql",
        "yaml",
        "terraform",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python
        -- },
      },
      highlight = {
        additional_vim_regex_highlighting = false,
        use_languagetree = false,
      },
      autotag = {
        enable = true,
      },
      rainbow = {
        enable = true,
        disable = { "tsx", "jsx" },
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
  },

  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
    enabled = false,
  },

  -- {
  --   "p00f/nvim-ts-rainbow",
  --   lazy = false,
  -- },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "wfxr/minimap.vim",
    cmd = "MinimapToggle",
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  -- {
  --   "adamheins/vim-highlight-match-under-cursor",
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
  },

  {
    "kamykn/spelunker.vim",
    lazy = false,
  },

  -- {
  --   "qxxxb/vim-searchhi",
  --   lazy = false,
  -- },

  {
    "PeterRincker/vim-searchlight",
    lazy = false,
  },

  {
    "tikhomirov/vim-glsl",
    lazy = false,
  },

  -- {
  --   "jparise/vim-graphql",
  --   lazy = false,
  -- },

  {
    "sindrets/diffview.nvim",
    lazy = false,
  },

  --   vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>=",
        function()
          require("harpoon"):list():add()
        end,
        desc = "harpoon add file",
      },
      {
        "<leader>j",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
      {
        "<UP>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon previous buffer in list",
      },
      {
        "<DOWN>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon next buffer in list",
      },
    },
  },

  { "dhruvasagar/vim-table-mode", lazy = false },
  { "kdheepak/lazygit.nvim", lazy = false },
}

return plugins
