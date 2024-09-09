return {
{
  "huynle/ogpt.nvim",
    event = "VeryLazy",
    opts = {
      -- default_provider = "ollama",
      default_provider = "openai",
      edgy = false, -- enable this!
      single_window = false, -- set this to true if you want only one OGPT window to appear at a time
      -- providers = {
      --   ollama = {
      --     api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
      --     api_key = os.getenv("OLLAMA_API_KEY") or "",
      --   }
      -- }
  actions = {
    infill_visible_code = {
      type = "popup",
      template = [[
      Given the following code snippets, please complete the code by infilling the rest of the code in between the two
      code snippets for BEFORE and AFTER, these snippets are given below.


      Code BEFORE infilling position:
      ```{{{filetype}}}
      {{{visible_window_content}}}
      {{{before_cursor}}}
      ```

      Code AFTER infilling position:
      ```{{{filetype}}}
      {{{after_cursor}}}
      ```


      Within the given snippets, complete the instructions that are given in between the
      triple percent sign '%%%-' and '-%%%'. Note that the instructions as
      could be multilines AND/OR it could be in a comment block of the code!!!

      Lastly, apply the following conditions to your response.
      * The response should replace the '%%%-' and '-%%%' if the code snippet was to be reused.
      * PLEASE respond ONLY with the answers to the given instructions.
      ]],
      strategy = "display",
      -- provider = "textgenui",
      -- model = "mixtral-8-7b",
      -- params = {
      --   max_new_tokens = 1000,
      -- },
    },
  },
    providers = {
      openai = {
        enabled = true,
        model = "gpt-4",
        api_host = os.getenv("OPENAI_API_HOST") or "https://api.openai.com",
        api_key = os.getenv("OPENAI_API_KEY") or "",
        api_params = {
          temperature = 0.5,
          top_p = 0.99,
        },
        api_chat_params = {
          frequency_penalty = 0.8,
          presence_penalty = 0.5,
          temperature = 0.8,
          top_p = 0.99,
        },
      },
      gemini = {
        enabled = false,
        api_host = os.getenv("GEMINI_API_HOST"),
        api_key = os.getenv("GEMINI_API_KEY"),
        model = "gemini-pro",
        api_params = {
          temperature = 0.5,
          topP = 0.99,
        },
        api_chat_params = {
          temperature = 0.5,
          topP = 0.99,
        },
      },
      anthropic = {
        enabled = false,
        api_key = os.getenv("ANTHROPIC_API_KEY"),
        model = "claude-3-opus-20240229",
        api_params = {
          temperature = 0.5,
          top_p = 0.99,
          max_tokens = 1024,
        },
        api_chat_params = {
          temperature = 0.5,
          top_p = 0.99,
          max_tokens = 1024,
        },
      },
      textgenui = {
        enabled = false,
        api_host = os.getenv("OGPT_API_HOST"),
        api_key = os.getenv("OGPT_API_KEY"),
        model = {
          -- create a modify url specifically for mixtral to run
          name = "mixtral-8-7b",
          -- model = {
          --   -- create a modify url specifically for mixtral to run
          --   name = "mixtral-8-7b",
          --   modify_url = function(url)
          --     -- given a URL, this function modifies the URL specifically to the model
          --     -- This is useful when you have different models hosted on different subdomains like
          --     -- https://model1.yourdomain.com/
          --     -- https://model2.yourdomain.com/
          --     local new_model = "mixtral-8-7b"
          --     local host = url:match("https?://([^/]+)")
          --     local subdomain, domain, tld = host:match("([^.]+)%.([^.]+)%.([^.]+)")
          --     local _new_url = url:gsub(host, new_model .. "." .. domain .. "." .. tld)
          --     return _new_url
          --   end,
          --   conform_fn = function(params)
          --     -- Different models might have different instruction format
          --     -- for example, Mixtral operates on `<s> [INST] Instruction [/INST] Model answer</s> [INST] Follow-up instruction [/INST] `
          --   end,
          -- },
        },
        api_params = {
          -- frequency_penalty = 0,
          -- presence_penalty = 0,
          temperature = 0.5,
          top_p = 0.99,
        },
        api_chat_params = {
          frequency_penalty = 0.8,
          presence_penalty = 0.5,
          temperature = 0.8,
          top_p = 0.99,
        },
      },
      ollama = {
        enabled = true,
        api_host = os.getenv("OLLAMA_API_HOST") or "http://localhost:11434",
        api_key = os.getenv("OLLAMA_API_KEY") or "",
        models = {
          -- create a modify url specifically for mixtral to run
          -- name = "mistral:7b",
          name = "mistral:latest",
          modify_url = function(url)
            return url
          end,
          -- conform_fn = function(params)
          --   -- Different models might have different instruction format
          --   -- for example, Mixtral operates on `<s> [INST] Instruction [/INST] Model answer</s> [INST] Follow-up instruction [/INST] `
          -- end,
        },
        model = {
          name = "mistral:7b",
          system_message = nil,
        },
        api_params = {
          -- used for `edit` and `edit_code` strategy in the actions
          model = nil,
          -- model = "mistral:7b",
          -- frequency_penalty = 0,
          -- presence_penalty = 0,
          temperature = 0.5,
          top_p = 0.99,
        },
        api_chat_params = {
          -- use default ollama model
          model = nil,
          temperature = 0.8,
          top_p = 0.99,
        },
      },
    },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
},
{
    "folke/edgy.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen" -- or "topline" or "screen"
    end,
    opts = {
      exit_when_last = false,
      animate = {
        enabled = false,
      },
      wo = {
        winbar = true,
        winfixwidth = true,
        winfixheight = false,
        winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
        spell = false,
        signcolumn = "no",
      },
      keys = {
        -- -- close window
        ["q"] = function(win)
          win:close()
        end,
        -- close sidebar
        ["Q"] = function(win)
          win.view.edgebar:close()
        end,
        -- increase width
        ["<S-Right>"] = function(win)
          win:resize("width", 3)
        end,
        -- decrease width
        ["<S-Left>"] = function(win)
          win:resize("width", -3)
        end,
        -- increase height
        ["<S-Up>"] = function(win)
          win:resize("height", 3)
        end,
        -- decrease height
        ["<S-Down>"] = function(win)
          win:resize("height", -3)
        end,
{
  "<leader>]]",
  "<cmd>OGPTFocus<CR>",
  desc = "GPT",
},
{
  "<leader>]",
  ":'<,'>OGPTRun<CR>",
  desc = "GPT",
  mode = { "n", "v" },
},
{
  "<leader>]c",
  "<cmd>OGPTRun edit_code_with_instructions<CR>",
  "Edit code with instruction",
  mode = { "n", "v" },
},
{
  "<leader>]e",
  "<cmd>OGPTRun edit_with_instructions<CR>",
  "Edit with instruction",
  mode = { "n", "v" },
},
{
  "<leader>]g",
  "<cmd>OGPTRun grammar_correction<CR>",
  "Grammar Correction",
  mode = { "n", "v" },
},
{
  "<leader>]r",
  "<cmd>OGPTRun evaluate<CR>",
  "Evaluate",
  mode = { "n", "v" },
},
{
  "<leader>]i",
  "<cmd>OGPTRun get_info<CR>",
  "Get Info",
  mode = { "n", "v" },
},
{ "<leader>]t", "<cmd>OGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
{ "<leader>]k", "<cmd>OGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
{ "<leader>]d", "<cmd>OGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
{ "<leader>]a", "<cmd>OGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
{ "<leader>]<leader>", "<cmd>OGPTRun custom_input<CR>", "Custom Input", mode = { "n", "v" } },
{ "g?", "<cmd>OGPTRun quick_question<CR>", "Quick Question", mode = { "n" } },
{ "<leader>]f", "<cmd>OGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
{
  "<leader>]x",
  "<cmd>OGPTRun explain_code<CR>",
  "Explain Code",
  mode = { "n", "v" },
},
     },
      right = {
        {
          title = "OGPT Popup",
          ft = "ogpt-popup",
          size = { width = 0.2 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Parameters",
          ft = "ogpt-parameters-window",
          size = { height = 6 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Template",
          ft = "ogpt-template",
          size = { height = 6 },
        },
        {
          title = "OGPT Sessions",
          ft = "ogpt-sessions",
          size = { height = 6 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT System Input",
          ft = "ogpt-system-window",
          size = { height = 6 },
        },
        {
          title = "OGPT",
          ft = "ogpt-window",
          size = { height = 0.5 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT {{{selection}}}",
          ft = "ogpt-selection",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPt {{{instruction}}}",
          ft = "ogpt-instruction",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
        {
          title = "OGPT Chat",
          ft = "ogpt-input",
          size = { width = 80, height = 4 },
          wo = {
            wrap = true,
          },
        },
      },
    },
  }
}
--
-- return {
--     "huynle/ogpt.nvim",
--     dev = true,
--     event = "VeryLazy",
--     keys = {
--       {
--         "<leader>]]",
--         "<cmd>OGPTFocus<CR>",
--         desc = "GPT",
--       },
--       {
--         "<leader>]",
--         ":'<,'>OGPTRun<CR>",
--         desc = "GPT",
--         mode = { "n", "v" },
--       },
--       {
--         "<leader>]c",
--         "<cmd>OGPTRun edit_code_with_instructions<CR>",
--         "Edit code with instruction",
--         mode = { "n", "v" },
--       },
--       {
--         "<leader>]e",
--         "<cmd>OGPTRun edit_with_instructions<CR>",
--         "Edit with instruction",
--         mode = { "n", "v" },
--       },
--       {
--         "<leader>]g",
--         "<cmd>OGPTRun grammar_correction<CR>",
--         "Grammar Correction",
--         mode = { "n", "v" },
--       },
--       {
--         "<leader>]r",
--         "<cmd>OGPTRun evaluate<CR>",
--         "Evaluate",
--         mode = { "n", "v" },
--       },
--       {
--         "<leader>]i",
--         "<cmd>OGPTRun get_info<CR>",
--         "Get Info",
--         mode = { "n", "v" },
--       },
--       { "<leader>]t", "<cmd>OGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
--       { "<leader>]k", "<cmd>OGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
--       { "<leader>]d", "<cmd>OGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
--       { "<leader>]a", "<cmd>OGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
--       { "<leader>]<leader>", "<cmd>OGPTRun custom_input<CR>", "Custom Input", mode = { "n", "v" } },
--       { "g?", "<cmd>OGPTRun quick_question<CR>", "Quick Question", mode = { "n" } },
--       { "<leader>]f", "<cmd>OGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
--       {
--         "<leader>]x",
--         "<cmd>OGPTRun explain_code<CR>",
--         "Explain Code",
--         mode = { "n", "v" },
--       },
--     },
--     -- config = function ()
--     -- end,
--     opts = {
--       -- default_provider = "ollama",
--       default_provider = "openai",
--       -- default edgy flag
--       -- set this to true if you prefer to use edgy.nvim (https://github.com/folke/edgy.nvim) instead of floating windows
--       edgy = false,
--       providers = {
--         ollama= {
--           api_host = os.getenv("OLLAMA_API_HOST"),
--           -- default model
--           model = "mistral:7b",
--           -- model definitions
--           models = {
--             -- alias to actual model name, helpful to define same model name across multiple providers
--             coder = "deepseek-coder:6.7b",
--             -- nested alias
--             cool_coder = "coder",
--             general_model = "mistral:7b",
--             custom_coder = {
--               name = "deepseek-coder:6.7b",
--               modify_url = function(url)
--                 -- completely modify the URL of a model, if necessary. This function is called
--                 -- right before making the REST request
--                 return url
--               end,
--               -- custom conform function. Each provider have a dedicated conform function where all
--               -- of OGPT chat info is passed into the conform function to be massaged to the
--               -- correct format that the provider is expecting. This function, if provided will
--               -- override the provider default conform function
--               -- conform_fn = function(ogpt_params)
--               --   return provider_specific_params
--               -- end,
--             },
--           },
--           -- default model params for all 'actions'
--           api_params = {
--             model = "mistral:7b",
--             temperature = 0.8,
--             top_p = 0.9,
--           },
--           api_chat_params = {
--             model = "mistral:7b",
--             frequency_penalty = 0,
--             presence_penalty = 0,
--             temperature = 0.5,
--             top_p = 0.9,
--           },
--         },
--         openai= {
--           api_host = os.getenv("OPENAI_API_HOST"),
--           api_key = os.getenv("OPENAI_API_KEY"),
--           api_params = {
--             model = "gpt-4",
--             temperature = 0.8,
--             top_p = 0.9,
--           },
--           api_chat_params = {
--             model = "gpt-4",
--             frequency_penalty = 0,
--             presence_penalty = 0,
--             temperature = 0.5,
--             top_p = 0.9,
--           },
--         },
--         textgenui = {
--           api_host = os.getenv("TEXTGEN_API_HOST"),
--           api_key = os.getenv("TEXTGEN_API_KEY"),
--           api_params = {
--             model = "mixtral-8-7b",
--             temperature = 0.8,
--             top_p = 0.9,
--           },
--           api_chat_params = {
--             model = "mixtral-8-7b",
--             frequency_penalty = 0,
--             presence_penalty = 0,
--             temperature = 0.5,
--             top_p = 0.9,
--           },
--         },
--       },
--       yank_register = "+",
--       edit = {
--         edgy = nil, -- use global default, override if defined
--         diff = false,
--         keymaps = {
--           close = "<C-c>",
--           accept = "<M-CR>",
--           toggle_diff = "<C-d>",
--           toggle_parameters = "<C-o>",
--           cycle_windows = "<Tab>",
--           use_output_as_input = "<C-u>",
--         },
--       },
--       popup = {
--         edgy = nil, -- use global default, override if defined
--         position = 1,
--         size = {
--           width = "40%",
--           height = 10,
--         },
--         padding = { 1, 1, 1, 1 },
--         enter = true,
--         focusable = true,
--         zindex = 50,
--         border = {
--           style = "rounded",
--         },
--         buf_options = {
--           modifiable = false,
--           readonly = false,
--           filetype = "ogpt-popup",
--           syntax = "markdown",
--         },
--         win_options = {
--           wrap = true,
--           linebreak = true,
--           winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--         },
--         keymaps = {
--           close = { "<C-c>", "q" },
--           accept = "<C-CR>",
--           append = "a",
--           prepend = "p",
--           yank_code = "c",
--           yank_to_register = "y",
--         },
--       },
--       chat = {
--         edgy = nil, -- use global default, override if defined
--         welcome_message = "hello world!",
--         loading_text = "Loading, please wait ...",
--         question_sign = "", -- 🙂
--         answer_sign = "ﮧ", -- 🤖
--         border_left_sign = "|",
--         border_right_sign = "|",
--         max_line_length = 120,
--         sessions_window = {
--           active_sign = " 󰄵 ",
--           inactive_sign = " 󰄱 ",
--           current_line_sign = "",
--           border = {
--             style = "rounded",
--             text = {
--               top = " Sessions ",
--             },
--           },
--           win_options = {
--             winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--           },
--         },
--         keymaps = {
--           close = { "<C-c>" },
--           yank_last = "<C-y>",
--           yank_last_code = "<C-i>",
--           scroll_up = "<C-u>",
--           scroll_down = "<C-d>",
--           new_session = "<C-n>",
--           cycle_windows = "<Tab>",
--           cycle_modes = "<C-f>",
--           next_message = "J",
--           prev_message = "K",
--           select_session = "<CR>",
--           rename_session = "r",
--           delete_session = "d",
--           draft_message = "<C-d>",
--           edit_message = "e",
--           delete_message = "d",
--           toggle_parameters = "<C-o>",
--           toggle_message_role = "<C-r>",
--           toggle_system_role_open = "<C-s>",
--           stop_generating = "<C-x>",
--         },
--       },
--
--       -- {{{input}}} is always available as the selected/highlighted text
--       actions = {
--         grammar_correction = {
--           type = "popup",
--           template = "Correct the given text to standard {{{lang}}}:\n\n```{{{input}}}```",
--           system = "You are a helpful note writing assistant, given a text input, correct the text only for grammar and spelling error. You are to keep all formatting the same, e.g. markdown bullets, should stay as a markdown bullet in the result, and indents should stay the same. Return ONLY the corrected text.",
--           strategy = "replace",
--           params = {
--             temperature = 0.3,
--           },
--           args = {
--             lang = {
--               type = "string",
--               optional = "true",
--               default = "english",
--             },
--           },
--         },
--         translate = {
--           type = "popup",
--           template = "Translate this into {{{lang}}}:\n\n{{{input}}}",
--           strategy = "display",
--           params = {
--             temperature = 0.3,
--           },
--           args = {
--             lang = {
--               type = "string",
--               optional = "true",
--               default = "vietnamese",
--             },
--           },
--         },
--         keywords = {
--           type = "popup",
--           template = "Extract the main keywords from the following text to be used as document tags.\n\n```{{{input}}}```",
--           strategy = "display",
--           params = {
--             model = "general_model", -- use of model alias, generally, this model alias should be available to all providers in use
--             temperature = 0.5,
--             frequency_penalty = 0.8,
--           },
--         },
--         do_complete_code = {
--           type = "popup",
--           template = "Code:\n```{{{filetype}}}\n{{{input}}}\n```\n\nCompleted Code:\n```{{{filetype}}}",
--           strategy = "display",
--           params = {
--             model = "coder",
--             stop = {
--               "```",
--             },
--           },
--         },
--
--         quick_question = {
--           type = "popup",
--           args = {
--             -- template expansion
--             question = {
--               type = "string",
--               optional = "true",
--               default = function()
--                 return vim.fn.input("question: ")
--               end,
--             },
--           },
--           system = "You are a helpful assistant",
--           template = "{{{question}}}",
--           strategy = "display",
--         },
--
--         custom_input = {
--           type = "popup",
--           args = {
--             instruction = {
--               type = "string",
--               optional = "true",
--               default = function()
--                 return vim.fn.input("instruction: ")
--               end,
--             },
--           },
--           system = "You are a helpful assistant",
--           template = "Given the follow snippet, {{{instruction}}}.\n\nsnippet:\n```{{{filetype}}}\n{{{input}}}\n```",
--           strategy = "display",
--         },
--
--         optimize_code = {
--           type = "popup",
--           system = "You are a helpful coding assistant. Complete the given prompt.",
--           template = "Optimize the code below, following these instructions:\n\n{{{instruction}}}.\n\nCode:\n```{{{filetype}}}\n{{{input}}}\n```\n\nOptimized version:\n```{{{filetype}}}",
--           strategy = "edit_code",
--           params = {
--             model = "coder",
--             stop = {
--               "```",
--             },
--           },
--         },
--       },
--     },
--     dependencies = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim",
--     },
--   }
