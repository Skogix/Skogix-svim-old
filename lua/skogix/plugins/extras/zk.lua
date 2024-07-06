-- https://github.com/zk-org/zk-nvim
-- https://github.com/zk-org/zk

local zk = require 'zk'
local commands = require 'zk.commands'

commands.add('ZkOrphans', function(options)
  options = vim.tbl_extend('force', { orphan = true }, options or {})
  zk.edit(options, { title = 'Zk Orphans' })
end)

local function make_edit_fn(defaults, picker_options)
  return function(options)
    options = vim.tbl_extend('force', defaults, options or {})
    zk.edit(options, picker_options)
  end
end

commands.add('ZkOrphans', make_edit_fn({ orphan = true }, { title = 'Zk Orphans' }))
commands.add('ZkRecents', make_edit_fn({ createdAfter = '2 weeks ago' }, { title = 'Zk Recents' }))

local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap('n', '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap('n', '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap('n', '<leader>zt', '<Cmd>ZkTags<CR>', opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap('n', '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap('v', '<leader>zf', ":'<,'>ZkMatch<CR>", opts)

return {
  'zk-org/zk-nvim',
  config = function()
    require('zk').setup {
      -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
      picker = 'select',

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { 'zk', 'lsp' },
          name = 'zk',
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { 'markdown', 'md' },
        },
      },
    }
  end,
}
