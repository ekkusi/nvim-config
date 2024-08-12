-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
require("nvim-treesitter.configs").setup({
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "lua",
    "python",
    "rust",
    "tsx",
    "javascript",
    "typescript",
    "vimdoc",
    "vim",
    "bash",
    "graphql",
    "prisma",
    "dockerfile",
    "css",
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing
  ignore_install = {},
  -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
  modules = {},
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-Space>",
      node_incremental = "<C-Space>",
      scope_incremental = "<C-s>",
      node_decremental = "<M-Space>",
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        -- works for javascript/typescript files (custom capture I created in after/queries/ecma/textobjects.scm)
        -- ['a:'] = { query = '@property.outer', desc = 'Select outer part of an object property' },
        -- ['i:'] = { query = '@property.inner', desc = 'Select inner part of an object property' },
        -- ['l:'] = { query = '@property.lhs', desc = 'Select left part of an object property' },
        -- ['r:'] = { query = '@property.rhs', desc = 'Select right part of an object property' },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
        ["<leader>n:"] = "@property.outer", -- swap object property with next
        ["<leader>nm"] = "@function.outer", -- swap function with next
      },
      swap_previous = {
        ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
        ["<leader>p:"] = "@property.outer", -- swap object property with prev
        ["<leader>pm"] = "@function.outer", -- swap function with previous
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["mf"] = { query = "@call.outer", desc = "Next function call start" },
        ["mm"] = { query = "@function.outer", desc = "Next method/function def start" },
        ["mc"] = { query = "@class.outer", desc = "Next class start" },
        ["mi"] = { query = "@conditional.outer", desc = "Next conditional start" },
        ["ml"] = { query = "@loop.outer", desc = "Next loop start" },

        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        -- ['ms'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
        -- ['mz'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
      },
      goto_next_end = {
        ["mF"] = { query = "@call.outer", desc = "Next function call end" },
        ["mM"] = { query = "@function.outer", desc = "Next method/function def end" },
        ["mC"] = { query = "@class.outer", desc = "Next class end" },
        ["mI"] = { query = "@conditional.outer", desc = "Next conditional end" },
        ["mL"] = { query = "@loop.outer", desc = "Next loop end" },
      },
      goto_previous_start = {
        ["Mf"] = { query = "@call.outer", desc = "Prev function call start" },
        ["Mm"] = { query = "@function.outer", desc = "Prev method/function def start" },
        ["Mc"] = { query = "@class.outer", desc = "Prev class start" },
        ["Mi"] = { query = "@conditional.outer", desc = "Prev conditional start" },
        ["Ml"] = { query = "@loop.outer", desc = "Prev loop start" },
      },
      goto_previous_end = {
        ["MF"] = { query = "@call.outer", desc = "Prev function call end" },
        ["MM"] = { query = "@function.outer", desc = "Prev method/function def end" },
        ["MC"] = { query = "@class.outer", desc = "Prev class end" },
        ["MI"] = { query = "@conditional.outer", desc = "Prev conditional end" },
        ["ML"] = { query = "@loop.outer", desc = "Prev loop end" },
      },
    },
  },
})

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)