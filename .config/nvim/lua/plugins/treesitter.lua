return {
  "nvim-treesitter/nvim-treesitter",
  build=":TSUpdate",
  config = function()
  vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left togg  le<CR>', {})

  local config = require("nvim-treesitter.configs")
  config.setup({
    ensure_installed = {"lua","html","javascript","typescript","tsx"  },
    highlight = { enable = true },
    indent = { enable = true },
  })
  end
} 
