return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "echasnovski/mini.nvim",
    event = "User AstroFile",
    version = false,
    config = function() require("mini.align").setup() end,
  },
  {
    "NoahTheDuke/vim-just",
    ft = { "just" },
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      { "<leader>uo", "<cmd>PeekOpen<cr>", desc = "PeekOpen" },
    },
    cmd = {
      "PeekOpen",
      "PeekClose",
    },
  },
  {
    "marko-cerovac/material.nvim",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
