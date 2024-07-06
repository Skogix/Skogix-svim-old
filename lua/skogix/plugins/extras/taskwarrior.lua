return {
  'skogix/taskwarrior.nvim',
  opts = {
    -- require('taskwarrior_nvim').browser { 'ready' },
    filter = { 'noice', 'nofile' }, -- Filtered buffer_name and buffer_type.
    task_file_name = '.taskwarrior.json',
    -- After what period of time should a task be halted due to inactivity?
    granulation = 60 * 1000 * 10,
    notify_start = false, -- Should a notification pop up after starting the task?
    notify_stop = false,
    notify_error = false,
  },
  -- or
  -- config = true,
  -- config = function()
  --   require('taskwarrior_nvim').browser { 'ready' }
  -- end,
}
