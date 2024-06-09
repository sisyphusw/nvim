return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "-", mode = "n", "<CMD>Oil<CR>", desc = "oil - open parent directory" },
  },
  opts = {
    columns = {
      --"type",
      "icon",
      "permissions",
      "size",
      -- "mtime",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr) return (name == "..") end,
    },
  },
}
