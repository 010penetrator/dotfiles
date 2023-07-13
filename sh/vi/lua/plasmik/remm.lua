-- vim: ts=2 sw=2

print('hello from new file')

local navic = require("nvim-navic")

require("lualine").setup({

    --[[ sections = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        }
    }, ]]

   winbar = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        }
    }
})

