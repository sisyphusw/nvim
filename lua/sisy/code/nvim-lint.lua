return {
  "mfussenegger/nvim-lint",
  --event = { "BufReadPre", "BufNewFile" },
  ft = { "lua", "python" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = { "selene" },
      python = { "ruff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function() lint.try_lint() end,
    })

    vim.keymap.set("n", "<leader>cL", require("lint").try_lint, { desc = "Trigger linting" })
  end,
}
