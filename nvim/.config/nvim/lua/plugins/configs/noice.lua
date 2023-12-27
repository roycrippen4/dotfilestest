local ok, noice = pcall(require, 'noice')

if not ok then
  return
end

noice.setup({
  lsp = {
    progress = {
      enabled = false,
    },
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
    hover = {
      enabled = true,
      view = nil,
      opts = {},
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 100,
      },
    },
    message = {
      enabled = true,
      view = 'mini',
    },
    documentation = {
      view = 'hover',
      opts = {
        lang = 'markdown',
        replace = true,
        render = 'plain',
        format = { '{message}' },
        win_options = { concealcursor = 'n', conceallevel = 3 },
      },
    },
  },
  messages = {
    enabled = true,
    view_search = false,
    view = 'mini',
    view_error = 'mini',
    view_warn = 'mini',
    view_history = 'mini',
  },
  markdown = {
    hover = {
      ['|(%S-)|'] = vim.cmd.help, -- vim help links
      ['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
    },
    highlights = {
      ['|%S-|'] = '@text.reference',
      ['@%S+'] = '@parameter',
      ['^%s*(Parameters:)'] = '@text.title',
      ['^%s*(Return:)'] = '@text.title',
      ['^%s*(See also:)'] = '@text.title',
      ['{%S-}'] = '@parameter',
    },
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = 'cmp', -- backend to use to show regular cmdline completions
    ---@type NoicePopupmenuItemKind|false
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  commands = {
    all = {
      view = 'split',
      opts = {
        enter = true,
        format = 'details',
      },
      filter = {},
    },
  },
  views = {
    cmdline_popup = {
      position = {
        col = 0,
        row = 65,
      },
      size = {
        width = 150,
      },
    },
    split = {
      enter = true,
    },
    hover = {
      scrollbar = false,
    },
  },
  cmdline = {
    format = {
      cmdline = {
        icon = '  EXCOMMAND ',
        icon_hl_group = 'CmdlineEx',
      },
      lua = {
        icon = '  EVAL LUA ',
        icon_hl_group = 'CmdlineLua',
      },
      selectionfilter = {
        pattern = "^:%s*%'<,%'>",
        icon = '   VISUAL SUB ',
        icon_hl_group = 'CmdlineVisualSub',
      },
      substitute = {
        pattern = '^:%%?s/',
        icon = '  SUBSTITUTE ',
        icon_hl_group = 'CmdlineSub',
        ft = 'regex',
      },
      search_up = {
        icon = '  SEARCH ',
        icon_hl_group = 'CmdlineSearch',
      },
      search_down = {
        icon = '  SEARCH ',
        icon_hl_group = 'CmdlineSearch',
      },
      help = {
        icon = ' 󰋖 MAN PAGES ',
        icon_hl_group = 'CmdlineHelp',
      },
    },
    enabled = true,
    opts = {
      border = 'none',
    },
  },
  notify = {
    enabled = false,
  },
  routes = {
    { filter = { find = 'E162' }, view = 'mini' },
    { filter = { find = 'E37' }, skip = true },
    { filter = { find = 'E486' }, opts = { skip = true } },
    { filter = { event = 'emsg', find = 'E23' }, skip = true },
    { filter = { event = 'emsg', find = 'E20' }, skip = true },
    { filter = { find = 'No signature help' }, skip = true },
    { filter = { event = 'msg_show', kind = '', find = 'written' }, opts = { skip = true } },
    { filter = { event = 'msg_show', kind = '', find = 'lines' }, opts = { skip = true } },
    { filter = { event = 'msg_show', kind = '', find = 'yanked' }, opts = { skip = true } },
    { filter = { event = 'msg_show', kind = '', find = '%s/*' }, opts = { skip = true } },
    { filter = { event = 'msg_show', find = 'search hit BOTTOM' }, skip = true },
    { filter = { event = 'msg_show', find = 'search hit TOP' }, skip = true },
  },
  presets = {
    long_message_to_split = true,
    lsp_doc_border = true,
  },
})

vim.keymap.set({ 'n', 'i', 's' }, '<C-S-N>', function()
  if not require('noice.lsp').scroll(4) then
    return '<C-S-N>'
  end
end, { silent = true, expr = true })

vim.keymap.set({ 'n', 'i', 's' }, '<C-S-P>', function()
  if not require('noice.lsp').scroll(-4) then
    return '<C-S-P>'
  end
end, { silent = true, expr = true })
