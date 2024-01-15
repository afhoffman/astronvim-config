return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.sonokai" },

  { import = "astrocommunity.pack.rust" },

  { import = "astrocommunity.pack.cpp" },
  -- Add some configuration when cmake-tools is active.
  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<leader>mg", "<cmd>CMakeGenerate<cr>", desc = "Generate" },
      { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "Build" },
      { "<leader>mc", "<cmd>CMakeClean<cr>", desc = "Clean" },
      { "<leader>mp", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "Select configure preset" },
      { "<leader>mP", "<cmd>CMakeSelectBuildPreset<cr>", desc = "Select build preset" },
      { "<leader>mt", "<cmd>CMakeShowTargetFiles<cr>", desc = "Show target files" },
    },
    config = function()
      local prefix = "<leader>m"
      local maps = { n = {}, x = {} }

      local icon = vim.g.icons_enabled and "󰛔 " or ""
      maps.n[prefix] = { desc = icon .. "CMake" }
      maps.x[prefix] = { desc = icon .. "CMake" }

      require("astronvim.utils").set_mappings(maps)
    end,
  },

  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.go" },

  { import = "astrocommunity.motion.hop-nvim" },
}
