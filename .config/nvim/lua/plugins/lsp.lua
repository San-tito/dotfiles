return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local servers = {
      clangd = {},
      dockerls = {},
      docker_compose_language_service = {},
      jsonls = {},
      marksman = {},
      tinymist = {},
      ruby_lsp = {},
      lua_ls = {},
      stylua = {},
    }

    require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers) }

    for name, server in pairs(servers) do
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end

    vim.diagnostic.config { virtual_text = true, virtual_lines = false }
  end,
}
