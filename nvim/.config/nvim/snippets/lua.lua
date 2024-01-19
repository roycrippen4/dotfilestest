---@diagnostic disable: undefined-global

return {
  s('dnl', { t('---@diagnostic disable-next-line') }),

  s({
    trig = 'defer',
    name = 'defer_fn',
    dscr = {
      'defer_fn(…, …)',
    },
  }, {
    t({ 'vim.defer_fn(function()', '\t' }),
    -- function name
    i(1),
    t({ '\t', 'end, ' }),
    i(0, '0'),
    t(')'),
  }),

  s({
    trig = 'schedule',
    name = 'schedule_fn',
    dscr = {
      'schedule(…)',
    },
  }, {
    t({ 'vim.schedule(function()', '\t' }),
    -- function name
    i(0),
    t({ '\t', 'end' }),
    t(')'),
  }),
}
