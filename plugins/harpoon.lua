local prefix = "<leader><leader>"
local leader = "<leader>"

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup {}
  end,
  keys = {
    { prefix .. "a", function() require("harpoon"):list():append() end, desc = "Add file" },
    {
      prefix .. "e",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle quick menu",
    },
    {
      leader .. "1",
      function() require("harpoon"):list():select(1) end,
    },
    {
      leader .. "2",
      function() require("harpoon"):list():select(2) end,
    },
    {
      leader .. "3",
      function() require("harpoon"):list():select(3) end,
    },
    {
      leader .. "4",
      function() require("harpoon"):list():select(4) end,
    },
  },
}
