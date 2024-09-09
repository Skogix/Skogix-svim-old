-- Define the module 'M' with the configuration and dependencies for 'oil.nvim' plugin
local M = {
  "stevearc/oil.nvim",               -- The main plugin name
  enabled = true,                    -- Flag to enable or disable this plugin
  dependencies = {                   -- List of plugin dependencies
    { "nvim-tree/nvim-web-devicons" },   -- Dependency: Adds file type icons
    { "SirZenith/oil-vcs-status" },      -- Dependency: Adds version control status
  },
  keys = {                           -- Key mappings for launching the plugin
    { "<leader>E", "<cmd>Oil<cr>", desc = "Oil" },  -- Mapping for opening 'Oil' with description
  }
}

-- This is the configuration function for 'Oil'
function M.config()
  require("oil").setup({
    win_options = {                  -- Window options configuration
      signcolumn = "yes:2",          -- Configure the sign column to always show and allocate space for 2 signs
    },
    keymaps = {                      -- Key mappings to interact with 'Oil'
      ["g?"] = "actions.show_help",      -- Show help
      ["<CR>"] = "actions.select",       -- Select item
      ["l"] = "actions.select",          -- Select item (alternate key)
      ["<C-k>"] = "actions.select_vsplit",-- Vertical split selection
      ["<C-j>"] = "actions.select_split", -- Horizontal split selection
      ["<C-t>"] = "actions.select_tab",   -- Open in new tab
      ["<C-p>"] = "actions.preview",      -- Preview item
      ["<C-c>"] = "actions.close",        -- Close
      ["q"] = "actions.close",            -- Close (alternate key)
      ["esc"] = "actions.close",          -- Close with escape key
      ["r"] = "actions.refresh",          -- Refresh items
      ["h"] = "actions.parent",           -- Go to parent directory
      ["_"] = "actions.open_cwd",         -- Open current working directory
      ["`"] = "actions.cd",               -- Change directory
      ["~"] = "actions.tcd",              -- Change tab directory
      ["gs"] = "actions.change_sort",     -- Change sort order
      ["gx"] = "actions.open_external",   -- Open item in external application
      ["."] = "actions.toggle_hidden",    -- Toggle hidden files
      ["g\\"] = "actions.toggle_trash",   -- Toggle trash items
    },
    view_options = {                 -- View options configuration
      show_hidden = true,            -- Show hidden files by default
    },
  })

  -- Load the 'oil-vcs-status' plugin and its constants definition
  local status_const = require("oil-vcs-status.constant.status")

  -- Define the various status types for version control
  local StatusType = status_const.StatusType

  -- Configuration for 'oil-vcs-status' plugin
  require("oil-vcs-status").setup({
    status_symbol = {                -- Symbols used for different version control statuses
      [StatusType.Added] = "",              -- Added files
      [StatusType.Copied] = "󰆏",             -- Copied files
      [StatusType.Deleted] = "",            -- Deleted files
      [StatusType.Ignored] = "",            -- Ignored files
      [StatusType.Modified] = "",           -- Modified files
      [StatusType.Renamed] = "",            -- Renamed files
      [StatusType.TypeChanged] = "󰉺",        -- Type changed files
      [StatusType.Unmodified] = " ",          -- Unmodified files
      [StatusType.Unmerged] = "",            -- Unmerged files
      [StatusType.Untracked] = "",           -- Untracked files
      [StatusType.External] = "",            -- External files

      [StatusType.UpstreamAdded] = "󰈞",       -- Upstream added files
      [StatusType.UpstreamCopied] = "󰈢",      -- Upstream copied files
      [StatusType.UpstreamDeleted] = "",     -- Upstream deleted files
      [StatusType.UpstreamIgnored] = " ",     -- Upstream ignored files
      [StatusType.UpstreamModified] = "󰏫",   -- Upstream modified files
      [StatusType.UpstreamRenamed] = "",    -- Upstream renamed files
      [StatusType.UpstreamTypeChanged] = "󱧶", -- Upstream type changed files
      [StatusType.UpstreamUnmodified] = " ",   -- Upstream unmodified files
      [StatusType.UpstreamUnmerged] = "",    -- Upstream unmerged files
      [StatusType.UpstreamUntracked] = " ",   -- Upstream untracked files
      [StatusType.UpstreamExternal] = "",    -- Upstream external files
    },
  })
end

-- Return the module definition
return M
