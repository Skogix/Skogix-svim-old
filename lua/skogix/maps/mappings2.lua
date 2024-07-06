local whichkey = require("which-key")
local harpoon = require("harpoon")
local telescope = require("telescope.builtin")

-- autocmd
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	callback = function()
		-- print(string.format('event fired: %s', vim.inspect(ev)))
		WhichKeyNorg()
	end,
})

-- autocmd
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.md" },
	callback = function()
		-- print(string.format('event fired: %s', vim.inspect(ev)))
		WhichKeyVimwiki()
	end,
})

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	telescope.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "search in open files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	telescope.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "search neovim config" })

-- other
whichkey.register({
	b = { name = "buffer" },
	c = { name = "code" },
	e = {
		function()
			-- require('neo-tree.command').execute { toggle = true, dir = '/home/skogix' }
			require("neo-tree.command").execute({ source = "filesystem", toggle = true })
		end,
		"Explorer NeoTree (Root Dir)",
	},
	r = { name = "refactor" },
	l = { name = "lsp" },
	d = { name = "debug" },
	T = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm" },
	-- t = { '<cmd>:TodoTelescope cwd=~/org/neorg<cr>', 'TODO' },
	m = { name = "macro/markdown" },
	-- n = { name = 'notifications' },
	["<tab>"] = { name = "tabs" },
	[";"] = { name = "test" },
	["'"] = { name = "marks" },
	["/"] = { name = "search" },
	["/g"] = { name = "git" },
	["/gd"] = { name = "diff" },
	["["] = { name = "previous" },
	["]"] = { name = "next" },
	g = {
		name = "git",
		l = { "<cmd>LazyGit<cr>", "LazyGit" },
		-- f = { '<cmd>Telescope find_files<cr>', 'Find File' }, -- create a binding with label
	},
	-- t = {
	--   name = 'task',
	--   --   b = { name = 'b' },
	--   --   c = { name = 'c' },
	--   --   G = { name = 'b' },
	--   --   h = { name = 'b' },
	--   --   o = { name = 'todo', d = { name = 'todo' } },
	--   --   ['odo'] = { '<cmd>:e /home/skogix/org/todo.md<cr>', 'todo' },
	--   --   ['oado'] = { '<cmd>:e /home/skogix/org/todo.md<cr>', 'todo' },
	-- },
}, { prefix = "<leader>" })

-- search
whichkey.register({
	name = "search",
	-- ['<leader>'] = { telescope.git_files, 'search git files' },
	s = { telescope.git_files, "search git files" },
	g = { telescope.live_grep, "search with grep" },
	h = { telescope.help_tags, "search help" },
	k = { telescope.keymaps, "search keymaps" },
	f = { telescope.find_files, "search files" },
	t = { telescope.builtin, "search telescope" },
	w = { telescope.grep_string, "search current word" },
	d = { telescope.diagnostics, "search diagnostics" },
	b = { telescope.buffers, "search buffers" },
	-- p = { require('telescope').extensions.project.project, 'search projects' },
	-- p = { telescope.project, 'search projects' },
	-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	["."] = { telescope.oldfiles, "search recent files" },
}, { prefix = "s" })

-- notes
whichkey.register({
	-- ['<localleader>'] = {
	--   name = '[Neorg] mode',
	--   m = { name = '[Neorg] mode' },
	-- },
	["<leader>"] = {
		w = {
			name = "notes",
			w = { "<cmd>VimwikiIndex<cr><cmd>VimwikiGenerateLinks<cr><cmd>VimwikiGenerateTagLinks<cr>", "wiki" },
			n = { "<cmd>Neorg index<cr>", "neorg" },
			t = { "<cmd>echo 'TODO'<cr>", "todo" },
		},
	},
}, {})

-- neorg local
function WhichKeyNorg()
	-- whichkey.register({
	--   ['ss'] = { '<cmd>Neorg keybind norg core.integrations.telescope.find_norg_files<cr>', 'search norg files' },
	--   ['sk'] = { '<cmd>Neorg keybind all<cr>', 'search neorg keybinds' },
	--
	--   ['<leader>w'] = {
	--     name = 'neorg',
	--     j = { '<cmd>Neorg journal<cr>', 'journal' },
	--     g = { '<cmd>Neorg generate-workspace-summary<cr>', 'generate summary' },
	--     -- n = { '<cmd>Neorg keybind norg core.dirman.new.note<cr>', 'new note' },
	--     c = { '<cmd>Neorg keybind norg core.dirman.new.note<cr>', 'new note' },
	--     ['/'] = { '<cmd>Neorg keybind norg core.integrations.telescope.find_linkable<cr>', 'new note' },
	--     ['<leader>'] = { '<cmd>Neorg keybind norg<cr>', 'keybinds' },
	--   },
	--   ['<localleader>'] = {
	--     name = 'neorg',
	--     j = { '<cmd>Neorg journal<cr>', 'journal' },
	--     g = { '<cmd>Neorg generate-workspace-summary<cr>', 'generate summary' },
	--     c = { '<cmd>Neorg keybind norg core.dirman.new.note<cr>', 'new note' },
	--     ['/'] = { '<cmd>Neorg keybind norg core.integrations.telescope.find_linkable<cr>', 'new note' },
	--     ['<leader>'] = { '<cmd>Neorg keybind norg<cr>', 'keybinds' },
	--   },
	-- }, {})
end

-- vimwiki
function WhichKeyVimwiki()
	-- whichkey.register({
	--   ['<leader>w'] = {
	--     name = 'vimwiki',
	--     w = { '<cmd>VimwikiIndex<cr><cmd>VimwikiGenerateLinks<cr><cmd>VimwikiGenerateTagLinks<cr>', 'vimwiki' },
	--     u = { '<cmd>VimwikiMakeDiaryNote<cr>', 'update todays diary' },
	--     i = { '<cmd>VimwikiDiaryIndex<cr><cmd>VimwikiDiaryGenerateLinks<cr>', 'diary index' },
	--     c = { '<cmd>VimwikiGoto<cr>', 'create new note' },
	--     s = { '<cmd>Telescope vimwiki<cr>', 'search' }, -- create a binding with label
	--     f = { name = 'file', r = { '<cmd>VimwikiRenameFile<cr>', 'rename' }, d = { '<cmd>VimwikiDeleteFile<cr>', 'delete' } },
	--   },
	-- }, {})
end

-- harpoon
whichkey.register({
	h = {
		name = "harpoon",
		h = {
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"harpoon quick menu",
		},
		n = {
			function()
				harpoon:list():add()
			end,
			"harpoon add file",
		},
		a = {
			function()
				harpoon:list():select(1)
			end,
			"harpoon file 1",
		},
		o = {
			function()
				harpoon:list():select(2)
			end,
			"harpoon file 2",
		},
		e = {
			function()
				harpoon:list():select(3)
			end,
			"harpoon file 3",
		},
		u = {
			function()
				harpoon:list():select(4)
			end,
			"harpoon file 4",
		},
	},
}, { prefix = "<leader>" })
