return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup {
        variant = 'moon',
        extend_background_behind_borders = true,

        styles = {
          transparency = false,
        },
      }
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
