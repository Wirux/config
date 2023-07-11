-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- unmap("n", "<C-\\>")
map("n", "<C-\\>", "<cmd>vsplit<cr>", { desc = "vsplit" })
map("n", "<C-_>", "<cmd>split<cr>", { desc = "hsplit" })
map("n", "<C-w>", "<cmd>q<cr>", { desc = "q" })
map("n", "<C-}>", "<cmd>bprevious<cr>", { desc = "bprevious" })
map("n", "<C-]>", "<cmd>bnext<cr>", { desc = "bnext" })
map("n", "<C-w>", "<cmd>q<cr>", { desc = "q" })

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("x", "<leader>p", [["_dP]])
