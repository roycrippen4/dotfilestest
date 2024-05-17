local map = vim.keymap.set
local builtin = require('telescope.builtin')

local function toggle_diagnostics()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

map('n', 'gr', builtin.lsp_references, { desc = 'Goto References  ' })
map('n', 'gi', builtin.lsp_implementations, { desc = 'Goto Implementation 󰡱 ' })
map('n', 'gd', builtin.lsp_definitions, { desc = 'Goto Definition 󰼭 ' })
map('n', '<leader>l!', '<cmd> RustAnalyzer restart <CR>', { desc = 'Restart RustAnalyzer  ' })
map('n', '<leader>lc', '<cmd> RustLsp openCargo <CR>', { desc = 'Open Cargo  ' })
map('n', '<leader>lC', '<cmd> RustLsp flyCheck <CR>', { desc = 'Rust run cargo check ' })
map('n', '<leader>lD', '<cmd> RustLsp debuggables <CR>', { desc = 'Debug rust  ' })
map('n', '<leader>ld', toggle_diagnostics, { desc = 'Toggle Diagnostics 󰨚 ' })
map('n', '<leader>lE', '<cmd> RustLsp externalDocs <CR>', { desc = 'Open Rust Documentation 󱔗 ' })
map('n', '<leader>le', '<cmd> RustLsp explainError <CR>', { desc = 'Explain error  ' })
map('n', '<leader>lM', '<cmd> RustLsp rebuildProcMacros <CR>', { desc = 'Rebuild proc macros  ' })
map('n', '<leader>lm', '<cmd> RustLsp expandMacro <CR>', { desc = 'Expand macro  ' })
map('n', '<leader>lr', '<cmd> RustLsp runnables <CR>', { desc = 'Run rust  ' })
map('n', '<leader>lf', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message 󰉪 ' })
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code Action  ' })
