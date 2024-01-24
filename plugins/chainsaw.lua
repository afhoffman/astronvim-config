local localleader = "<localleader>"

return {
  "chrisgrieser/nvim-chainsaw",
  keys = {
    { localleader .. "l", function() require("chainsaw").variableLog() end, desc = "Variable log" },
    { localleader .. "r", function() require("chainsaw").removeLogs() end, desc = "Remove log" },
    { localleader .. "b", function() require("chainsaw").beepLog() end, desc = "Beep log" },
  }
}
