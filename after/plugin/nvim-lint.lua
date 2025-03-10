-- local lint = require("lint")
--
-- lint.linters_by_ft = {
--   javascript = { "eslint_d" },
--   typescript = { "eslint_d" },
--   javascriptreact = { "eslint_d" },
--   typescriptreact = { "eslint_d" },
--   svelte = { "eslint_d" },
--   python = { "pylint" },
-- }
--
-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
--   group = lint_augroup,
--   callback = function()
--     lint.try_lint()
--   end,
-- })
-- -- lint.setup({
-- --
-- --   on_attach = function(client, bufnr)
-- --     print("on_attach lint")
-- --   end,
-- -- })
--
-- --   vim.api.nvim_create_autocmd("BufWritePre", {
-- --     group = augroup,
-- --     buffer = bufnr,
-- --     callback = function()
-- --       local function eslint_fix_and_format()
-- --         local buf_modified = vim.api.nvim_buf_get_option(bufnr, "modified")
-- --         if vim.fn.exists(":EslintFix") > 0 then
-- --           vim.cmd("EslintFix")
-- --         end
-- --         -- Check if buffer was modified by the EslintFix or formatting, if so, save the changes.
-- --         if buf_modified ~= vim.api.nvim_buf_get_option(bufnr, "modified") then
-- --           vim.api.nvim_buf_call(bufnr, function()
-- --             vim.cmd("silent write")
-- --           end)
-- --         end
-- --       end
-- --       vim.defer_fn(eslint_fix_and_format, 0)  -- Delay to ensure ESLintFix runs in async manner
-- --     end,
-- --   })
-- -- end
--
-- vim.keymap.set("n", "<leader>l", function()
--   lint.try_lint()
-- end, { desc = "Trigger linting for current file" })
