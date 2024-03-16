

vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end, { desc = "Toggle Spectre" })
vim.keymap.set("n", "<leader>Sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Spectre visual mode" })
vim.keymap.set("v", "<leader>Sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Spectre visual mode" })
