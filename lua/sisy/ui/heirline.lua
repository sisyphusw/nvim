return {
  "rebelot/heirline.nvim",
  event = "BufEnter",
  dependencies = {
    --"zeioth/heirline-components.nvim"
  },
  opts = function()
    --local utils = require("heirline.utils")
    local conditions = require("heirline.conditions")
    --local components = require("sisy.ui.components")
    --local component = require("heirline-components.all").component
    return {
      statusline = require("sisy.ui.components.statusline"),
      winbar = require("sisy.ui.components.winbar"),
      opts = {
        disable_winbar_cb = function(args)
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "oil" },
          }, args.buf)
        end,
      },
    }
  end,
  config = function(_, opts)
    local heirline = require("heirline")
    --local heirline_components = require("heirline-components.all")

    -- Setup
    --heirline_components.init.subscribe_to_events()
    --heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "None" })
  end,
}
