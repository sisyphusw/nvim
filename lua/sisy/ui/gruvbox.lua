return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("gruvbox").setup()
    vim.cmd.colorscheme("gruvbox")
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "None" })
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "GruvBoxRed" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "GruvBoxYellow" })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "GruvBoxBule" })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "GruvBoxAqua" })
  end,
}
