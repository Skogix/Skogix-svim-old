local map = vim.keymap.set

map("n", ";", ":", { desc = "; -> :" })
map("n", "s", "<Nop>", { desc = "; -> :" })
    -- disable the keymap to grep files
    -- {"<leader>/", false},
-- vim.keymaps.del("n", "s")

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

return M
