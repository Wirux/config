return {
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      local oil = require("oil")
      oil.setup({
        keymaps = {
          ["?"] = { "actions.show_help", mode = "n" },
          ["q"] = { "actions.close", mode = "n" },
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 4,
          -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          max_width = 0.7,
          max_height = 0.7,
          -- border = 2,
          win_options = {
            winblend = 2,
          },
        },
      })
    end,
    keys = {
      { "<leader>o", "<cmd>Oil --float<cr>", desc = "Open Oil dir manager" },
    },
  },
}
