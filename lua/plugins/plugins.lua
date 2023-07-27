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
    "rking/ag.vim"
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
  }
}
