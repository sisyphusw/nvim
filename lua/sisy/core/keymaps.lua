local toggle_diag_virtual_text = function()
  local config = vim.diagnostic.config
  config({
    virtual_text = not config().virtual_text,
  })
end

local maps = {
  { "n", "U", "<c-r>", { desc = "Redo" } },
  { "n", "<leader>rc", ":source %<CR>", { desc = "Reload config" } },
  { "n", "<leader>lo", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open diag float windows" } },
  { "n", "<leader>lt", toggle_diag_virtual_text, { desc = "Toggle diag virual text" } },
}

for _, v in pairs(maps) do
  vim.keymap.set(unpack(v))
end
