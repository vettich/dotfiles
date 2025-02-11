return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), reveal = true })
        end,
        desc = "Explorer NeoTree (root dir on opened file)",
      },
    },
    opts = {
      window = {
        position = "float",
        mappings = {
          ["z"] = "noop",
        },
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            -- set relative line numbers in file explorer
            vim.cmd([[
              setlocal relativenumber
            ]])
          end,
        },
      },
    },
  },
}
