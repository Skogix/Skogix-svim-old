--
-- vim.cmd 'autocmd FileType norg WhichKeyNorg()'
-- function WhichKeyNorg()
--   wkl.register({
--     ['w'] = { ':w<CR>', 'write' },
--     ['q'] = { ':q<CR>', 'quit' },
--   }, { prefix = '<localleader>' })
-- end

-- -- The same using nvim-mapper
-- Mapper = require 'nvim-mapper'
--
-- -- For Neovim < v0.7.0
-- Mapper.map('n', '<leader>P', ':MarkdownPreview<CR>', { silent = true, noremap = true }, 'Markdown', 'md_preview', 'Display Markdown preview in Qutebrowser')
--
-- -- For Neovim >= 0.7.0
-- Mapper.map({ 'i', 's' }, '<c-k>', function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump(1)
--   end
-- end, { silent = true }, 'Snippets', 'snippet_jump_or_expand', 'Expand or jump to next snippet placeholder')
-- return {}

local harpoon = require 'harpoon'
local telescope = require 'telescope.builtin'

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
  telescope.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'search in open files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
  telescope.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'search neovim config' })
local wk = require 'which-key'
local binds = {
  ['<leader>'] = { telescope.git_files, 'search git files' },
  ['1'] = {
    function()
      harpoon:list():select(1)
    end,
    'which_key_ignore',
  },
  ['2'] = {
    function()
      harpoon:list():select(2)
    end,
    'which_key_ignore',
  },
  ['3'] = {
    function()
      harpoon:list():select(3)
    end,
    'which_key_ignore',
  },
  ['4'] = {
    function()
      harpoon:list():select(4)
    end,
    'which_key_ignore',
  },
  b = { name = 'buffer' },
  c = { name = 'code' },
  -- e = { '<cmd>Neotree toggle<cr>', 'neotree' },
  e = {
    function()
      -- require('neo-tree.command').execute { toggle = true, dir = '/home/skogix' }
      require('neo-tree.command').execute { source = 'filesystem', toggle = true }
    end,
    'Explorer NeoTree (Root Dir)',
  },
  --   {
  --     '<leader>fE',
  --     function()
  --       require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
  --     end,
  --     desc = 'Explorer NeoTree (cwd)',
  --   },
  --   { '<leader>e', '<leader>fe', desc = 'Explorer NeoTree (Root Dir)', remap = true },
  --   { '<leader>E', '<leader>fE', desc = 'Explorer NeoTree (cwd)', remap = true },
  --   {
  --     '<leader>ge',
  --     function()
  --       require('neo-tree.command').execute { source = 'git_status', toggle = true }
  --     end,
  --     desc = 'Git Explorer',
  --   },
  --   {
  --     '<leader>be',
  --     function()
  --       require('neo-tree.command').execute { source = 'buffers', toggle = true }
  --     end,
  --     desc = 'Buffer Explorer',
  --   },

  h = {
    name = 'harpoon',
    h = {
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      'harpoon quick menu',
    },
    n = {
      function()
        harpoon:list():add()
      end,
      'harpoon add file',
    },
    a = {
      function()
        harpoon:list():select(1)
      end,
      'harpoon file 1',
    },
    o = {
      function()
        harpoon:list():select(2)
      end,
      'harpoon file 2',
    },
    e = {
      function()
        harpoon:list():select(3)
      end,
      'harpoon file 3',
    },
    u = {
      function()
        harpoon:list():select(4)
      end,
      'harpoon file 4',
    },
  },
  s = {
    name = 'search',
    s = { telescope.live_grep, 'search with grep' },
    h = { telescope.help_tags, 'search help' },
    k = { telescope.keymaps, 'search keymaps' },
    f = { telescope.find_files, 'search files' },
    t = { telescope.builtin, 'search telescope' },
    w = { telescope.grep_string, 'search current word' },
    d = { telescope.diagnostics, 'search diagnostics' },
    b = { telescope.buffers, 'search buffers' },
    -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    ['.'] = { telescope.oldfiles, 'search recent files' },
  },
  r = { name = 'refactor' },
  l = { name = 'lsp' },
  d = { name = 'debug' },
  -- t = { '<cmd>ToggleTerm direction=float<cr>', 'ToggleTerm' },
  ['T'] = { name = 'toggle' },
  m = { name = 'macro/markdown' },
  n = { name = 'notifications' },
  ['<tab>'] = { name = 'tabs' },
  [';'] = { name = 'test' },
  ["'"] = { name = 'marks' },
  ['/'] = { name = 'search' },
  ['/g'] = { name = 'git' },
  ['/gd'] = { name = 'diff' },
  ['['] = { name = 'previous' },
  [']'] = { name = 'next' },
  g = {
    name = 'git',
    l = { '<cmd>LazyGit<cr>', 'LazyGit' },
    f = { '<cmd>Telescope find_files<cr>', 'Find File' }, -- create a binding with label
  },
  t = {
    name = 'task',
    b = { name = 'b' },
    c = { name = 'c' },
    G = { name = 'b' },
    h = { name = 'b' },
    o = { name = 'todo', d = { name = 'todo' } },
    ['odo'] = { '<cmd>:e /home/skogix/org/todo.md<cr>', 'todo' },
    ['oado'] = { '<cmd>:e /home/skogix/org/todo.md<cr>', 'todo' },
  },
  -- neorg
  w = {
    name = 'neorg',
    w = { '<cmd>Neorg index<cr>', 'wiki' },
    n = { '<cmd>Neorg keybind norg core.dirman.new.note<cr>', 'new note' },
    ['/'] = { '<cmd>Neorg keybind norg core.integrations.telescope.find_linkable<cr>', 'new note' },
    ['<leader>'] = { '<cmd>Neorg keybind norg<cr>', 'keybinds' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.find_norg_files<cr>', 'find linkable' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.insert_link<cr>', '' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.insert_file_link<cr>', '' },
    -- x = { '<cmd>Neorg keybind norg core.itero.next-iteration<cr>', '[enter]next iteration' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.<cr>', '' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.<cr>', '' },
    -- x = { '<cmd>Neorg keybind norg core.integrations.telescope.<cr>', '' },
  },
  -- vimwiki:
  -- w = {
  --   name = 'wiki',
  --   w = { '<cmd>VimwikiIndex<cr><cmd>VimwikiGenerateLinks<cr><cmd>VimwikiGenerateTagLinks<cr>', 'wiki' },
  --   u = { '<cmd>VimwikiMakeDiaryNote<cr>', 'update todays diary' },
  --   i = { '<cmd>VimwikiDiaryIndex<cr><cmd>VimwikiDiaryGenerateLinks<cr>', 'diary index' },
  --   n = { '<cmd>VimwikiGoto<cr>', 'new note' },
  --   s = { '<cmd>Telescope vimwiki<cr>', 'search' }, -- create a binding with label
  --   f = { name = 'file', r = { '<cmd>VimwikiRenameFile<cr>', 'rename' }, d = { '<cmd>VimwikiDeleteFile<cr>', 'delete' } },
  -- },
}
local opts = {
  prefix = '<leader>',
}

-- local binds = require 'skogix.mappings'

wk.register(binds, opts)
