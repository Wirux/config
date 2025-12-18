return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "markdown",
          "markdown_inline",
          "yaml",
        })
      end
      -- We ignore 'bash' to prevent crashes caused by injections in YAML/Markdown files
      opts.ignore_install = { "bash" }
    end,
  },
}
