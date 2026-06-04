return {
{
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
      -- or: "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
      {
        "<leader>e",
        function()
          require("oil").open()
        end,
        desc = "Open Oil",
      },
    },
    opts = {
      default_file_explorer = true,

      columns = {
        "icon",
      },

      view_options = {
        show_hidden = true,
      },

      keymaps = {
        ["q"] = "actions.close",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
        replace_netrw = false,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
