return {
  {
    'vimwiki/vimwiki',
    branch = 'dev',
    -- event = 'BufEnter *.md', -- eventet körs på keys
    -- keys = {
    --   { '<leader>ww', '<cmd>VimwikiIndex<cr>', desc = 'index' },
    --   { '<leader>wt', '<cmd>VimwikiDiaryIndex<cr>', desc = 'diary' },
    -- },
    init = function()
      -- vim.g.vimwiki_folding = 'custom'
      -- vim.g.vimwiki_folding = 'list'
      -- vim.g.vimwiki_ext2syntax = {
      --   ['.md'] = 'markdown',
      --   ['.markdown'] = 'markdown',
      --   ['.mdown'] = 'markdown',
      -- }
      vim.g.vimwiki_key_mappings = {
        all_maps = 0,
        global = 0,
      }
      -- vim.g.vimwiki_path = '/home/skogix/org/wiki'
      -- vim.g.vimwiki_html_path = '/home/skogix/org/wiki/html'
      -- vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
      -- vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
      -- vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
      -- vim.g.taskwiki_markdown_syntax = 'markdown'
      -- vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
      -- let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
      --           \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
      --           \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
      --           \ 'html_filename_parameterization': 1,
      --           \ 'template_ext': '.tpl'}]
      vim.g.vimwiki_list = {
        {
          path = '~/org/wiki',
          template_path = '~/org/wiki-templates',
          template_default = 'default',
          syntax = 'markdown',
          ext = '.md',
          path_html = '~/org/site_html',
          custom_wiki2html = 'vimwiki_markdown',
          html_filename_parameterization = 1,
          template_ext = '.tpl',
        },
      }
      -- vim.g.vimwiki_ext2syntax = {}
      -- vim.g.vimwiki_global_ext = 0
    end,
    -- config = function() end,
  },
  -- {
  --   'tools-life/taskwiki',
  -- },
}
