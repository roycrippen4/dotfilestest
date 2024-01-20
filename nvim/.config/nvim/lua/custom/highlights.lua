local M = {}

local cursorline = '#252931'
local sep_color = '#454951'
local black = { 'black', 0 }
local darkest_black = { 'black', -0.9 }
local d_yellow = { 'yellow', -20 }
local d_red = { 'red', -10 }
local green = { 'green', -10 }
local l_blue = '#00C5FF'
local orange = { 'orange', -10 }

-- stylua: ignore
M.add = {
  -- Commandline
  CmdlineEx              = { fg =  {'red', -15}, bg = darkest_black },
  CmdlineHelp            = { fg = '#53bf00',     bg = darkest_black },
  CmdlineLua             = { fg =  green,        bg = darkest_black },
  CmdlineSearch          = { fg = '#cc5e00',     bg = darkest_black },
  CmdlineSub             = { fg =  l_blue,       bg = darkest_black },
  CmdlineVisualSub       = { fg =  'pink',         bg = darkest_black },
  -- harpoon
  HarpoonWindow = { bg = darkest_black, },
  HarpoonBorder = { fg = d_red },
  HarpoonOpenMark = { fg = 'pink' },
  -- Noice
  NoiceVirtualTextOn     = { fg = '#53bf00',     bg = cursorline,    italic = true },
  -- NvimTree
  NvimTreeBookmark       = { fg = { "red",    -10 } },
  NvimTreeBookmarkHL     = { fg = { "red",    -10 } },
  NvimTreeOpenedFile     = { fg = { "yellow", -10 } },
  NvimTreeTitle          = { fg = { "yellow", -10 }, bg = "darker_black", sp = sep_color,  },
  NvimTreeTitleSepOff    = { fg = sep_color,         bg = "darker_black", sp = sep_color,   },
  NvimTreeTitleSepOn     = { fg = sep_color,         bg = "black",        sp = sep_color,  },
  -- Rainbow Delim
  RainbowDelimiterBlue   = { fg = 'blue'   },
  RainbowDelimiterCyan   = { fg = 'cyan'   },
  RainbowDelimiterGreen  = { fg = 'green'  },
  RainbowDelimiterOrange = { fg = 'orange' },
  RainbowDelimiterRed    = { fg = 'red'    },
  RainbowDelimiterViolet = { fg = 'purple' },
  RainbowDelimiterYellow = { fg = 'yellow' },
  -- Statusline
  St_Host                = { fg = { 'grey', -5 }, bg = darkest_black, italic = true },
  St_HostSep             = { fg = { 'grey', -5 }, bg = darkest_black, italic = true },
  St_Macro               = { fg = d_red,          bg = darkest_black },
  St_MacroA              = { fg = d_red,          bg = darkest_black },
  St_MacroB              = { fg = 'yellow',       bg = darkest_black },
  St_MacroSep            = { fg = d_red,          bg = darkest_black },
  St_MacroSepA           = { fg = d_red,          bg = darkest_black },
  St_MacroSepB           = { fg = 'yellow',       bg = darkest_black },
  St_Time                = { fg = '#cc5e00',      bg = darkest_black },
  St_gitAdd              = { fg = 'green',        bg = darkest_black },
  St_gitChange           = { fg = 'yellow',       bg = darkest_black },
  St_gitRemove           = { fg = 'red',          bg = darkest_black },
  St_lazygit             = { fg = green,          bg = darkest_black, italic = true },
  St_lazygit_icon        = { fg = green,          bg = darkest_black },
  St_lazygit_sep         = { fg = green,          bg = darkest_black },
  St_nvimtree            = { fg = l_blue,         bg = darkest_black, italic = true },
  St_nvimtree_icon       = { fg = l_blue,         bg = darkest_black },
  St_nvimtree_sep        = { fg = l_blue,         bg = darkest_black },
  St_toggleterm          = { fg = green,          bg = darkest_black, italic = true },
  St_toggleterm_icon     = { fg = 'green',        bg = darkest_black },
  St_toggleterm_sep      = { fg = green,          bg = darkest_black },
  St_trouble             = { fg = d_red,          bg = darkest_black, italic = true, bold = true },
  St_trouble_icon        = { fg = d_red,          bg = darkest_black },
  St_trouble_sep         = { fg = d_red,          bg = darkest_black },
  St_unix                = { fg = '#00EE6e',      bg = darkest_black },
  TbLineMarkedBufOff     = { fg = { 'grey',     0 }, bg = 'darker_black', sp = sep_color },
  TbLineMarkedBufOn      = { fg = { 'blue',   -20 }, bg = 'black' },
  TbLineUnmarkedBufOff   = { fg = { 'grey',     0 }, bg = 'darker_black', sp = sep_color},
  TbLineUnmarkedBufOn    = { fg = { 'blue',   -20 }, bg = 'black' },
  WinBar                 = { fg = "red", bg = black },
  WinBarNC               = { fg = black, bg = black },

  FloatTitle           = { fg = '#1e222a', bg = l_blue, bold = true, italic = true },
  Title                = { fg = '#1e222a', bg = l_blue, bold = true, italic = true },
  NormalFloat          = { bg = 'black' },
  RenamerTitle         = { fg = '#1e222a', bg = l_blue, bold = true, italic = true },

  -- Treesitter
    ['@annotation']            = { fg = 'yellow' },
    ['@attribute']             = { fg = 'cyan' },
    ['@boolean']               = { fg = 'purple' },
    ['@character']             = { fg = 'green' },
    ['@conditional']           = { fg = 'pink' },
    ['@constant']              = { fg = 'purple' },
    ['@constant.builtin']      = { fg = 'purple' },
    ['@constant.macro']        = { fg = 'cyan' },
    ['@constructor']           = { fg = 'cyan' },
    ['@error']                 = { fg = { 'red', 10 } },
    ['@exception']             = { fg = 'purple' },
    ['@field']                 = { fg = 'orange' },
    ['@float']                 = { fg = 'green' },
    ['@function']              = { fg = { 'red', 10 } },
    ['@function.builtin']      = { fg = 'cyan' },
    ['@function.macro']        = { fg = 'green' },
    ['@include']               = { fg = 'pink' },
    ['@keyword']               = { fg = 'pink' },
    ['@keyword.function']      = { fg = 'cyan' },
    ['@keyword.function.ruby'] = { fg = 'pink' },
    ['@keyword.operator']      = { fg = 'pink' },
    ['@label']                 = { fg = 'cyan' },
    ['@method']                = { fg = 'green' },
    ['@namespace']             = { fg = 'orange' },
    ['@number']                = { fg = 'purple' },
    ['@operator']              = { fg = 'white' },
    ['@parameter']             = { fg = 'orange' },
    ['@parameter.reference']   = { fg = 'orange' },
    ['@property']              = { fg = 'purple' },
    ['@punctuation.bracket']   = { fg = 'purple' },
    ['@punctuation.delimiter'] = { fg = 'white' },
    ['@punctuation.special']   = { fg = 'cyan' },
    ['@repeat']                = { fg = 'pink' },
    ['@string']                = { fg = { 'green', -10 } },
    ['@string.escape']         = { fg = 'cyan' },
    ['@string.regex']          = { fg = 'red' },
    ['@structure']             = { fg = 'purple' },
    ['@symbol']                = { fg = 'purple' },
    ['@tag']                   = { fg = 'cyan' },
    ['@tag.attribute']         = { fg = 'green' },
    ['@tag.delimiter']         = { fg = 'cyan' },
    ['@text']                  = { fg = orange },
    ['@text.emphasis']         = { fg = 'yellow', italic = true },
    ['@text.literal']          = { fg = 'yellow' },
    ['@text.reference']        = { fg = orange, bold = true },
    ['@text.strong']           = { fg = orange, bold = true },
    ['@text.title']            = { fg = 'pink', bold = true },
    ['@text.underline']        = { fg = orange },
    ['@text.uri']              = { fg = 'yellow', italic = true },
    ['@type']                  = { fg = { 'cyan', 10 } },
    ['@type.builtin']          = { fg = 'cyan', italic = true },
    ['@type.qualifier']        = { fg = 'pink' },
    ['@variable']              = { fg = 'white'},
    ['@variable.member']       = { fg = 'red'},
    ['@variable.builtin']      = { fg = 'purple' },
}

-- stylua: ignore
M.override = {
  CmpPmenu             = { bg = 'black' },
  Comment = { italic = true },
  FloatBorder          = { fg = l_blue, bg = 'black' },
  NvimTreeWinSeparator = { fg = black,          bg = 'black' },
  -- Statusline
  St_CommandMode      = { fg = d_red,            bg = darkest_black },
  St_CommandModeSep   = { fg = d_red,            bg = darkest_black },
  St_ConfirmMode      = { fg = d_red,            bg = darkest_black },
  St_ConfirmModeSep   = { fg = d_red ,           bg = darkest_black },
  St_EmptySpace       = { fg = '#00C5FF',        bg = darkest_black },
  St_EmptySpace2      = { fg = darkest_black,    bg = darkest_black },
  St_InsertMode       = { fg = d_yellow,         bg = darkest_black },
  St_InsertModeSep    = { fg = d_yellow,         bg = darkest_black },
  St_LspHints         = { bg = darkest_black },
  St_LspInfo          = { bg = darkest_black },
  St_LspStatus        = { fg = '#53bf00',        bg = darkest_black },
  St_NTerminalMode    = { fg = green,            bg = darkest_black },
  St_NTerminalModeSep = { fg = green,            bg = darkest_black },
  St_NormalMode       = { fg = l_blue,           bg = darkest_black },
  St_NormalModeSep    = { fg = l_blue,           bg = darkest_black },
  St_ReplaceMode      = { fg = orange,           bg = darkest_black },
  St_ReplaceModeSep   = { fg = orange,           bg = darkest_black },
  St_SelectMode       = { fg = 'pink',             bg = darkest_black },
  St_SelectModeSep    = { fg = 'pink',             bg = darkest_black },
  St_TerminalMode     = { fg = green,            bg = darkest_black },
  St_TerminalModeSep  = { fg = green,            bg = darkest_black },
  St_VisualMode       = { fg = 'pink',             bg = darkest_black },
  St_VisualModeSep    = { fg = 'pink',             bg = darkest_black },
  St_cwd_sep          = { fg = { 'red',   -15 }, bg = darkest_black },
  St_file_info        = { fg = { 'white', -10 }, bg = darkest_black },
  St_file_sep         = { fg = { 'grey',   10 }, bg = darkest_black, bold = true },
  St_gitIcons         = { fg = { 'white', -10 }, bg = darkest_black, italic = true, bold = false },
  St_lspError         = { bg = darkest_black },
  St_lspWarning       = { bg = darkest_black },
  St_pos_sep          = { fg = '#d6a000',        bg = darkest_black, bold = false },
  St_pos_text         = { fg = '#d6a000',        bg = darkest_black, bold = false },
  -- Tabline
  TbLineBufOff         = { fg = 'grey', bg = 'darker_black', sp = sep_color,  },
  TbLineBufOffClose    = { bg = 'darker_black',              sp = sep_color,  },
  TbLineBufOffModified = { bg = 'darker_black',              sp = sep_color,  },
  TbLineBufOn          = { fg = d_yellow },
  TblineFill           = { bg = 'darker_black',              sp = sep_color,  },
  WinSeparator         = { fg = 'yellow',       bg = 'black' },
}

return M
