return {
  {
    "nvim-neotest/neotest",
    ft = { "jest", "rust", "python" },
    dependencies = {
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-jest",
          require "neotest-rust",
          require "neotest-python",
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      vim.api.nvim_set_keymap("n", "<leader>Zw", "<cmd>lua require('neotest').run.run({jestCommand='jest --watch '})<cr>", {})
      require("neotest").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    optional = true,
    --@type CatppuccinOptions
    opts = { integrations = { neotest = true } },
  },
}