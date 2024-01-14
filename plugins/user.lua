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
    config =  function() require("mini.align").setup() end ,
  },
}
