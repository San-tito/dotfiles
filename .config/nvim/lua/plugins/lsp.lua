return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = {
      clangd = {},
      dockerls = {},
      docker_compose_language_service = {},
      jsonls = {},
      marksman = {},
      tinymist = {},
      ruby_lsp = {},
      rubocop = {},
      lua_ls = {},
      stylua = {},
    }

    require("mason-lspconfig").setup { ensure_installed = vim.tbl_keys(servers) }

    for name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end
  end,
}
