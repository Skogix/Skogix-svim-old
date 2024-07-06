return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
    },
    -- cmd = 'Neotree',
    -- keys = {
    --   { '<leader>t', ':ToggleTerm direction=float<CR>', { desc = 'ToggleTerm' } },
    -- },
  },
  {
    'ryanmsnyder/toggleterm-manager.nvim',
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
    },
    config = true,
  },
}
