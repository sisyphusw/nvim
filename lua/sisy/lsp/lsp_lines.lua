return {
  --"~whynothugo/lsp_lines.nvim",
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  --url = "git@git.sr.ht:~whynothugo/lsp_lines.nvim",
  --lazy = true,
  event = "LspAttach",
  keys = {
    {
      "<leader>ll",
      function()
        local config = vim.diagnostic.config
        config({
          virtual_lines = not config().virtual_lines,
        })
      end,
      desc = "Toggle lsp_lines",
    },
  },
  config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
    })
  end,
}
