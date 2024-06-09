return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "ff",
      function() require("telescope.builtin").find_files() end,
      mode = "n",
      desc = "find files",
    },
    { "fg", mode = "n", "<cmd>Telescope live_grep<cr>", desc = "find string" },
    { "fb", mode = "n", "<cmd>Telescope buffers<cr>", desc = "find buffers" },
    { "fh", mode = "n", "<cmd>Telescope help_tags<cr>", desc = "find tags" },
  },
  opts = {
    defaults = {},
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
  --require("telescope").load_extension("noice")
}
