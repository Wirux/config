-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undodir = true
--
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.mousescroll = "ver:1,hor:1"
-- vim.opt.scrolloff = 10
-- custom config
vim.api.nvim_exec("language en_US", true)
vim.cmd.colorscheme("catppuccin-mocha")
