
local highlight = {
    "CursorColumn",
    "Whitespace",
}
-- require("ibl").setup

return {
  'lukas-reineke/indent-blankline.nvim', -- usable
  main = "ibl",
  opts =
    {
      enabled = true,
      exclude = { filetypes = {'dashboard'}},
      indent = {
        highlight = highlight,
        char = "░",
        -- char = "┊",
      },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = true },
    }
  -- filetype_exclude = {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'},
  -- show_end_of_line = false,
  -- show_current_context = true,
  -- show_current_context_start = true,
  -- show_trailing_blankline_indent = false,
  -- char_blankline = "",
  -- context_char_blankline = "⋅",
  -- space_char_blankline = ' ',
  -- context_char = '│',
  -- ┊ ⋮ ⋅ ░ ∷
  -- let g:indent_blankline_buftype_exclude = ['terminal', 'nofile', 'quickfix', 'prompt', 'startify']
  -- let g:indent_blankline_filetype_exclude = {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}
}

