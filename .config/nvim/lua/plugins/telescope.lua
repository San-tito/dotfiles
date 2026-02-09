return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    require("telescope").setup {
      extensions = {
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
    }
    pcall(require("telescope").load_extension, "ui-select")
  end,
}
