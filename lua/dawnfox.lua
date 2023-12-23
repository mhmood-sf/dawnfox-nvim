--[[

For Reference:
+------------------+
|   ID    |  Name  |
|---------+--------|
| shade0  | bg0    |
|---------+--------|
| shade1  | bg1    |
|---------+--------|
| shade2  | bg2    |
|---------+--------|
| shade3  | bg3    |
|---------+--------|
| shade4  | fg0    |
|---------+--------|
| shade5  | fg1    |
|---------+--------|
| shade6  | fg2    |
|---------+--------|
| shade7  | fg3    |
|---------+--------|
| accent0 | red    |
|---------+--------|
| accent1 | orange |
|---------+--------|
| accent2 | yellow |
|---------+--------|
| accent3 | green  |
|---------+--------|
| accent4 | cyan   |
|---------+--------|
| accent5 | blue   |
|---------+--------|
| accent6 | pink   |
|---------+--------|
| accent7 | purple |
|---------+--------|
| aux0    | bluish |
+---------+--------+
| aux1    | bluish |
+---------+--------+

--]]

-- Clear and reset.
vim.cmd "highlight clear"

if vim.g.syntax_on ~= nil then
    vim.cmd "syntax reset"
end

vim.g.colors_name = "dawnfox"

-- UI Shades
local background = "#faf4ed"
local foreground = "#575279"
local comment    = "#9893a5"
local gutter     = "#ebe0df"
local menu       = "#d0d8d8"
local winsep     = "#ebe5df"
local selection  = "#d0d8d8"

-- Colors
local red    = "#b4637a"
local orange = "#d7827e"
local yellow = "#ea9d34"
local green  = "#618774"
local cyan   = "#56949f"
local blue   = "#286983"
local pink   = "#d685af"
local purple = "#907aa9"

local var = {
    shade0  = background,
    shade1  = comment,
    shade2  = gutter,
    shade3  = menu,
    shade4  = "#a8a3b3",
    shade5  = winsep,
    shade6  = winsep,
    shade7  = foreground,
    accent1 = orange,
    accent2 = yellow,
    accent3 = green,
    accent4 = cyan,
    accent5 = blue,
    accent6 = pink,
    accent7 = purple,
}

-- Whether to hide the tildes marking end of buffer
local hide_bufend = vim.g.aks_hide_endofbuffer

-- Whether to use italics or not
local use_italics = vim.g.aks_use_italics

-- Util function to highlight groups.
local function hi(group, style)
    if not use_italics then
        if style.gui and style.gui == "italic" then
            style.gui = nil
        end
    end

    -- Build attr-list.
    local attrs = " "
    attrs = attrs .. "guifg=" .. (style.fg  or "NONE") .. " "
    attrs = attrs .. "guibg=" .. (style.bg  or "NONE") .. " "
    attrs = attrs .. "guisp=" .. (style.sp  or "NONE") .. " "
    attrs = attrs .. "gui="   .. (style.gui or "NONE") .. " "

    vim.cmd("highlight " .. group .. attrs)
end

-- Syntax Groups (descriptions and ordering from `:h w18`)
hi("Comment",        { fg = comment, gui = "italic" })

hi("Constant",       { fg = orange })
hi("String",         { fg = green })
hi("Character",      { fg = cyan })
hi("Number",         { fg = yellow })
hi("Boolean",        { fg = yellow })
hi("Float",          { fg = yellow })

hi("Identifier",     { fg = blue })
hi("Function",       { fg = blue })

hi("Statement",      { fg = purple })
hi("Conditional",    { fg = purple })
hi("Repeat",         { fg = purple })
hi("Label",          { fg = purple })
hi("Operator",       { fg = purple })
hi("Keyword",        { fg = purple })
hi("Exception",      { fg = purple })

hi("PreProc",        { fg = pink })
hi("Include",        { fg = pink })
hi("Define",         { fg = pink })
hi("Macro",          { fg = pink })
hi("PreCondit",      { fg = pink })

hi("Type",           { fg = orange })
hi("StorageClass",   { fg = orange })
hi("Structure",      { fg = orange })
hi("Typedef",        { fg = orange })

hi("Special",        { fg = blue })
hi("SpecialChar",    { fg = orange })
hi("Tag",            {})
hi("Delimiter",      {})
hi("SpecialComment", { fg = comment })
hi("Debug",          {})

hi("Underlined",     { gui = "underline" })
hi("Ignore",         {})
hi("Error",          { fg = red })
hi("Todo",           { fg = purple })

-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`)
hi("ColorColumn",  { bg = var.shade1 })
hi("Conceal",      {})
hi("Cursor",       { fg = background })
hi("lCursor",      { fg = background })
hi("CursorIM",     {})
hi("CursorColumn", { bg = var.shade1 })

if vim.opt.diff:get() then
  hi("CursorLine", { gui = "underline" })
else
  hi("CursorLine", { bg = var.shade1 })
end

hi("Directory",  { fg = blue })
hi("DiffAdd",    { bg = green, fg = background })
hi("DiffChange", { fg = orange, gui = "underline" })
hi("DiffDelete", { bg = red, fg = background })
hi("DiffText",   { bg = orange, fg = background })

if hide_bufend then
    hi("EndOfBuffer", { fg = gutter })
end

hi("TermCursor",       { bg = blue })
hi("TermCursorNC",     { bg = comment })
hi("ErrorMsg",         { fg = red })
hi("WinSeparator",     { fg = winsep })
hi("Folded",           { fg = comment })
hi("FoldColumn",       {})
hi("SignColumn",       {})
hi("IncSearch",        { fg = yellow, bg = comment })
hi("Substitute",       { fg = background, bg = yellow })
hi("LineNr",           { fg = gutter })
hi("LineNrAbove",      {})
hi("LineNrBelow",      {})
hi("CursorLineNr",     { fg = var.shade4 })
hi("MatchParen",       { fg = blue, gui = "underline" })
hi("ModeMsg",          { fg = pink })
hi("MsgArea",          { fg = yellow })
hi("MsgSeparator",     { fg = purple })
hi("MoreMsg",          { fg = purple })
hi("NonText",          { fg = gutter })
hi("Normal",           { fg = foreground, bg = background })
hi("NormalFloat",      { fg = foreground, bg = var.shade1 })
hi("FloatBorder",      { fg = blue,       bg = var.shade1 })
hi("FloatTitle",       { fg = background, bg = purple })
hi("NormalNC",         {})
hi("Pmenu",            { fg = foreground, bg = menu })
hi("PmenuSel",         { fg = background, bg = blue })
hi("PmenuSbar",        { bg = menu })
hi("PmenuThumb",       { bg = selection })
hi("Question",         { fg = purple })
hi("QuickFixLine",     { fg = background, bg = yellow })
hi("Search",           { fg = background, bg = yellow })
hi("SpecialKey",       { fg = var.shade4 })
hi("SpellBad",         { fg = red, gui = "underline" })
hi("SpellCap",         { fg = orange })
hi("SpellLocal",       { fg = orange })
hi("SpellRare",        { fg = orange })
hi("StatusLine",       { fg = foreground, bg = background })
hi("StatusLineNC",     { fg = comment })
hi("TabLine",          { fg = comment })
hi("TabLineFill",      {})
hi("TabLineSel",       { fg = foreground })
hi("Title",            { fg = green })
hi("Visual",           { bg = selection })
hi("VisualNOS",        { bg = selection })
hi("WarningMsg",       { fg = yellow })
hi("Whitespace",       { fg = gutter })
hi("WildMenu",         { fg = background, bg = blue })

-- Diagnostic Groups (descriptions and ordering from `:h vim.diagnostic`)
hi("DiagnosticError",            { fg = red })
hi("DiagnosticWarn",             { fg = yellow })
hi("DiagnosticInfo",             { fg = blue })
hi("DiagnosticHint",             { fg = cyan })
hi("DiagnosticVirtualTextError", { fg = red,    bg = background  })
hi("DiagnosticVirtualTextWarn",  { fg = yellow, bg = background  })
hi("DiagnosticVirtualTextInfo",  { fg = blue,   bg = background  })
hi("DiagnosticVirtualTextHint",  { fg = cyan,   bg = background  })
hi("DiagnosticUnderlineError",   { fg = red,    gui = "underline" })
hi("DiagnosticUnderlineWarn",    { fg = yellow, gui = "underline" })
hi("DiagnosticUnderlineInfo",    { fg = blue,   gui = "underline" })
hi("DiagnosticUnderlineHint",    { fg = cyan,   gui = "underline", })
hi("DiagnosticFloatingError",    { fg = red })
hi("DiagnosticFloatingWarn",     { fg = yellow })
hi("DiagnosticFloatingInfo",     { fg = blue })
hi("DiagnosticFloatingHint",     { fg = cyan })
hi("DiagnosticSignError",        { fg = red })
hi("DiagnosticSignWarn",         { fg = yellow })
hi("DiagnosticSignInfo",         { fg = blue })
hi("DiagnosticSignHint",         { fg = cyan })

-- Must appear at the end of the file to work around this oddity:
-- https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
vim.o.background = "light"

-- Expose highlight function
return { hi = hi, colors = var }
