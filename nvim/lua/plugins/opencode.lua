return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    keys = {
      {
        "<C-a>",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Ask opencode",
      },
      {
        "<C-e>",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Execute opencode action",
      },
      {
        "ga",
        function()
          require("opencode").prompt("@this")
        end,
        mode = { "n", "x" },
        desc = "Add to opencode",
      },
      {
        "<C-t>",
        function()
          require("opencode").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle opencode",
      },
      {
        "<S-C-u>",
        function()
          require("opencode").command("session.half.page.up")
        end,
        desc = "opencode half page up",
      },
      {
        "<S-C-o>",
        function()
          require("opencode").command("session.half.page.down")
        end,
        desc = "opencode half page down",
      },
      {
        "<leader>aa",
        function()
          require("opencode").ask("@this: ", { submit = true })
        end,
        mode = { "n", "x" },
        desc = "Ask about this",
      },
      {
        "<leader>as",
        function()
          require("opencode").select()
        end,
        mode = { "n", "x" },
        desc = "Select prompt",
      },
      {
        "<leader>au",
        function()
          require("opencode").prompt("@this")
        end,
        mode = { "n", "x" },
        desc = "Add this",
      },
      {
        "<leader>at",
        function()
          require("opencode").toggle()
        end,
        desc = "Toggle embedded",
      },
      {
        "<leader>ac",
        function()
          require("opencode").command()
        end,
        desc = "Select command",
      },
      {
        "<leader>an",
        function()
          require("opencode").command("session_new")
        end,
        desc = "New session",
      },
      {
        "<leader>ai",
        function()
          require("opencode").command("session_interrupt")
        end,
        desc = "Interrupt session",
      },
      {
        "<leader>aA",
        function()
          require("opencode").command("agent_cycle")
        end,
        desc = "Cycle selected agent",
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any  see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}
