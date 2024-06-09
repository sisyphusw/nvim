return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    --enable = true,
    indent = {
      --▏│┋┊┆┊║𝄄
      char = { "▏" },
      --tab_char = { "-", "a" },
      highlight = { "SpecialKey" },
    },
    whitespace = {
      highlight = { "Whitespace", "NonText" },
    },
    scope = {
      --enable = true,
      show_start = false,
      show_end = false,
      --┇║┆ ┇┊┇▌▋▊▉█
      char = { "▍" },
      highlight = { "SpecialKey" },
    },
  },
  --config = function() require("ibl").setup({}) end,
}
