local map = vim.keymap.set

map("n", ";", ":", { desc = "; -> :" })
-- vim.keymaps.del("n", "s")

local M = {}

M.which_key = function()
    return {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    }
end
M.fzf = function()
  -- require("which-key").add({"<leader>/", group = "fzf"})
  return {
    -- { "<leader>/c",  function() require("fzf-lua").commands() end,        desc = "Search commands" },
    -- { "<leader>/C",  function() require("fzf-lua").command_history() end, desc = "Search command history" },
    -- { "<leader>/f",  function() require("fzf-lua").files() end,           desc = "Find files" },
    -- { "<leader>/o",  function() require("fzf-lua").oldfiles() end,        desc = "Find files" },
    -- { "<leader>/h",  function() require("fzf-lua").highlights() end,      desc = "Search highlights" },
    -- { "<leader>/M",  function() require("fzf-lua").marks() end,           desc = "Search marks" },
    -- { "<leader>/k",  function() require("fzf-lua").keymaps() end,         desc = "Search keymaps" },
    -- { "<leader>/t",  function() require("fzf-lua").treesitter() end,      desc = "Search treesitter" },
    -- { "<leader>/gf", function() require("fzf-lua").git_files() end,       desc = "Find git files" },
    -- { "<leader>/gb", function() require("fzf-lua").git_branches() end,    desc = "Search git branches" },
    -- { "<leader>/gc", function() require("fzf-lua").git_commits() end,     desc = "Search git commits" },
    -- { "<leader>/gC", function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    -- { "<leader>bc",  function() require("fzf-lua").git_bcommits() end,    desc = "Search git buffer commits" },
    -- { "<leader>//",  function() require("fzf-lua").resume() end,          desc = "Resume FZF" },
    --
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

return M
