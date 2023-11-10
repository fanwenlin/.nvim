return {
  {
    "autozimu/LanguageClient-neovim",
  },
  {
    "ray-x/go.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").gopls.setup({
        settings = {},
      })
    end,
  },
  {
    "rking/ag.vim",
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")
      lsp.set_preferences({ set_lsp_keymaps = false })

      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-o>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      -- disable completion with tab, this collides with Tabnine
      cmp_mappings["<Tab>"] = nil
      cmp_mappings["<S-Tab>"] = nil

      lsp.setup_nvim_cmp({ mapping = cmp_mappings })

      lsp.setup()

      vim.diagnostic.config({ virtual_text = true })
    end,
  },
}
