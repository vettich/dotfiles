return {
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    opts = {
      opts = {
        language = "Russian",
      },
      strategies = {
        chat = {
          adapter = "ollama2",
        },
        -- inline = {
        --   adapter = "codeium",
        -- },
      },
      adapters = {
        ollama2 = function()
          return require("codecompanion.adapters").extends("ollama", {
            name = "ollama2",
            env = {
              url = "http://dev-server:11434",
            },
            schema = {
              model = {
                default = "codestral:latest",
              },
            },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup()
      -- выключить для подсказок, т.к. для подсказок включен codeium
      vim.cmd("Copilot disable")
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "copilot",
      vendors = {
        local_ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://dev-server:11434/v1",
          -- model = "deepseek-coder-v2:16b",
          model = "dolphin3:8b",
        },
        openai_proxy = {
          __inherited_from = "openai",
          api_key_name = "OPENAI_PROXY_API_KEY",
          endpoint = "https://api.proxyapi.ru/openai/v1",
          model = "gpt-4o-mini",
          max_tokens = 2000,
        },
      },
      windows = {
        width = 50,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
