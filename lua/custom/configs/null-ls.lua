local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with {
  --   filetypes = {
  --     "javascript",
  --     "typescript",
  --     "css",
  --     "scss",
  --     "html",
  --     "json",
  --     "yaml",
  --     "markdown",
  --     "graphql",
  --     "md",
  --     "txt",
  --   },
  -- }, -- so prettier works only on these filetypes

  null_ls.builtins.formatting.prettier,
  null_ls.builtins.code_actions.eslint_d,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.beautysh,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- you can reuse a shared lspconfig on_attach callback here
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        -- vim.lsp.buf.formatting_sync()
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
