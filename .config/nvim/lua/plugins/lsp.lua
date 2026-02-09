return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("K", vim.lsp.buf.hover, "Hover")
        map("<space>cr", vim.lsp.buf.rename, "Rename")
        map("<space>ca", vim.lsp.buf.code_action, "Code Action")
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = {
      clangd = {},
      tinymist = {},
      ruby_lsp = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "rubocop",
    })

    require("mason-lspconfig").setup { ensure_installed = ensure_installed }

    for name, server in pairs(servers) do
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      vim.lsp.config(name, server)
      vim.lsp.enable(name)
    end
  end,
}
