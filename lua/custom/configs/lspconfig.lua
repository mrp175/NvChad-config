local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local rust_analyzer = {
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--         command = "clippy",
--       },
--     },
--   },
-- }

local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "pyright" }
-- local servers = { "html", "cssls", "tsserver", "clangd", rust_analyzer }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.o.completeopt = "menuone,noselect"

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
}

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- This function will show diagostic messages in the status line
-- function PrintDiagnostics(opts, bufnr, line_nr, client_id)
--   bufnr = bufnr or 0
--   line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
--   opts = opts or { ["lnum"] = line_nr }
--
--   local line_diagnostics = vim.diagnostic.get(bufnr, opts)
--   if vim.tbl_isempty(line_diagnostics) then
--     return
--   end
--
--   local diagnostic_message = ""
--   for i, diagnostic in ipairs(line_diagnostics) do
--     diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
--     print(diagnostic_message)
--     if i ~= #line_diagnostics then
--       diagnostic_message = diagnostic_message .. "\n"
--     end
--   end
--   vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
-- end
-- vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

--
-- lspconfig.pyright.setup { blabla}
