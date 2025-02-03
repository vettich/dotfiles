return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      -- LSP keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- rename by F2
      keys[#keys + 1] = {
        "<F2>",
        function()
          local inc_rename = require("inc_rename")
          ---@diagnostic disable-next-line: redundant-return-value
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename.nvim)",
        has = "rename",
      }
      keys[#keys + 1] = { "<F4>", vim.lsp.buf.code_action, desc = "Code action", has = "code_action" }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(name)
        return not vim.tbl_contains({ "goimports", "gofumpt" }, name)
      end, opts.ensure_installed)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports-reviser", "golines" },
      },
    },
  },
}
