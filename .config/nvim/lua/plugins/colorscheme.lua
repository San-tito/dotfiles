return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup {
      style = "storm",
      transparent = true,
    }
    vim.cmd.colorscheme "tokyonight"
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  end,
}
