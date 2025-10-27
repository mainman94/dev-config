-- Disable linters / diagnostics integrations
-- This file is a small Lazy.nvim plugin spec that disables the nvim-lint plugin
-- which is present in your `lazy-lock.json`.

return {
  -- Disable the external 'nvim-lint' plugin (mfussenegger/nvim-lint)
  -- Lazy will see this spec and not load the plugin.
  { "mfussenegger/nvim-lint", enabled = false },

  -- Alternative options (uncomment and adjust to use):
  -- 1) Disable diagnostic display globally (keeps LSP running but hides diagnostics):
  --    vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })
  -- 2) Disable diagnostics only for Go files via autocommand:
  --    vim.api.nvim_create_autocmd({"FileType"}, {
  --      pattern = {"go"},
  --      callback = function() vim.diagnostic.disable(0) end,
  --    })
  -- 3) Prevent specific LSP server from starting (adjust in your lsp server setup):
  --    require('lspconfig').gopls.setup({ on_attach = function() end, enabled = false })
}
