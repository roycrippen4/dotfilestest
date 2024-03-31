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
return {
  add = {
    Added                     = { fg = 'green' },
    Changed                   = { fg = l_blue },
    CmdlineEx                 = { fg =  {'red', -15}, bg = darkest_black },
    CmdlineHelp               = { fg = '#53bf00',     bg = darkest_black },
    CmdlineLua                = { fg =  green,        bg = darkest_black },
    CmdlineSearch             = { fg = '#cc5e00',     bg = darkest_black },
    CmdlineSub                = { fg =  l_blue,       bg = darkest_black },
    CmdlineVisualSub          = { fg =  'pink',       bg = darkest_black },
    DiagnosticUnderlineError  = { sp = 'red', undercurl = true },
    DiagnosticUnderlineHint   = { sp = 'blue', undercurl = true },
    DiagnosticUnderlineInfo   = { sp = 'green', undercurl = true },
    DiagnosticUnderlineWarn   = { sp = 'orange', undercurl = true },
    -- DiagnosticWarn            = { bg = darkest_black },
    DressingBorder            = { fg = 'red', bg = nil },
    DressingNormal            = { bg = 'black' },
    DressingTitle             = { fg = 'black', bg = 'red', italic = true, bold = true },
    HarpoonBorder             = { fg = 'blue', bg = 'black' },
    HarpoonOpenMark           = { fg = 'pink' },
    HarpoonTitle              = { fg = 'black', bg = 'blue', italic = true },
    HarpoonWindow             = { bg = 'black', },
    LineNumber                = { fg = 'white' },
    NoiceVirtualTextOn        = { fg = '#53bf00',     bg = cursorline,    italic = true },
    NormalFloat               = { bg = 'black' },
    NvimTreeBookmark          = { fg = { "red",    -10 } },
    NvimTreeBookmarkHL        = { fg = { "red",    -10 } },
    NvimTreeExecFile          = { fg = 'green' },
    NvimTreeImageFile         = { fg = 'purple' },
    NvimTreeOpenedFile        = { fg = { "yellow", -10 } },
    NvimTreeSymlink           = { fg = 'cyan' },
    NvimTreeSymlinkFolderName = { fg = { 'blue', -15 } },
    NvimTreeTitle             = { fg = { "yellow", -10 }, bg = darkest_black, sp = sep_color,  },
    RainbowDelimiterBlue      = { fg = 'blue'   },
    RainbowDelimiterCyan      = { fg = 'cyan'   },
    RainbowDelimiterGreen     = { fg = 'green'  },
    RainbowDelimiterOrange    = { fg = 'orange' },
    RainbowDelimiterRed       = { fg = 'red'    },
    RainbowDelimiterViolet    = { fg = 'purple' },
    RainbowDelimiterYellow    = { fg = 'yellow' },
    Removed                   = { fg = 'red' },
    RenamerTitle              = { fg = '#1e222a', bg = l_blue, bold = true, italic = true },
    St_CommandMode            = { fg = d_red,            bg = darkest_black },
    St_CommandModeSep         = { fg = d_red,            bg = darkest_black },
    St_ConfirmMode            = { fg = d_red,            bg = darkest_black },
    St_ConfirmModeSep         = { fg = d_red ,           bg = darkest_black },
    St_CwdSep                 = { fg = { 'red',   -15 }, bg = darkest_black },
    St_EmptySpace             = { fg = '#00C5FF',        bg = darkest_black },
    St_EmptySpace2            = { fg = darkest_black,    bg = darkest_black },
    St_FileInfo               = { fg = 'white',          bg = darkest_black },
    St_FileSep                = { fg = { 'grey',   10 }, bg = darkest_black, bold = true },
    St_GitAdd                 = { fg = 'green',          bg = darkest_black },
    St_GitBranch              = { fg = green, bg = darkest_black, italic = true },
    St_GitChange              = { fg = 'yellow',         bg = darkest_black },
    St_GitRemove              = { fg = 'red',            bg = darkest_black },
    St_Host                   = { fg = { 'grey', -5 },   bg = darkest_black, italic = true },
    St_HostSep                = { fg = { 'grey', -5 },   bg = darkest_black, italic = true },
    St_InsertMode             = { fg = d_yellow,         bg = darkest_black },
    St_InsertModeSep          = { fg = d_yellow,         bg = darkest_black },
    St_Lazy                   = { fg = { 'blue', -30 },  bg = darkest_black, bold = true },
    St_Lazygit                = { fg = green,            bg = darkest_black, italic = true },
    St_LspHints               = {                        bg = darkest_black },
    St_LspInfo                = { fg = 'blue',           bg = darkest_black },
    St_LspStatus              = { fg = '#53bf00',        bg = darkest_black },
    St_LspWarning             = { fg = '#E7C787',        bg = darkest_black },
    St_Lsp_Error              = { fg = d_red,            bg = darkest_black },
    St_Macro                  = { fg = d_red,            bg = darkest_black },
    St_MacroA                 = { fg = d_red,            bg = darkest_black },
    St_MacroB                 = { fg = 'yellow',         bg = darkest_black },
    St_MacroSep               = { fg = d_red,            bg = darkest_black },
    St_MacroSepA              = { fg = d_red,            bg = darkest_black },
    St_MacroSepB              = { fg = 'yellow',         bg = darkest_black },
    St_Mason                  = { fg = 'yellow',         bg = darkest_black },
    St_NTerminalMode          = { fg = green,            bg = darkest_black },
    St_NTerminalModeSep       = { fg = green,            bg = darkest_black },
    St_NormalMode             = { fg = l_blue,           bg = darkest_black },
    St_NormalModeSep          = { fg = l_blue,           bg = darkest_black },
    St_NvimTree               = { fg = l_blue,           bg = darkest_black, italic = true },
    St_PosSep                 = { fg = '#d6a000',        bg = darkest_black, bold = false },
    St_PosText                = { fg = '#d6a000',        bg = darkest_black, bold = false },
    St_ReplaceMode            = { fg = orange,           bg = darkest_black },
    St_ReplaceModeSep         = { fg = orange,           bg = darkest_black },
    St_SelectMode             = { fg = 'pink',           bg = darkest_black },
    St_SelectModeSep          = { fg = 'pink',           bg = darkest_black },
    St_TerminalMode           = { fg = green,            bg = darkest_black },
    St_TerminalModeSep        = { fg = green,            bg = darkest_black },
    St_Time                   = { fg = '#cc5e00',        bg = darkest_black },
    St_Trouble                = { fg = d_red,            bg = darkest_black, italic = true, bold = true },
    St_VisualMode             = { fg = 'pink',           bg = darkest_black },
    St_VisualModeSep          = { fg = 'pink',           bg = darkest_black },
    TbLineBufOff              = { fg = 'grey', bg = 'darker_black' },
    TbLineBufOffClose         = { fg = 'grey', bg = 'darker_black'  },
    TbLineBufOffModified      = { fg = 'red', bg = 'darker_black'  },
    TbLineBufOn               = { fg = d_yellow },
    TbLineBufOnClose          = { fg = 'red' },
    TbLineBufOnModified       = { fg = 'green', bg = 'black'  },
    TbLineMarkedBufOff        = { fg = { 'grey',     0 }, bg = 'darker_black' },
    TbLineMarkedBufOn         = { fg = { 'blue',   -20 }, bg = 'black' },
    TbLineUnmarkedBufOff      = { fg = { 'grey',     0 }, bg = 'darker_black' },
    TbLineUnmarkedBufOn       = { fg = { 'blue',   -20 }, bg = 'black' },
    TblineFill                = { bg = 'darker_black'  },
    WinBar                    = { fg = "red", bg = black },
    WinBarNC                  = { fg = black, bg = black },

    ['@string.special.url.comment'] = { fg = 'light_gray', underline = true },
    ['@constant']         = { fg = { 'red', -2 } },
    ['@keyword.operator'] = { fg = 'pink', italic = true },
    ['@operator']         = { fg = 'pink' },
    ['@type']             = { fg = 'cyan' },
    ['@type.argument']    = { italic = true },
    ['@variable']         = { fg = 'white' },
    ['@variable.member']  = { fg = { 'red', -2 } },

    ['@css.classname']    = { fg = 'sun', italic = true },
    ['@css.plain_value']  = { fg = 'white'  },
    ['@css.id_name']      = { fg = 'purple' },
    ['@bash.path']        = { fg = d_yellow, italic = true },
    ['@bash.flag.single'] = { fg = 'sun'  },
    ['@bash.flag.double'] = { fg = 'sun', italic = true  },
    ['@sxhkdrc.keysym']   = { fg = 'pink' }
  },

  -- stylua: ignore
  override = {
    CmpPmenu              = { bg = 'black' },
    Comment               = { italic = true },
    FloatBorder           = { fg = l_blue, bg = 'black' },
    FoldColumn            = { bg = 'black' },
    LspSignatureActiveParameter = { fg = "blue", bg = 'black', italic = true },
    Search                = { fg = '#AAAAAA', bg = '#475a97' },
    TelescopeBorder       = { fg = { 'black', -3 },  bg = { 'black', -3 }  },
    TelescopeNormal       = { bg = { 'black', -3 }  },
    TelescopeResultsTitle = { link = 'TelescopeBorder' },
  }
}
