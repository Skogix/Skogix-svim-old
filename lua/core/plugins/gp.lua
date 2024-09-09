return {
  "robitx/gp.nvim",

  keys = require('config.keymaps').gpchat(),
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
    }
    local hooks = {
      UnitTests = function(gp, params)
        local template = "I have the following code from {{filename}}:\n\n"
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
        .. "Please respond by writing table driven unit tests for the code above."
        local agent = gp.get_command_agent()
        gp.Prompt(params, gp.Target.vnew, agent, template)
      end,
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
