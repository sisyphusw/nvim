return {
  "neovim/nvim-lspconfig",
  --event = { "BufReadPost", "BufNewFile" },
  lazy = false,
  --ft = { "lua" },
  depndencies = {
    --"williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    --"j-hui/fidget.nvim",
    --{ url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
    --{ url = "git@git.sr.ht:~whynothugo/lsp_lines.nvim" },
    --"folke/neodev.nvim",
    --"nvimdev/lspsaga.nvim",
  },
  opts = {},
  config = function()
    --require("neodev").setup({})
    --local capabilities = vim.lsp.protocol.make_client_capabilities()
    --capabilities.textDocument.diagnostic = false
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      -- disable lsp diagnostic in favor of linter
      -- https://github.com/neovim/neovim/issues/20745#issuecomment-1285183325
      --on_attach = function(client)
      --   --local client = vim.lsp.get_active_clients({ name = 'tsserver' })[1]
      --local ns = vim.lsp.diagnostic.get_namespace(client.id)
      -- vim.diagnostic.enable(false, { ns_id = ns, bufnr = nil })
      --end,
    })
    lspconfig.pyright.setup({})
  end,
}
