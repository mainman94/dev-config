return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true, -- optional: zeigt auch Dateien aus .gitignore
      },
    },
  },
}
