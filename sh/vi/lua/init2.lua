
local hotfun = {}
hotfun.teles_ff = function()
    local opt = require('telescope.themes').get_ivy({height=10,previewer=false,winblend=16})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
    print("init.lua loaded once more")
end
-- nkeymap('<C-h>', ':lua require("init").teles_ff()<cr>')
-- nkeymap('<C-h>', ':lua require("init").teles_ff()<cr>')
-- :lua package.loaded.init = nil
return hotfun

