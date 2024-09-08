local map = vim.keymap.set

-- Map ';' to ':' in normal mode
map("n", ";", ":", { desc = "; -> :" })
-- Disable 's' in normal mode
map("n", "s", "<Nop>", { desc = "" })

local M = {}

M.which_key = function()
  return {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>K", "<Nop>"
    }
  }
end

M.fzf = function()
  require("which-key").add({"s", group = "fzf"})
  return {
    { "sc",  function() require("fzf-lua").commands() end,        desc = "Search commands" },
    { "sC",  function() require("fzf-lua").command_history() end, desc = "Search command history" },
    { "sf",  function() require("fzf-lua").files() end,           desc = "Find files" },
    { "so",  function() require("fzf-lua").oldfiles() end,        desc = "Find files" },
    { "sh",  function() require("fzf-lua").highlights() end,      desc = "Search highlights" },
    { "sM",  function() require("fzf-lua").marks() end,           desc = "Search marks" },
    { "sk",  function() require("fzf-lua").keymaps() end,         desc = "Search keymaps" },
    { "st",  function() require("fzf-lua").treesitter() end,      desc = "Search treesitter" },
    { "sgf", function() require("fzf-lua").git_files() end,       desc = "Find git files" },
    { "sgb", function() require("fzf-lua").git_branches() end,    desc = "Search git branches" },
    { "sgc", function() require("fzf-lua").git_commits() end,     desc = "Search git commits" },
    { "sgc",  function() require("fzf-lua").git_bcommits() end,   desc = "Search git buffer commits" },
    { "s/",  function() require("fzf-lua").resume() end,          desc = "Resume FZF" },
    { "ss",  function() require("fzf-lua").files() end,           desc = "Find files" },
  }
end

M.gpchat = function()
  require("which-key").add({
      -- VISUAL mode mappings
      {
          mode = { "v" },
          nowait = true,
          remap = false,
          { "<leader>at", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "ChatNew tabnew" },
          { "<leader>av", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
          { "<leader>ax", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
          { "<leader>aa", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
          { "<leader>ab", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)" },
          { "<leader>ac", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
          { "<leader>ag", group = "generate into new .." },
          { "<leader>age", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
          { "<leader>agn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
          { "<leader>agp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
          { "<leader>agt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" },
          { "<leader>agv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
          { "<leader>ai", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
          { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<leader>ap", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
          { "<leader>ar", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
          { "<leader>as", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<leader>at", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
          { "<leader>aw", group = "Whisper" },
          { "<leader>awa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append" },
          { "<leader>awb", ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend" },
          { "<leader>awe", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<leader>awn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<leader>awp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<leader>awr", ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite" },
          { "<leader>awt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<leader>awv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<leader>aww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
          { "<leader>ax", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
      },

      -- NORMAL mode mappings
      {
          mode = { "n" },
          nowait = true,
          remap = false,
          { "<leader>a<C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
          { "<leader>a<C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
          { "<leader>a<C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
          { "<leader>aa", "<cmd>GpAppend<cr>", desc = "Append (after)" },
          { "<leader>ab", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
          { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New Chat" },
          { "<leader>af", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
          { "<leader>ag", group = "generate into new .." },
          { "<leader>age", "<cmd>GpEnew<cr>", desc = "GpEnew" },
          { "<leader>agn", "<cmd>GpNew<cr>", desc = "GpNew" },
          { "<leader>agp", "<cmd>GpPopup<cr>", desc = "Popup" },
          { "<leader>agt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
          { "<leader>agv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
          { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<leader>ar", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
          { "<leader>as", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<leader>at", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
          { "<leader>aw", group = "Whisper" },
          { "<leader>awa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
          { "<leader>awb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
          { "<leader>awe", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<leader>awn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<leader>awp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<leader>awr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
          { "<leader>awt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<leader>awv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<leader>aww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
          { "<leader>ax", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },

      -- INSERT mode mappings
      {
          mode = { "i" },
          nowait = true,
          remap = false,
          { "<leader>at", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
          { "<leader>av", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
          { "<leader>ax", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
          { "<leader>aa", "<cmd>GpAppend<cr>", desc = "Append (after)" },
          { "<leader>ab", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
          { "<leader>ac", "<cmd>GpChatNew<cr>", desc = "New Chat" },
          { "<leader>af", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
          { "<leader>ag", group = "generate into new .." },
          { "<leader>age", "<cmd>GpEnew<cr>", desc = "GpEnew" },
          { "<leader>agn", "<cmd>GpNew<cr>", desc = "GpNew" },
          { "<leader>agp", "<cmd>GpPopup<cr>", desc = "Popup" },
          { "<leader>agt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
          { "<leader>agv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
          { "<leader>an", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
          { "<leader>ar", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
          { "<leader>as", "<cmd>GpStop<cr>", desc = "GpStop" },
          { "<leader>at", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
          { "<leader>aw", group = "Whisper" },
          { "<leader>awa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
          { "<leader>awb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
          { "<leader>awe", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
          { "<leader>awn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
          { "<leader>awp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
          { "<leader>awr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
          { "<leader>awt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
          { "<leader>awv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
          { "<leader>aww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
          { "<leader>ax", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
      },
  })
end

return M

