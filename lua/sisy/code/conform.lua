return {
  "stevearc/conform.nvim",
  ft = { "lua", "python" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      --python = { "ruff_format" },
      python = { "ruff_fix" },
      -- Conform will run multiple formatters sequentially
      --python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      --javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
