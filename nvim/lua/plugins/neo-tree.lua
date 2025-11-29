return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
      use_libuv_file_watcher = true,
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    local function refresh_neotree()
      require("neo-tree.sources.manager").refresh("filesystem")
      -- Refresh git_status source as well if it's being used
      if package.loaded["neo-tree.sources.git_status"] then
        require("neo-tree.sources.git_status").refresh()
      end
    end

    -- Refresh on FocusGained (when returning to Neovim from external terminal)
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = refresh_neotree,
    })

    -- Refresh on TermClose (when closing a terminal buffer, e.g., lazygit)
    vim.api.nvim_create_autocmd("TermClose", {
      callback = refresh_neotree,
    })
  end,
}
