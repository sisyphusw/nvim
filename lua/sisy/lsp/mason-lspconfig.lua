return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    -- It's important that you set up the plugins in the following order:
    -- https://github.com/williamboman/mason-lspconfig.nvim#setup
    require("mason-lspconfig").setup({
      ensure_installed = {
        --"lua_ls",
        --"nil_ls",
        --"pyright",
      },
    })
  end,
}
