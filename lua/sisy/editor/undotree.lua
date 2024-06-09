return {
  "mbbill/undotree",
  --lazy = false,
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", mode = "n", { desc = "Toggle undotree" } },
  },
  --config = function() vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" }) end,
}
