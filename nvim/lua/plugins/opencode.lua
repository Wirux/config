return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any � see `lua/opencode/config.lua`, or "goto definition".
      }

      -- Required for `opts.events.reload`.
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<C-a>", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode" })
      vim.keymap.set({ "n", "x" }, "<C-e>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action" })
      vim.keymap.set({ "n", "x" }, "ga", function()
        require("opencode").prompt("@this")
      end, { desc = "Add to opencode" })
      vim.keymap.set({ "n", "t" }, "<C-t>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })
      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "opencode half page up" })
      vim.keymap.set("n", "<S-C-o>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "opencode half page down" })
      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above � otherwise consider "<leader>a".
      -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
      -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
      vim.keymap.set({ "n", "x" }, "<leader>aa", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask about this" })
      vim.keymap.set({ "n", "x" }, "<leader>as", function()
        require("opencode").select()
      end, { desc = "Select prompt" })
      vim.keymap.set({ "n", "x" }, "<leader>au", function()
        require("opencode").prompt("@this")
      end, { desc = "Add this" })
      vim.keymap.set("n", "<leader>at", function()
        require("opencode").toggle()
      end, { desc = "Toggle embedded" })
      vim.keymap.set("n", "<leader>ac", function()
        require("opencode").command()
      end, { desc = "Select command" })
      vim.keymap.set("n", "<leader>an", function()
        require("opencode").command("session_new")
      end, { desc = "New session" })
      vim.keymap.set("n", "<leader>ai", function()
        require("opencode").command("session_interrupt")
      end, { desc = "Interrupt session" })
      vim.keymap.set("n", "<leader>aA", function()
        require("opencode").command("agent_cycle")
      end, { desc = "Cycle selected agent" })
    end,
  },
}
