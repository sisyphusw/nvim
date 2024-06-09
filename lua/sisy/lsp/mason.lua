return {
  "williamboman/mason.nvim",
  --lazy = false,
  cmd = "Mason",
  --keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      --"stylua",
      --"shfmt",
      -- "flake8",
    },
  },
  -- setup in mason-lspconfig
  --config = function() require("mason").setup() end,
}
