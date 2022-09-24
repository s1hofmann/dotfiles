-- Treesitter
-- Parsers must be installed manually via :TSInstall.
require('nvim-treesitter.configs').setup {
  highlight = {
      enable = true -- false will disable the whole extension.
  },
  indent = {
      enable = true
  },
  incremental_selection = {
      enable = true,
      keymaps = {
          node_incremental = 'sin',
          node_decremental = 'sdn',
          scope_incremental = 'sib'
      }
  },
  ensure_installed = {"cpp", "tsx", "toml", "json", "yaml", "swift", "css", "html", "lua"},
  textobjects = {
      select = {
          lookahead = false, -- Automatically jump forward to textobj, similar to targets.vim.
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>' -- blockwise
          }
      },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer'
        },
        goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer'
        },
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer'
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer'
        }
    },
    lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer"
        }
    }
  },
}

