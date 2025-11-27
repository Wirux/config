return {
  -- Enable blink.cmp (LazyVim default) and configure "super-tab" behavior
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        -- explicit mappings if you want to customize further,
        -- but 'super-tab' preset usually handles <Tab> and <S-Tab>
      },
    },
  },

  -- Ensure nvim-cmp is disabled since we are using blink
  { "hrsh7th/nvim-cmp", enabled = false },
}
