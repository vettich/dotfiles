return {
  {
    "gitsigns.nvim",
    opts = {
      -- numhl = true,
      current_line_blame = false,
    },
  },
  {
    "tanvirtin/vgit.nvim",
    branch = "v1.0.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    -- Lazy loading on 'VimEnter' event is necessary.
    event = "VimEnter",
    config = function()
      require("vgit").setup()
    end,
  },
}
