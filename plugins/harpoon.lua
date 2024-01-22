local prefix = "<leader><leader>"
local leader = "<leader>"
local localLeader = "<localleader>"

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
      localLeader .. "q",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle quick menu",
    },
    {
      localLeader .. "a",
      function() require("harpoon"):list():select(1) end,
    },
    {
      localLeader .. "r",
      function() require("harpoon"):list():select(2) end,
    },
    {
      localLeader .. "s",
      function() require("harpoon"):list():select(3) end,
    },
    {
      localLeader .. "t",
      function() require("harpoon"):list():select(4) end,
    },
  },
}
