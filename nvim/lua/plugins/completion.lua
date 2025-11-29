return {
  { "hrsh7th/nvim-cmp", enabled = false },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "fang2hou/blink-copilot",
        opts = {
          max_completions = 3,
          max_attempts = 4,
        },
      },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
