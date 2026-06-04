return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=/usr/bin/x86_64-w64-mingw32-*",
          },
        },
      },
    },
  },
}
