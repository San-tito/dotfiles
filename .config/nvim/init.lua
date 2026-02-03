vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<Left>", ':echom "Use h to move!!"<CR>')
vim.keymap.set("n", "<Right>", ':echom "Use l to move!!"<CR>')
vim.keymap.set("n", "<Up>", ':echom "Use k to move!!"<CR>')
vim.keymap.set("n", "<Down>", ':echom "Use j to move!!"<CR>')
vim.keymap.set("i", "<Left>", '<C-o>:echom "Use h to move!!"<CR>')
vim.keymap.set("i", "<Right>", '<C-o>:echom "Use l to move!!"<CR>')
vim.keymap.set("i", "<Up>", '<C-o>:echom "Use k to move!!"<CR>')
vim.keymap.set("i", "<Down>", '<C-o>:echom "Use j to move!!"<CR>')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

vim.opt.runtimepath:prepend(lazypath)
require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
}
