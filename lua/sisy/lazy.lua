local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

  require("lazy").setup({
  -- stylua: ignore start
  spec = {
    { import = "sisy.editor.oil" },             -- file explorer
    { import = "sisy.editor.undotree" },             -- file explorer

    --{ import = "sisy.ui.nord" },                -- color scheme
    --{ import = "sisy.ui.catppuccin" },                -- color scheme
    { import = "sisy.ui.gruvbox" },                -- color scheme
    { import = "sisy.ui.statuscol" },                -- color scheme
    { import = "sisy.ui.heirline" },                -- color scheme

    { import = "sisy.lsp.mason" },              -- mason
    { import = "sisy.lsp.mason-lspconfig" },    -- briage between manson and lspconfig
    { import = "sisy.lsp.nvim-lspconfig" },     -- lspconfig
    { import = "sisy.lsp.fidget" },             -- lsp progress notification
    { import = "sisy.lsp.lsp_lines" },             -- diagnostic ui in arrow virtual line
    { import = "sisy.lsp.diagflow" },             -- diagnostic ui in top-right
    --{ import = "sisy.lsp.neodev" },             -- neovim dev setup

    { import = "sisy.treesitter.nvim-treesitter" }, -- treesitter
    { import = "sisy.treesitter.nvim-treesitter-context" }, -- treesitter context
    {import= "sisy.treesitter.rainbow-delimiters"},     -- rainbow parentheses

    { import = "sisy.code.nvim-lint" },         -- linter
    { import = "sisy.code.conform" },           -- formatter
    { import = "sisy.code.indent-blankline" },  -- indent guide

    { import = "sisy.git.gitsigns" },  -- indent guide

    { import = "sisy.search.telescope" },       -- fuzzy finder

    --{ import = "sisy.code.ts.nvim-treesitter" },    -- indent guide
    --{ import = "sisy.code.ts.nvim-treesitter-context" },    -- indent guide
    --{ import = "sisy.code.ts-node-action" },    -- indent guide

    --{ import = "sisy.plugins.editor.flash" },    -- indent guide
    --{ import = "sisy.plugins.editor.nvim-surround" },          -- surround
    --{ import = "sisy.plugins.editor.telescope" },              -- fuzzy finder
    --{ import = "sisy.plugins.ui.heirline" },            -- improve default ui
    --{ import = "sisy.plugins.ui.dressing" },            -- improve default ui
    --{ import = "sisy.ui.heirline" },            -- improve default ui
    --{ import = "sisy.ui.lualine.setup" },            -- improve default ui
    --{ import = "sisy.ui.dropbar" },            -- disable to prefer nvim-treesitter-context
    --{ import = "sisy.plugins.helper.which-key" },              -- keymap prompt

  -- stylua: ignore start
  },
  defaults = {
    lazy = true,
    version = false, -- always use the latest git commit
  },
  git = {
    timeout = 300,
    url_format = "git@github.com:%s.git", -- ssh
  }, --
  --install = { colorscheme = { "nord" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
