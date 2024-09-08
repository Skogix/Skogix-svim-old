-- Function to create an autogroup with a given name
local function augroup(name)
    return vim.api.nvim_create_augroup("skogix_" .. name, {})
end

-- Autocommand: Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { -- Define autocommand for specific events
    group = augroup("checktime"), -- Use the custom augroup
    callback = function()
        if vim.o.buftype ~= "nofile" then -- Make sure this isn't done for "nofile" buffer types
            vim.cmd("checktime") -- Run the checktime command to reload the file if it has changed
        end
    end,
})

-- Autocommand: Highlight text that was just yanked
vim.api.nvim_create_autocmd("TextYankPost", { -- Trigger on TextYankPost event
    group = augroup("highlight_yank"), -- Use the custom augroup
    callback = function()
        vim.highlight.on_yank({ timeout = 50 }) -- Highlight the yanked text for 50ms
    end,
})

-- Autocommand: Go to the last known cursor position when a buffer is opened (if applicable)
vim.api.nvim_create_autocmd("BufReadPost", { -- Trigger on BufReadPost event
    group = augroup("last_loc"), -- Use the custom augroup
    callback = function(event)
        local exclude = { "gitcommit", "commit", "gitrebase" } -- File types to exclude from this behavior
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return -- Skip if buffer is in the exclude list or the cursor position has already been restored
        end
        vim.b[buf].lazyvim_last_loc = true -- Mark that the cursor position has been restored
        local mark = vim.api.nvim_buf_get_mark(buf, '"') -- Get the last cursor position mark
        local lcount = vim.api.nvim_buf_line_count(buf) -- Get the number of lines in the buffer
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark) -- Attempt to set the cursor position
        end
    end,
})
