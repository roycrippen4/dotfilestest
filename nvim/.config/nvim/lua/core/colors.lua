local colors = {
  baby_pink = '#DE8C92',
  black = '#1e222a',
  black2 = '#252931',
  black3 = '#21252b',
  blue = '#61afef',
  cyan = '#a3b8ef',
  dark_blue = '#2490e9',
  dark_green = '#87b963',
  dark_orange = '#fb7a85',
  dark_purple = '#c882e7',
  dark_red = '#da515b',
  dark_yellow = '#dbab4a',
  darker_black = '#1b1f27',
  darker_blue = '#167fd6',
  folder_bg = '#61afef',
  green = '#98c379',
  grey = '#42464e',
  grey_fg = '#565c64',
  grey_fg2 = '#6f737b',
  light_blue = '#00C5FF',
  light_grey = '#6f737b',
  lightbg = '#2d3139',
  line = '#31353d',
  nord_blue = '#81A1C1',
  one_bg = '#282c34',
  one_bg2 = '#353b45',
  one_bg3 = '#373b43',
  orange = '#fca2aa',
  pink = '#ff75a0',
  pmenu_bg = '#61afef',
  purple = '#de98fd',
  red = '#e06c75',
  sep = '#454951',
  statusline_bg = '#22262e',
  sun = '#EBCB8B',
  teal = '#519ABA',
  vibrant_green = '#7eca9c',
  white = '#abb2bf',
  yellow = '#e7c787',
}

---@type table<string, vim.api.keyset.highlight>
local groups = {
  Added = { fg = colors.green },
  Changed = { fg = colors.light_blue },
  CmpPmenu = { bg = colors.black },
  CmpSel = { link = 'PmenuSel', bold = true },
  DapBreakpoint = { fg = colors.red },
  DapBreakpointCondition = { fg = colors.dark_orange },
  DapLogPoint = { fg = colors.dark_yellow },
  DapStopped = { fg = colors.dark_green },
  DapBreakpointRejected = { fg = colors.dark_red },
  DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
  DiagnosticUnderlineHint = { sp = colors.light_blue, undercurl = true },
  DiagnosticUnderlineInfo = { sp = colors.green, undercurl = true },
  DiagnosticUnderlineWarn = { sp = colors.orange, undercurl = true },
  DressingBorder = { fg = colors.red, bg = nil },
  DressingNormal = { bg = colors.one_bg },
  DressingTitle = { fg = colors.black, bg = colors.red, italic = true, bold = true },
  FloatBorder = { fg = colors.light_blue, bg = colors.one_bg },
  FoldColumn = { fg = colors.light_blue, bg = colors.one_bg },
  HarpoonBorder = { fg = colors.blue, bg = colors.one_bg },
  HarpoonOpenMark = { fg = colors.pink },
  HarpoonTitle = { fg = colors.one_bg, bg = colors.blue, italic = true },
  HarpoonWindow = { bg = colors.one_bg },
  LazyNormal = { bg = colors.black },
  LazyProp = { fg = colors.sun, bg = colors.black },
  LspSignatureActiveParameter = { underline = true, sp = colors.blue },
  MasonNormal = { bg = colors.black },
  NoCursor = { blend = 100, nocombine = true },
  NoiceVirtualTextOn = { fg = '#53bf00', italic = true },
  NormalFloat = { bg = colors.one_bg },
  NvimTreeBookmark = { fg = colors.red },
  NvimTreeBookmarkHL = { fg = colors.red },
  NvimTreeCopiedHL = { sp = colors.yellow, underline = true },
  NvimTreeCutHL = { sp = colors.red, underline = true },
  NvimTreeExecFile = { fg = colors.green },
  NvimTreeImageFile = { fg = colors.purple },
  NvimTreeIndentMarker = { fg = colors.grey },
  NvimTreeOpenedFile = { fg = colors.yellow },
  NvimTreeSymlink = { fg = colors.cyan },
  NvimTreeSymlinkFolderName = { fg = colors.blue },
  NvimTreeTitle = { fg = colors.yellow, bg = colors.black, sp = colors.sep, underline = true },
  RainbowDelimiterBlue = { fg = colors.blue },
  RainbowDelimiterCyan = { fg = colors.cyan },
  RainbowDelimiterGreen = { fg = colors.green },
  RainbowDelimiterOrange = { fg = colors.orange },
  RainbowDelimiterRed = { fg = colors.red },
  RainbowDelimiterViolet = { fg = colors.purple },
  RainbowDelimiterYellow = { fg = colors.yellow },
  Removed = { fg = colors.red },
  Search = { fg = '#AAAAAA', bg = '#475a97' },
  St_CommandMode = { fg = colors.dark_red, bg = colors.black3 },
  St_CommandModeSep = { fg = colors.dark_red, bg = colors.black3 },
  St_ConfirmMode = { fg = colors.dark_red, bg = colors.black3 },
  St_ConfirmModeSep = { fg = colors.dark_red, bg = colors.black3 },
  St_CwdSep = { fg = colors.dark_red, bg = colors.black3 },
  St_EmptySpace = { fg = '#00C5FF', bg = colors.black3 },
  StatusLine = { bg = colors.black3 },
  StatusLineNC = { bg = colors.black3 },
  St_EmptySpace2 = { fg = colors.darker_black, bg = colors.darker_black },
  St_FileInfo = { fg = colors.white, bg = colors.black3 },
  St_FileSep = { fg = colors.light_grey, bg = colors.black3, bold = true },
  St_Fish = { fg = colors.purple, bg = colors.black3 },
  St_GitAdd = { fg = colors.green, bg = colors.black3 },
  St_GitBranch = { fg = colors.dark_green, bg = colors.black3, italic = true },
  St_GitChange = { fg = colors.yellow, bg = colors.black3 },
  St_GitRemove = { fg = colors.red, bg = colors.black3 },
  St_Host = { fg = colors.grey, bg = colors.black3, italic = true },
  St_HostSep = { fg = colors.grey, bg = colors.black3, italic = true },
  St_InsertMode = { fg = colors.dark_yellow, bg = colors.black3 },
  St_InsertModeSep = { fg = colors.dark_yellow, bg = colors.black3 },
  St_Lazy = { fg = colors.darker_blue, bg = colors.black3, bold = true },
  St_Lazygit = { fg = colors.dark_green, bg = colors.black3, italic = true },
  St_LspHints = { bg = colors.black3 },
  St_LspInfo = { fg = colors.blue, bg = colors.black3 },
  St_LspStatus = { fg = '#53bf00', bg = colors.black3 },
  St_LspWarning = { fg = '#E7C787', bg = colors.black3 },
  St_Lsp_Error = { fg = colors.dark_red, bg = colors.black3 },
  St_Macro = { fg = colors.dark_red, bg = colors.black3 },
  St_MacroA = { fg = colors.dark_red, bg = colors.black3 },
  St_MacroB = { fg = colors.yellow, bg = colors.black3 },
  St_MacroSep = { fg = colors.dark_red, bg = colors.black3 },
  St_MacroSepA = { fg = colors.dark_red, bg = colors.black3 },
  St_MacroSepB = { fg = colors.yellow, bg = colors.black3 },
  St_Mason = { fg = colors.yellow, bg = colors.black3 },
  St_NTerminalMode = { fg = colors.dark_green, bg = colors.black3 },
  St_NTerminalModeSep = { fg = colors.dark_green, bg = colors.black3 },
  St_NormalMode = { fg = colors.light_blue, bg = colors.black3 },
  St_NormalModeSep = { fg = colors.light_blue, bg = colors.black3 },
  St_NvimTree = { fg = colors.light_blue, bg = colors.black3, italic = true },
  St_PosSep = { fg = '#d6a000', bg = colors.black3, bold = false },
  St_PosText = { fg = '#d6a000', bg = colors.black3, bold = false },
  St_ReplaceMode = { fg = colors.dark_orange, bg = colors.black3 },
  St_ReplaceModeSep = { fg = colors.dark_orange, bg = colors.black3 },
  St_SelectMode = { fg = colors.pink, bg = colors.black3 },
  St_SelectModeSep = { fg = colors.pink, bg = colors.black3 },
  St_Spin = { fg = colors.pink, bg = colors.black3 },
  St_TerminalMode = { fg = colors.dark_green, bg = colors.black3 },
  St_TerminalModeSep = { fg = colors.dark_green, bg = colors.black3 },
  St_Time = { fg = '#cc5e00', bg = colors.black3 },
  St_Trouble = { fg = colors.dark_red, bg = colors.black3, italic = true, bold = true },
  St_VisualMode = { fg = colors.pink, bg = colors.black3 },
  St_VisualModeSep = { fg = colors.pink, bg = colors.black3 },
  TbLineBufOff = { fg = colors.grey, bg = colors.black3 },
  TbLineBufOffClose = { fg = colors.grey, bg = colors.black3 },
  TbLineBufOffModified = { fg = colors.red, bg = colors.black3 },
  TbLineBufOn = { fg = colors.yellow },
  TbLineBufOnClose = { fg = colors.red },
  TbLineBufOnModified = { fg = colors.green, bg = colors.one_bg },
  TbLineMarkedBufOff = { fg = colors.grey, bg = colors.black3 },
  TbLineMarkedBufOn = { fg = colors.dark_blue, bg = colors.one_bg },
  TblineFill = { bg = colors.black3 },
  TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
  TelescopeMatching = { fg = colors.blue, bg = colors.one_bg },
  TelescopeNormal = { bg = colors.darker_black },
  TelescopePreviewBorder = { fg = colors.darker_black, bg = colors.darker_black },
  TelescopePreviewTitle = { fg = colors.black, bg = colors.green },
  TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
  TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
  TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
  TelescopePromptTitle = { fg = colors.black, bg = colors.red },
  TelescopeResultsBorder = { fg = colors.darker_black, bg = colors.darker_black },
  TelescopeResultsDiffAdd = { fg = colors.green },
  TelescopeResultsDiffChange = { fg = colors.yellow },
  TelescopeResultsDiffDelete = { fg = colors.red },
  TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.darker_black },
  TelescopeSelection = { bg = colors.black2, fg = colors.white },
  Terminal = { bg = colors.darker_black },
  TroubleNormal = { bg = colors.darker_black },
  TroubleNormalNC = { bg = colors.darker_black },

  ['@type.type_argument'] = { italic = true },
  ['@lsp.type.class.svelte'] = {},
}

for group, color in pairs(groups) do
  vim.api.nvim_set_hl(0, group, color)
end

return colors
