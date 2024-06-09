local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local M = {}

local vi_mode = {
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function() vim.cmd("redrawstatus") end),
  },
  init = function(self) self.mode = vim.fn.mode(1) end,
  hl = function(self) return { fg = self.mode_colors[self.mode:sub(1, 1)], bold = true } end,
  provider = function(self) return " %-3(" .. self.mode_names[self.mode] .. "%)" end,
  static = {
    mode_names = {
      ["n"] = "N", --"NORMAL",
      ["no"] = "NO", --"O-PENDING",
      ["nov"] = "NOV", --"O-PENDING",
      ["noV"] = "NOVl", --"O-PENDING",
      ["no\22"] = "NOVb", --"O-PENDING",
      ["niI"] = "NII", -- "NORMAL",
      ["niR"] = "NIR", --"NORMAL",
      ["niV"] = "NIV", --"NORMAL",
      ["nt"] = "NT", --"NORMAL",

      ["v"] = "V", --"VISUAL",
      ["vs"] = "VS", --"VISUAL",
      ["V"] = "Vl", --"V-LINE",
      ["Vs"] = "VS", --"V-LINE",
      ["\22"] = "Vb", --"V-BLOCK",
      ["\22s"] = "VbS", --"V-BLOCK",
      ["s"] = "S", --"SELECT",
      ["S"] = "Sl", --"S-LINE",
      ["\19"] = "Sb", --"S-BLOCK",
      ["i"] = "I", --"INSERT",
      ["ic"] = "IC", --"INSERT",
      ["ix"] = "IX", --"INSERT",
      ["R"] = "R", --"REPLACE",
      ["Rc"] = "RC", --"REPLACE",
      ["Rx"] = "RX", --"REPLACE",
      ["Rv"] = "RV", --"V-REPLACE",
      ["Rvc"] = "RVC", --"V-REPLACE",
      ["Rvx"] = "RVX", --"V-REPLACE",
      ["c"] = "C", --"COMMAND",
      ["cv"] = "CV", --"EX",
      ["ce"] = "CE", --"EX",
      ["r"] = "R", --"REPLACE",
      ["rm"] = "RM", --"MORE",
      ["r?"] = "R?", --"CONFIRM",
      ["!"] = "!", --"SHELL",
      ["t"] = "T", --"TERMINAL",
    },
    mode_colors = {
      n = "#5e81ac",
      i = "#a3be8c",
      v = "#8fbcbb",
      V = "#8fbcbb",
      ["\22"] = "#8fbcbb",
      c = "#b48ead",
      s = "#ebcb8b",
      S = "#ebcb8b",
      ["\19"] = "#ebcb8b",
      R = "#d08770",
      r = "#d08770",
      ["!"] = "#bf616a",
      t = "#bf616a",

      -- catppuccin

      -- normal
      -- n = C.blue,
      -- -- insert
      -- i = C.green,
      -- -- visual
      -- v = C.pink,
      -- V = C.pink,
      -- ["\22"] = C.pink,
      -- -- select
      -- s = C.sky,
      -- S = C.sky,
      -- ["\19"] = C.sky,
      -- -- repalce
      -- R = C.yellow,
      -- r = C.yellow,
      -- -- command
      -- c = C.red,
      -- -- shell
      -- ["!"] = C.mauve,
      -- -- terminal
      -- t = C.mauve,
    },
  },
}

local ruler = {
  provider = "%3l:%-2c", --%3p%% ",
}

local lsp_name = {
  condition = function() return next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil end,
  update = { "LspAttach", "LspDetach" },
  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
    end
    local result
    if names then
      result = table.concat(names, " ")
    else
      result = "[None]"
    end
    return result .. " "
  end,
}

local linter_name = {
  condition = function()
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.spec.plugins["nvim-lint"] ~= nil and package.loaded["lint"]
  end,
  update = { "BufEnter" },
  provider = function()
    local names = require("lint")._resolve_linter_by_ft(vim.bo.filetype)
    local result
    if names then
      result = table.concat(names, " ")
    else
      result = "[None]"
    end
    return result .. " "
  end,
}

local formatter_name = {
  condition = function()
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.spec.plugins["conform.nvim"] ~= nil and package.loaded["conform"]
  end,
  update = { "BufEnter" },
  provider = function()
    local names = {}
    for _, format in pairs(require("conform").list_formatters()) do
      table.insert(names, format.name)
    end
    local result
    if names then
      result = table.concat(names, " ")
    else
      result = "[None]"
    end
    return result .. " "
  end,
}

local git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    --self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    --hl = { bold = true },--"󰊢
    provider = function(self) return " " .. self.status_dict.head .. " " end,
  },
}

local cwd = {
  hl = utils.get_highlight("Directory"),
  provider = function()
    local path = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") --:~
    return path
  end,
}

M = {
  hl = { bg = "none", force = true },
  vi_mode,
  ruler,
  {
    provider = "%=",
  },
  lsp_name,
  linter_name,
  formatter_name,
  git,
  cwd,
}

return M
