return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        {
          sign = { namespace = { "diagnostic" }, maxwidth = 1, colwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        {
          sign = { namespace = { "gitsign" }, maxwidth = 1, colwidth = 1, auto = false },
          click = "v:lua.ScSa",
        },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        --{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      },
    })
  end,
}
