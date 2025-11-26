return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- wymagana biblioteka
      "nvim-lua/popup.nvim", -- opcjonalna, do niektórych pickerów
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
        },
      })
      -- Wczytanie rozszerzenia yank_history (po zainstalowaniu yanky.nvim)
      pcall(telescope.load_extension, "yank_history")
    end,
  },
}
