--     _____             __  _ __
--    / ___/____ _____  / /_(_) /_____
--    \__ \/ __ `/ __ \/ __/ / __/ __ \   Santito
--   ___/ / /_/ / / / / /_/ / /_/ /_/ /   https://github.com/San-tito
--  /____/\__,_/_/ /_/\__/_/\__/\____/    https://gitlab.com/santito
--


--[[ 

./lua/santito/*.lua
  This is where configuration live.

--]]

-- Setup options.
-- See `./lua/santito/options.lua`
require "santito.options"

-- Setup Keymaps.
-- See `./lua/santito/keymaps.lua`
require "santito.keymaps"

-- Leader key -> " "
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font in the terminal
vim.g.have_nerd_font = true

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
    },
  },
})
