return {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
    {
      "<leader>t",
      function()
        vim.fn.jobstart({ "tmux", "send-keys", "C-b" })
      end,
      desc = "Send Tmux Leader (C-Space)",
    },
  },
}
