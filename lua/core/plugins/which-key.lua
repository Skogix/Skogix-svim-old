-- return {
--   {
--   "folke/which-key.nvim",
-- 	lazy = false,
--   opts = {
--     icons = {
--       group = "",
--     },
--     layout = {
--       align = "center",
--     },
--     -- keys = require('config.keymaps').which_key(),
--     defaults = {
--       { "<leader>c", group = " [code]" },
--       { "<leader>s", group = "󰈔 [search]" },
--       -- { "<leader>K", "<Nop>" },
--
--
--       -- ["<leader>ci"] = { name = "info" },
--       -- ["<leader><tab>"] = { name = "󰓩 tabs" },
--       -- ["<leader>b"] = { name = "󰖯 buffer" },
--       -- ["<leader>f"] = { name = "󰈔 file/find" },
--       -- ["<leader>g"] = { name = " git" },
--       -- ["<leader>l"] = { name = "󰒲 lazy" },
--       -- ["<leader>q"] = { name = "󰗼 quit/session" },
--       -- ["<leader>s"] = { name = " search" },
--       -- ["<leader>u"] = { name = " ui" },
--       -- ["<leader>w"] = { name = "󱂬 windows" },
--       -- ["<leader>x"] = { name = "󰁨 diagnostics/quickfix" },
--     },
--   }},
--   {
--     "echasnovski/mini.icons",
--     opts = {},
--     lazy = true,
--     specs = {
--       { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
--     },
--     init = function()
--       package.preload["nvim-web-devicons"] = function()
--         require("mini.icons").mock_nvim_web_devicons()
--         return package.loaded["nvim-web-devicons"]
--       end
--     end,
--   },
-- }

-- File: ~/.config/nvim/lua/plugins/whichkey.lua
-- Last Change: Sun, 28 Jul 2024 - 11:35:16

return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  enabled = true,
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- defaults = {
    --   ["<leader>c"] = { name = "+code" },
    --   ["<leader>cr" ] = { desc = "Lsp rename" },
    -- },
    ---@type false | "classic" | "modern" | "helix"
    preset = "helix",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,
    ---@param mapping wk.Mapping
    filter = function(mapping)
      -- example to exclude mappings without a description
      -- return mapping.desc and mapping.desc ~= ""
      return true
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    ---@type wk.Spec
    spec = {},
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Enable/disable WhichKey for certain mapping modes
    -- modes = {
    --   n = true,  -- Normal mode
    --   i = false, -- Insert mode
    --   x = false, -- Visual mode
    --   s = false, -- Select mode
    --   o = false, -- Operator pending mode
    --   t = false, -- Terminal mode
    --   c = false, -- Command mode
    --   -- Start hidden and wait for a key to be pressed before showing the popup
    --   -- Only used by enabled xo mapping modes.
    --   -- Set to false to show the popup immediately (after the delay)
    --   defer = {
    --     ["<C-V>"] = true,
    --     V = true,
    --   },
    -- },
    plugins = {
      marks = false,     -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = false,    -- adds help for operators like d, y, ...
        motions = false,      -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        windows = false,      -- default bindings on <c-w>
        nav = false,          -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = true,            -- bindings for prefixed with g
      },
    },
    ---@type wk.Win.opts
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      -- border = "none",
      padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
      title = true,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3,          -- spacing between columns
      align = "left",       -- align columns left, center or right
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    ---@type (string|wk.Sorter)[]
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "local", "order", "group", "alphanum", "mod" },
    ---@type number|fun(node: wk.Node):boolean?
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%((.*)%)", "%1" },
        { "^%+",            "" },
        { "<[cC]md>",       "" },
        { "<[cC][rR]>",     "" },
        { "<[sS]ilent>",    "" },
        { "^lua%s+",        "" },
        { "^call%s+",       "" },
        { "^:%s*",          "" },
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons
      ---@type wk.IconRule[]|false
      rules = {},
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "⌫",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers yourself.
    -- Be aware, that triggers are not needed for visual and operator pending mode.
    -- triggers = true, -- automatically setup triggers
    triggers = {
      { "<leader>", mode = { "n" } },
    },
    -- disable = {
    --   -- disable WhichKey for certain buf types and file types.
    --   ft = {},
    --   bt = {},
    --   -- disable a trigger for a certain context by returning true
    --   ---@type fun(ctx: { keys: string, mode: string, plugin?: string }):boolean?
    --   trigger = function(ctx)
    --     return false
    --   end,
    -- },
    debug = false, -- enable wk.log in the current directory
  },
}
