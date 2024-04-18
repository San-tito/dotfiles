-- [[ Plugins ]]
return {
'tpope/vim-sleuth',
'navarasu/onedark.nvim',
{
    'folke/tokyonight.nvim',
    priority = 1000, 
    init = function()
      -- Load the colorscheme here.
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
