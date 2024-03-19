local ls = require("luasnip")

require("luasnip/loaders/from_vscode").load()

-- For some reason this doesn't work, the snippets dont get loaded. To be investigated
-- require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } })
require("luasnip").config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    return ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    return ls.jump(-1)
  end
end, { silent = true })

-- Configure SourceSnippets command to resource this file
vim.cmd("command! SourceSnippets luafile " .. vim.fn.expand("%"))
