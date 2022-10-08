-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    c = {
      require("formatter.filetypes.c").clangformat
    },
    cmake = {
      require("formatter.filetypes.cmake").cmakeformat
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat
    },
    css = {
      require("formatter.filetypes.css").prettier
    },
    html = {
      require("formatter.filetypes.html").prettier
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier
    },
    json = {
      require("formatter.filetypes.json").prettier
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier
    },
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      -- require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
