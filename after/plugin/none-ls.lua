local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          -- local function eslint_fix_and_format()
          --   local buf_modified = vim.api.nvim_buf_get_option(bufnr, "modified")
          --   if vim.fn.exists(":EslintFix") > 0 then
          --     vim.cmd("EslintFix")
          --   end
          --   -- Check if buffer was modified by the EslintFix or formatting, if so, save the changes.
          --   if buf_modified ~= vim.api.nvim_buf_get_option(bufnr, "modified") then
          --     vim.api.nvim_buf_call(bufnr, function()
          --       vim.cmd("silent write")
          --     end)
          --   end
          -- end
          -- vim.defer_fn(eslint_fix_and_format, 0)  -- Delay to ensure ESLintFix runs in async manner
        end,
      })
    end
    end,
}

null_ls.setup(opts)
