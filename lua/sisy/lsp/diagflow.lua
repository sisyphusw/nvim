return {
  "dgagn/diagflow.nvim",
  event = "LspAttach", --This is what I use personnally and it works great
  keys = {
    { "<leader>lf", "<cmd>DiagflowToggle<cr>", mode = "n", desc = "Toggle diagflow" },
  },
  opts = {
    gap_size = 2,
    enale = true,
    padding_top = 4,
    scope = "line",
    toggle_event = { "InsertEnter", "InsertLeave" },
    --show_borders = true,
  },
}
