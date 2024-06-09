return {
  "ckolkey/ts-node-action",
  dependencies = { "nvim-treesitter" },
  opts = {},
  keys = {},
  config = function()
    --local increase_number = require("sisy.plugins.code.ts-node-action.actions.increase_number")
    --require("ts-node-action").setup({
    -- ["*"] = {
    --  ["number"] = increase_number(),
    --{{actions.increase_number, name = "Increase number"}}
    --},
    --lua = {
    --["number"] = increase_number(),
    --},
    --})
  end,
}
