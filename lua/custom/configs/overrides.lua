local M = {}

M.treesitter = {
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
    "graphql",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
  autotag = {
    enable = true,
  },
  highlight = {
    disable = {
      "tsx",
      "typescript",
    },
  },
  -- rainbow = {
  --   enable = true,
  --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "eslint_d",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust stuff
    "rust-analyzer",

    "glsl_analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },

  view = {
    width = 35,
  },

  filters = {
    dotfiles = false,
    git_ignored = false,
  },

  -- modified = {
  --   enable = true,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  -- },

  -- highlight_focused_file = true,
}

M.blankline = {
  -- show_current_context = true,
  show_current_context_start = false,
}

return M
