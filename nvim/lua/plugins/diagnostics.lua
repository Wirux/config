return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local icons = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }

      -- 1. Configure vim.diagnostic.config via lspconfig opts (LazyVim standard)
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics or {}, {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.Error,
            [vim.diagnostic.severity.WARN] = icons.Warn,
            [vim.diagnostic.severity.HINT] = icons.Hint,
            [vim.diagnostic.severity.INFO] = icons.Info,
          },
        },
      })

      -- 2. Manually define signs (fallback for some plugins/versions)
      for name, icon in pairs(icons) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      return opts
    end,
  },
}
