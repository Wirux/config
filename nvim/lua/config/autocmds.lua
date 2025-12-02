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
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "snacks_dashboard",
--   callback = function(event)
--     vim.schedule(function()
--       vim.keymap.set("n", "s", "<nop>", { buffer = event.buf, silent = true })
--       vim.keymap.set("n", "S", "<nop>", { buffer = event.buf, silent = true })
--     end)
--   end,
-- })
