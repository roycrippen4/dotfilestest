local M = {}

print('diagnostics')

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '❓', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })

-- Configuration for diagnostics
M.diagnostic_signs = {
  { name = 'DiagnosticSignError', text = '💀' },
  { name = 'DiagnosticSignWarn', text = ' ' },
  { name = 'DiagnosticSignHint', text = '󱡴 ' },
  { name = 'DiagnosticSignInfo', text = ' ' },
}

for _, sign in ipairs(M.diagnostic_signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

---@type vim.diagnostic.Opts
local config = {
  signs = {
    active = M.diagnostic_signs, -- show signs
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    source = true,
    header = 'Diagnostic',
    prefix = '',
  },
}

vim.diagnostic.config(config)
