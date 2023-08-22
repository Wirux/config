-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds hereby
-- map("n", "<leader>ti", ":!terraform init<CR>", opts)
-- map("n", "<leader>tv", ":!terraform validate<CR>", opts)
-- map("n", "<leader>tp", ":!terraform plan<CR>", opts)
-- map("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)

-- Set commentstring for C++ files
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})
