vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- stylua: ignore start
local options = {
  -- ui
  number = true,                  -- Show line number
  relativenumber = true,          -- Show Relative number
  colorcolumn = "80",             -- Show color column in 80
  signcolumn = "yes",             -- Fix signcolumn otherwise it will shift
  guicursor = "",                 -- Don't change insert mode cursor style
  cursorline = true,              -- Highlight the current line
  termguicolors = true,           -- True color support
  background = "dark",            -- Dark mode
  laststatus = 3,                 -- global statusline
  pumblend = 10,                  -- Popup blend
  pumheight = 10,                 -- Maximum number of entries in a popup
  winminwidth = 5,                -- Minimum window width
  showmode = false,               -- Dont show mode since we have a statusline

  list = true,                    -- Show some invisible characters (tabs...
  -- eol:↵
  listchars ="tab:━⇥ ,trail:·,extends:…,precedes:^,nbsp:␣",

  -- search
  smartcase = true,               -- Don't ignore case with capitals
  ignorecase = true,              -- Ignore case
  hlsearch = false,               -- Disable always hightlight, last serach matches

  -- tabs && indent
  expandtab = true,               -- Convert Tab to spaces
  tabstop = 2,                    -- Number of spaces tabs count for
  softtabstop = 2,                -- Same above
  shiftwidth = 2,                 -- Size of an indent
  shiftround = true,              -- Round indent Applies to > and <
  autoindent = true,              -- start new line with same indent level of current line
  smartindent = true,             -- Insert indents automatically

  -- split windows
  splitbelow = true,              -- Put new windows below current
  splitkeep = "screen",           -- Keep the text on the same screen line.
  splitright = true,              -- Put new windows right of current

  undofile = true,                -- Eneble undofile
  undolevels = 10000,
  confirm = true,                 -- Confirm to save changes before exiting modified buffer
  swapfile = false,               -- Disable swapfile
  backup = false,                 -- Disable backup
  --autowrite = true,               -- Enable auto write
  --updatetime = 200,               -- Save swap file and trigger CursorHold

  scrolloff = 4,                  -- Number of lines to keep above and below the cursor
  sidescrolloff = 4,              -- Number of lines to keep right side of the cursor

  jumpoptions = "stack",

  --clipboard = "unnamedplus",  -- Sync with system clipboard
  wrap = false,                   -- Disable line wrap
  mouse = "a",                    -- Enable mouse mode
  wildmode = "longest:full,full", -- Command-line completion mode
  foldlevel = 99,
  --virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
  --conceallevel = 2 ,-- Hide * markup for bold and italic, but not markers with substitutions
  --completeopt = "menu,menuone,noselect" -- Better complete opt
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Disable automatically insert current comment when hit i o
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- stylua: ignore end
