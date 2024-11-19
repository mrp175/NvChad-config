-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "#7d7d7d",
  },
  Search = {
    bg = "yello",
    fg = "black",
  },
  IncSearch = {
    bg = "pink",
    fg = "white",
  },
  DiagnosticVirtualTextHint = {
    fg = "yellow",
  },
  DiagnosticHint = {
    fg = "yellow",
  },
  DiagnosticError = {
    -- bg = "red",
    -- fg = "red",
  },
  DiagnosticWarn = {
    -- bg = "red",
  },
  highlight = {
    CurrentSearch = "red",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
