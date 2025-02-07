local colors = require('plugins.colorscheme.palette')

local treesitter = {
  ['@boolean.zig'] = { link = '@boolean' },
  ['@fix_error_union_type.zig'] = { link = '@function' },
  ['@test.zig'] = { fg = colors.sun },
  ['@type.argument.rust'] = { italic = true },
  ['@type.type_argument'] = { italic = true },
  ['@variable.std.zig'] = { link = '@lsp.type.namespace.zig' },
  ['@annotation'] = { fg = colors.fg },
  ['@attribute'] = { fg = colors.cyan },
  ['@attribute.typescript'] = { fg = colors.blue },
  ['@boolean'] = { fg = colors.orange },
  ['@character'] = { fg = colors.orange },
  ['@kitty.color'] = { fg = colors.green },
  ['@comment.todo'] = { fg = colors.red },
  ['@comment.todo.unchecked'] = { fg = colors.red },
  ['@comment.todo.checked'] = { fg = colors.green },
  ['@constant'] = { fg = colors.orange },
  ['@constant.builtin'] = { fg = colors.orange },
  ['@constant.macro'] = { fg = colors.orange },
  ['@constructor'] = { fg = colors.yellow, bold = true },
  ['@error'] = colors.fg,
  ['@function'] = { fg = colors.blue },
  ['@function.builtin'] = { fg = colors.cyan },
  ['@function.macro'] = { fg = colors.cyan },
  ['@function.method'] = { fg = colors.blue },
  ['@keyword'] = { fg = colors.purple },
  ['@keyword.conditional'] = { fg = colors.purple },
  ['@keyword.directive'] = { fg = colors.purple },
  ['@keyword.exception'] = { fg = colors.purple },
  ['@keyword.function'] = { fg = colors.purple },
  ['@keyword.import'] = { fg = colors.purple },
  ['@keyword.operator'] = { fg = colors.purple },
  ['@keyword.repeat'] = { fg = colors.purple },
  ['@label'] = { fg = colors.red },
  ['@markup.emphasis'] = { fg = colors.fg, italic = true },
  ['@markup.environment'] = colors.fg,
  ['@markup.environment.name'] = colors.fg,
  ['@markup.heading'] = { fg = colors.orange, bold = true },
  ['@markup.link'] = { fg = colors.blue },
  ['@markup.link.url'] = { fg = colors.cyan, underline = true },
  ['@markup.list'] = { fg = colors.red },
  ['@markup.math'] = { fg = colors.fg },
  ['@markup.raw'] = { fg = colors.green },
  ['@markup.strike'] = { fg = colors.fg, strikethrough = true },
  ['@markup.strong'] = { fg = colors.fg, bold = true },
  ['@markup.underline'] = { fg = colors.fg, underline = true },
  ['@module'] = { fg = colors.yellow },
  ['@none'] = { fg = colors.fg },
  ['@number'] = { fg = colors.orange },
  ['@number.float'] = { fg = colors.orange },
  ['@operator'] = { fg = colors.fg },
  ['@parameter.reference'] = { fg = colors.fg },
  ['@property'] = { fg = colors.cyan },
  ['@punctuation.delimiter'] = { fg = colors.lightgrey },
  ['@punctuation.bracket'] = { fg = colors.lightgrey },
  ['@string'] = { fg = colors.green },
  ['@string.regexp'] = { fg = colors.orange },
  ['@string.escape'] = { fg = colors.red },
  ['@string.special.symbol'] = { fg = colors.cyan },
  ['@tag'] = { fg = colors.purple },
  ['@tag.attribute'] = { fg = colors.yellow },
  ['@tag.delimiter'] = { fg = colors.purple },
  ['@text'] = { fg = colors.white },
  ['@note'] = { fg = colors.white },
  ['@warning'] = { fg = colors.white },
  ['@danger'] = { fg = colors.white },
  ['@type'] = { fg = colors.yellow },
  ['@type.builtin'] = { fg = colors.orange },
  ['@variable'] = { fg = colors.white },
  ['@variable.builtin'] = { fg = colors.red },
  ['@variable.member'] = { fg = colors.cyan },
  ['@variable.parameter'] = { fg = colors.red },
  ['@markup.heading.1.markdown'] = { fg = colors.red, bold = true },
  ['@markup.heading.2.markdown'] = { fg = colors.purple, bold = true },
  ['@markup.heading.3.markdown'] = { fg = colors.orange, bold = true },
  ['@markup.heading.4.markdown'] = { fg = colors.red, bold = true },
  ['@markup.heading.5.markdown'] = { fg = colors.purple, bold = true },
  ['@markup.heading.6.markdown'] = { fg = colors.orange, bold = true },
  ['@markup.heading.1.marker.markdown'] = { fg = colors.red, bold = true },
  ['@markup.heading.2.marker.markdown'] = { fg = colors.purple, bold = true },
  ['@markup.heading.3.marker.markdown'] = { fg = colors.orange, bold = true },
  ['@markup.heading.4.marker.markdown'] = { fg = colors.red, bold = true },
  ['@markup.heading.5.marker.markdown'] = { fg = colors.purple, bold = true },
  ['@markup.heading.6.marker.markdown'] = { fg = colors.orange, bold = true },
}

---@module "onedark"
---@type LazyPluginSpec
return {
  'roycrippen4/onedark',
  priority = 1500,
  ---@type ThemeGroups
  opts = {
    treesitter = treesitter,

    common = {
      Added = { fg = colors.green },
      Changed = { fg = colors.blue_light },
      ColorColumn = { bg = colors.bg1 },
      Conceal = { fg = colors.grey, bg = colors.bg1 },
      CurSearch = { fg = colors.one_bg, bg = colors.orange },
      Cursor = { reverse = true },
      CursorColumn = { bg = colors.bg1 },
      CursorIM = { reverse = true },
      CursorLine = { bg = colors.bg1 },
      CursorLineNr = { fg = colors.white },
      Debug = { fg = colors.yellow },
      DiffAdd = { fg = colors.none, bg = colors.diff_add },
      DiffAdded = { fg = colors.green },
      DiffChange = { fg = colors.none, bg = colors.diff_change },
      DiffChanged = { fg = colors.blue },
      DiffDelete = { fg = colors.none, bg = colors.diff_delete },
      DiffDeleted = { fg = colors.red },
      DiffFile = { fg = colors.cyan },
      DiffIndexLine = { fg = colors.grey },
      DiffRemoved = { fg = colors.red },
      DiffText = { fg = colors.none, bg = colors.diff_text },
      Directory = { fg = colors.blue },
      ErrorMsg = { fg = colors.red, bold = true },
      FloatBorder = { fg = colors.blue_light, bg = colors.one_bg },
      FoldColumn = { fg = colors.blue_light, bg = colors.one_bg },
      IncSearch = { fg = colors.one_bg, bg = colors.orange },
      LineNr = { fg = colors.grey },
      MatchParen = { fg = colors.none, bg = colors.grey },
      MoreMsg = { fg = colors.blue, bold = true },
      MsgArea = { bg = colors.black3 },
      NonText = { fg = colors.grey },
      Normal = { bg = colors.one_bg },
      NormalFloat = { bg = colors.one_bg },
      Pmenu = { fg = colors.white, bg = colors.bg1 },
      PmenuSbar = { fg = colors.none, bg = colors.bg1 },
      PmenuThumb = { fg = colors.none, bg = colors.grey },
      Question = { fg = colors.yellow },
      QuickFixLine = { fg = colors.blue, underline = true },
      Removed = { fg = colors.red },
      Search = { fg = '#AAAAAA', bg = '#475a97' },
      SpecialKey = { fg = colors.grey },
      SpellBad = { fg = colors.none, undercurl = true, sp = colors.red },
      SpellCap = { fg = colors.none, undercurl = true, sp = colors.yellow },
      SpellLocal = { fg = colors.none, undercurl = true, sp = colors.blue },
      SpellRare = { fg = colors.none, undercurl = true, sp = colors.purple },
      StatusLine = { fg = colors.white, bg = colors.bg2 },
      StatusLineNC = { fg = colors.grey, bg = colors.bg1 },
      StatusLineTerm = { fg = colors.white, bg = colors.bg2 },
      StatusLineTermNC = { fg = colors.grey, bg = colors.bg1 },
      Substitute = { fg = colors.one_bg, bg = colors.green },
      Terminal = { bg = colors.black_darker },
      ToolbarButton = { fg = colors.one_bg, bg = colors.bg_blue },
      ToolbarLine = { fg = colors.white },
      Visual = { bg = colors.bg3 },
      VisualNOS = { fg = colors.none, bg = colors.bg2, underline = true },
      WarningMsg = { fg = colors.yellow, bold = true },
      Whitespace = { fg = colors.grey },
      WildMenu = { fg = colors.one_bg, bg = colors.blue },
      WinSeparator = { fg = colors.bg3 },
      debugBreakpoint = { fg = colors.one_bg, bg = colors.red },
      debugPC = { fg = colors.one_bg, bg = colors.green },
      helpCommand = { link = '@function' },
      iCursor = { reverse = true },
      lCursor = { reverse = true },
      vCursor = { reverse = true },
    },

    blink = {
      BlinkCmpDocBorder = { link = 'FloatBorder' },
      BlinkCmpKind = { link = 'Special' },
      BlinkCmpKindClass = { link = '@type.builtin' },
      BlinkCmpKindEnum = { link = '@lsp.type.enum' },
      BlinkCmpKindEnumMember = { link = '@lsp.type.enumMember' },
      BlinkCmpKindEvent = { link = '@lsp.type.event' },
      BlinkCmpKindField = { link = '@property' },
      BlinkCmpKindFunction = { link = '@function.call' },
      BlinkCmpKindInterface = { link = '@lsp.type.struct' },
      BlinkCmpKindKeyword = { link = '@keyword' },
      BlinkCmpKindSnippet = { fg = colors.red },
      BlinkCmpKindStruct = { link = '@lsp.type.struct' },
      BlinkCmpKindText = { link = '@text.literal' },
      BlinkCmpLabel = { fg = colors.white },
      BlinkCmpLabelMatch = { fg = colors.blue },
      BlinkCmpMenu = { link = 'NormalFloat' },
      BlinkCmpMenuBorder = { link = 'FloatBorder' },
      BlinkCmpMenuSelection = { link = 'CursorLine' },
      BlinkCmpSignatureHelpBorder = { link = 'FloatBorder' },
      BlinkCmpSource = { fg = colors.grey_light },
    },

    syntax = {
      Delimiter = { fg = colors.grey_light },
      Character = { fg = colors.orange },
      Number = { fg = colors.orange },
      Float = { fg = colors.orange },
      Boolean = { fg = colors.orange },
      Type = { fg = colors.yellow },
      Structure = { fg = colors.yellow },
      StorageClass = { fg = colors.yellow },
      Typedef = { fg = colors.yellow },
      Identifier = { fg = colors.red },
      Constant = { fg = colors.cyan },
      PreProc = { fg = colors.purple },
      PreCondit = { fg = colors.purple },
      Include = { fg = colors.purple },
      Keyword = { fg = colors.purple },
      Define = { fg = colors.purple },
      Exception = { fg = colors.purple },
      Conditional = { fg = colors.purple },
      Repeat = { fg = colors.purple },
      Statement = { fg = colors.purple },
      Macro = { fg = colors.red },
      Error = { fg = colors.purple },
      Label = { fg = colors.purple },
      Special = { fg = colors.red },
      SpecialChar = { fg = colors.red },
      Function = { fg = colors.blue },
      Operator = { fg = colors.purple },
      Title = { fg = colors.cyan },
      Tag = { fg = colors.green },
      -- Comment = { fg = colors.grey, italic = true },
      SpecialComment = { link = 'Comment' },
      Todo = { fg = colors.red, italic = true },
    },

    dap = {
      DapBreakpoint = { fg = colors.red },
      DapBreakpointCondition = { fg = colors.orange_dark },
      DapBreakpointRejected = { fg = colors.red_dark },
      DapLogPoint = { fg = colors.yellow_dark },
      DapStopped = { fg = colors.green_dark },
    },

    diagnostic = {
      DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
      DiagnosticUnderlineHint = { sp = colors.blue_light, undercurl = true },
      DiagnosticUnderlineInfo = { sp = colors.green, undercurl = true },
      DiagnosticUnderlineWarn = { sp = colors.orange, undercurl = true },
      DiagnosticUnnecessary = { fg = colors.grey, italic = true, sp = colors.orange, undercurl = true },
    },

    dressing = {
      DressingBorder = { fg = colors.red, bg = nil },
      DressingNormal = { bg = colors.one_bg },
      DressingTitle = { fg = colors.black, bg = colors.red, italic = true, bold = true },
    },

    poon = {
      PoonOpenMark = { fg = colors.pink },
      PoonTitle = { fg = colors.one_bg, bg = colors.blue, italic = true },
    },

    lazy = {
      LazyNormal = { bg = colors.black },
      LazyProp = { fg = colors.sun, bg = colors.black },
      LazyTaskOutput = { link = 'LazyNormal' },
    },

    mason = {
      MasonNormal = { bg = colors.black },
    },

    misc = {
      HelpNormal = { bg = colors.black3 },
      SearchVirtualText = { fg = '#53bf00', italic = true },
    },

    nvimtree = {
      NvimTreeBookmark = { fg = colors.red },
      NvimTreeBookmarkHL = { fg = colors.red },
      NvimTreeCopiedHL = { sp = colors.yellow, underline = true },
      NvimTreeCutHL = { sp = colors.red, underline = true },
      NvimTreeExecFile = { fg = colors.green },
      NvimTreeFolderName = { fg = colors.blue },
      NvimTreeGitDeleted = { fg = colors.red },
      NvimTreeGitDeletedIcon = { fg = colors.red },
      NvimTreeGitDirty = { fg = colors.orange },
      NvimTreeGitDirtyIcon = { fg = colors.orange },
      NvimTreeGitFileDirtyHL = { fg = colors.orange },
      NvimTreeGitFolderNewHL = { fg = colors.green },
      NvimTreeGitNew = { fg = colors.green },
      NvimTreeGitNewIcon = { fg = colors.green },
      NvimTreeImageFile = { fg = colors.purple },
      NvimTreeIndentMarker = { fg = colors.grey },
      NvimTreeNormal = { fg = colors.white, bg = colors.black3 },
      NvimTreeOpenedFile = { fg = colors.yellow },
      NvimTreeRootFolder = { fg = colors.orange, bold = true },
      NvimTreeSpecialFile = { fg = colors.yellow, underline = true },
      NvimTreeSymlink = { fg = colors.cyan },
      NvimTreeSymlinkFolderName = { fg = colors.blue },
    },

    rainbow_delimiters = {
      RainbowDelimiterBlue = { fg = colors.blue },
      RainbowDelimiterCyan = { fg = colors.cyan },
      RainbowDelimiterGreen = { fg = colors.green },
      RainbowDelimiterOrange = { fg = colors.orange },
      RainbowDelimiterRed = { fg = colors.red },
      RainbowDelimiterViolet = { fg = colors.purple },
      RainbowDelimiterYellow = { fg = colors.yellow },
    },

    statusline = {
      StatusLineCommandMode = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineConfirmMode = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineCwd = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineEmptySpace = { fg = '#00C5FF', bg = colors.black3 },
      StatusLineFileInfo = { fg = colors.white, bg = colors.black3 },
      StatusLineDefaultSep = { fg = colors.grey_light, bg = colors.black3 },
      StatusLineGitAdd = { fg = colors.green, bg = colors.black3 },
      StatusLineGitBranch = { fg = colors.green_dark, bg = colors.black3, italic = true },
      StatusLineGitChange = { fg = colors.yellow, bg = colors.black3 },
      StatusLineGitRemove = { fg = colors.red, bg = colors.black3 },
      StatusLineInsertMode = { fg = colors.yellow_dark, bg = colors.black3 },
      StatusLineLazy = { fg = colors.blue_darker, bg = colors.black3, bold = true },
      StatusLineLspHints = { bg = colors.black3 },
      StatusLineLspInfo = { fg = colors.blue, bg = colors.black3 },
      StatusLineLspStatus = { fg = '#53bf00', bg = colors.black3 },
      StatusLineLspWarning = { fg = '#E7C787', bg = colors.black3 },
      StatusLineLspError = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineMacro = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineMacroA = { fg = colors.red_dark, bg = colors.black3 },
      StatusLineMacroB = { fg = colors.yellow, bg = colors.black3 },
      StatusLineMason = { fg = colors.yellow, bg = colors.black3 },
      StatusLineNormalMode = { fg = colors.blue_light, bg = colors.black3 },
      StatusLineNvimTree = { fg = colors.blue_light, bg = colors.black3, italic = true },
      StatusLinePos = { fg = '#d6a000', bg = colors.black3, bold = false },
      StatusLineReplaceMode = { fg = colors.orange_dark, bg = colors.black3 },
      StatusLineSelectMode = { fg = colors.pink, bg = colors.black3 },
      StatusLineSpin = { fg = colors.pink, bg = colors.black3 },
      StatusLineTerminalMode = { fg = colors.green_dark, bg = colors.black3 },
      StatusLineTime = { fg = '#cc5e00', bg = colors.black3 },
      StatusLineTrouble = { fg = colors.red_dark, bg = colors.black3, italic = true, bold = true },
      StatusLineVisualMode = { fg = colors.pink, bg = colors.black3 },
      StatusLineSearchCount = { link = 'StatusLineLspWarning' },
    },

    tabline = {
      TbLineBufOff = { fg = colors.grey, bg = colors.black3 },
      TbLineBufOffClose = { fg = colors.grey, bg = colors.black3 },
      TbLineBufOffModified = { fg = colors.red, bg = colors.black3 },
      TbLineBufOn = { fg = colors.yellow, bg = colors.one_bg },
      TbLineBufOnClose = { fg = colors.red, bg = colors.one_bg },
      TbLineBufOnModified = { fg = colors.green, bg = colors.one_bg },
      TbLineMarkedBufOff = { fg = colors.grey, bg = colors.black3 },
      TbLineMarkedBufOn = { fg = colors.blue_dark, bg = colors.one_bg },
      TbLineFill = { bg = colors.black3 },
    },

    telescope = {
      TelescopeBorder = { fg = colors.black_darker, bg = colors.black_darker },
      TelescopeMatching = { fg = colors.blue, bg = colors.one_bg },
      TelescopeNormal = { bg = colors.black_darker },
      TelescopePreviewBorder = { fg = colors.black_darker, bg = colors.black_darker },
      TelescopePreviewTitle = { fg = colors.black, bg = colors.green },
      TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
      TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
      TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
      TelescopePromptTitle = { fg = colors.black, bg = colors.red },
      TelescopeResultsBorder = { fg = colors.black_darker, bg = colors.black_darker },
      TelescopeResultsDiffAdd = { fg = colors.green },
      TelescopeResultsDiffChange = { fg = colors.yellow },
      TelescopeResultsDiffDelete = { fg = colors.red },
      TelescopeResultsTitle = { fg = colors.black_darker, bg = colors.black_darker },
      TelescopeSelection = { bg = colors.black2, fg = colors.white },
    },

    snacks = {
      SnacksPickerTitle = { link = 'TelescopePromptTitle' },
      SnacksPicker = { link = 'TelescopeNormal' },
      SnacksPickerBorder = { link = 'TelescopeBorder' },
      SnacksPickerInput = { fg = colors.white, bg = colors.black2 },
      SnacksPickerInputBorder = { link = 'TelescopePromptBorder' },
      SnacksPickerInputTitle = { link = 'TelescopePromptTitle' },
      SnacksPickerPreviewTitle = { link = 'TelescopePreviewTitle' },
    },

    trouble = {
      TroubleNormal = { bg = colors.black3 },
      TroubleNormalNC = { bg = colors.black3 },
    },

    whichkey = {
      WhichKey = { fg = colors.red },
      WhichKeyDesc = { fg = colors.blue },
      WhichKeyGroup = { fg = colors.orange },
      WhichKeyNormal = { bg = colors.black3 },
      WhichKeySeparator = { fg = colors.green },
    },

    lsp = {
      LspSignatureActiveParameter = { underline = true, sp = colors.blue },
      ['@lsp.type.class.svelte'] = {},
      ['@lsp.type.type.lua'] = {},
      ['@lsp.type.comment'] = treesitter['@comment'],
      ['@lsp.type.enum'] = treesitter['@type'],
      ['@lsp.type.enumMember'] = treesitter['@constant.builtin'],
      ['@lsp.type.interface'] = treesitter['@type'],
      ['@lsp.type.typeParameter'] = treesitter['@type'],
      ['@lsp.type.keyword'] = treesitter['@keyword'],
      ['@lsp.type.namespace'] = treesitter['@module'],
      ['@lsp.type.parameter'] = treesitter['@variable.parameter'],
      ['@lsp.type.property'] = treesitter['@property'],
      ['@lsp.type.variable'] = treesitter['@variable'],
      ['@lsp.type.macro'] = treesitter['@function.macro'],
      ['@lsp.type.macro.lua'] = treesitter['@lsp.type.class'],
      ['@lsp.type.method'] = treesitter['@function.method'],
      ['@lsp.type.number'] = treesitter['@number'],
      ['@lsp.type.generic'] = treesitter['@text'],
      ['@lsp.type.builtinType'] = treesitter['@type.builtin'],
      ['@lsp.typemod.method.defaultLibrary'] = treesitter['@function'],
      ['@lsp.typemod.function.defaultLibrary'] = treesitter['@function'],
      ['@lsp.typemod.operator.injected'] = treesitter['@operator'],
      ['@lsp.typemod.string.injected'] = treesitter['@string'],
      ['@lsp.typemod.variable.defaultLibrary'] = treesitter['@variable.builtin'],
      ['@lsp.typemod.variable.injected'] = treesitter['@variable'],
      ['@lsp.typemod.variable.static'] = treesitter['@constant'],
    },
  },
}
