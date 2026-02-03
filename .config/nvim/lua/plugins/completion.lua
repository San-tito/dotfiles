return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require "cmp"
    local defaults = require "cmp.config.default"()
    return {
      completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<tab>"] = cmp.mapping(
          cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
          { "i", "c" }
        ),
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      },
      experimental = {
        ghost_text = true and {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
}
