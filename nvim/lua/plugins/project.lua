return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      manual_mode = false, -- Automatisch Root erkennen
      detection_methods = { "lsp", "pattern" }, -- Erkennung über LSP & Muster
      patterns = { ".git", "package.json", "pyproject.toml", "Makefile" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "tab", -- Arbeitsverzeichnis pro Tab
    })

    -- Telescope-Integration aktivieren
    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("projects")
    end
  end,
  keys = {
    { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find Project" },
  },
}
