return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "package.json", "pyproject.toml", "Makefile" },
      show_hidden = false,
      silent_chdir = true,
      scope_chdir = "tab",
    })

    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("projects")
    end
  end,
  keys = {
    { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find Project" },
  },
}
