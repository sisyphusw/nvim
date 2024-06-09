return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      integrations = {
        treesitter_context = false,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
