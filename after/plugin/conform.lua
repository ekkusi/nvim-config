local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({
  --       group = augroup,
  --       buffer = bufnr,
  --     })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --         -- local function eslint_fix_and_format()
  --         --   local buf_modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  --         --   if vim.fn.exists(":EslintFix") > 0 then
  --         --     vim.cmd("EslintFix")
  --         --   end
  --         --   -- Check if buffer was modified by the EslintFix or formatting, if so, save the changes.
  --         --   if buf_modified ~= vim.api.nvim_buf_get_option(bufnr, "modified") then
  --         --     vim.api.nvim_buf_call(bufnr, function()
  --         --       vim.cmd("silent write")
  --         --     end)
  --         --   end
  --         -- end
  --         -- vim.defer_fn(eslint_fix_and_format, 0)  -- Delay to ensure ESLintFix runs in async manner
  --       end,
  --     })
  --   end
  -- end,
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
