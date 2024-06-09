-- https://neovim.io/doc/user/options.html#'statusline'

local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local M = {}

local ruler = {
  provider = "%2l:%-2c%3p%% ",
}

local git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    --self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  {
    condition = function(self) return self.status_dict.added end,
    hl = utils.get_highlight("GitSignsAdd"),
    provider = function(self)
      local count = self.status_dict.added or 0
      return "+" .. count
    end,
  },
  {
    condition = function(self) return self.status_dict.changed end,
    hl = utils.get_highlight("GitSignsChange"),
    provider = function(self)
      local count = self.status_dict.changed or 0
      return "~" .. count
    end,
  },
  {
    condition = function(self) return self.status_dict.removed end,
    hl = utils.get_highlight("GitSignsDelete"),
    provider = function(self)
      local count = self.status_dict.removed or 0
      return "-" .. count .. " "
    end,
  },
  {
    condition = function(self) return self.status_dict.removed == nil end,
    hl = { fg = "#d08770" },
    provider = "? ",
  },
}
local file_name = {
  --hl = utils.get_highlight("Directory"),
  hl = { fg = "#4c566a" },
  provider = function(self)
    --https://neovim.io/doc/user/cmdline.html#filename-modifiers
    --if string.sub(filename,1,3) == "oil"
    local filename = vim.fn.fnamemodify(self.filename, ":t")
    if filename == "" then return "[No Name]" end
    return filename
  end,
  --hl = { fg = utils.get_highlight("Directory").fg },
}

local file_type = {
  provider = function() return vim.bo.filetype .. " " end,
}

local file_encoding = {
  provider = function() return vim.bo.fileencoding .. " " end,
}

local file_format = {
  provider = function() return vim.bo.fileformat .. " " end,
}

local modified = {
  condition = function() return vim.bo.modified end,
  provider = "%m ",
}

M = {
  init = function(self) self.filename = vim.api.nvim_buf_get_name(0) end,
  { provider = "%=" },
  modified,
  --ruler,
  git,
  --file_type,
  --file_encoding,
  --file_format,
  file_name,
}

return M
