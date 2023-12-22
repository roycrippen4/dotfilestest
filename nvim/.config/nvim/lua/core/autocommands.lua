local autocmd = vim.api.nvim_create_autocmd
local utils = require('core.utils')

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*/node_modules/*',
  command = 'lua vim.diagnostic.disable(0)',
})

autocmd('ModeChanged', {
  callback = function()
    local m = vim.api.nvim_get_mode().mode
    local m_hl = require('plugins.configs.statusline').modes[m][2]
    local hl = vim.api.nvim_get_hl(0, { name = m_hl })
    vim.api.nvim_set_hl(0, 'St_nvimtree', { fg = hl.fg, italic = true })
  end,
})

-- Remove columns from the terminal buffer
autocmd({ 'TermOpen', 'TermEnter', 'BufEnter' }, {
  pattern = { 'term://*' },
  callback = function()
    vim.wo.scrolloff = 0
    vim.wo.relativenumber = false
    vim.wo.number = false
    vim.wo.signcolumn = 'no'
    vim.wo.statuscolumn = ''
  end,
})

autocmd('QuitPre', {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match('NvimTree_') ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local hl_ns = vim.api.nvim_create_namespace('search')
local hlsearch_group = vim.api.nvim_create_augroup('hlsearch_group', { clear = true })

local function manage_hlsearch(char)
  local key = vim.fn.keytrans(char)
  local keys = { '<CR>', 'n', 'N', '*', '#', '?', '/' }

  if vim.fn.mode() == 'n' then
    if not vim.tbl_contains(keys, key) then
      vim.cmd([[ :set nohlsearch ]])
    elseif vim.tbl_contains(keys, key) then
      vim.cmd([[ :set hlsearch ]])
    end
  end
  ---@diagnostic disable next-line
  vim.on_key(nil, hl_ns)
end

autocmd({ 'InsertLeave', 'WinEnter', 'BufEnter' }, {
  callback = function()
    vim.cmd([[ set cursorline ]])
    vim.api.nvim_set_hl(0, 'CursorLine', { link = 'NvimTreeCursorLine' })
  end,
})

autocmd({ 'InsertEnter', 'WinLeave' }, { command = 'set nocursorline', group = group })

autocmd('CursorMoved', {
  group = hlsearch_group,
  callback = function()
    vim.on_key(manage_hlsearch, hl_ns)
  end,
})

autocmd({ 'BufAdd', 'BufDelete', 'BufEnter', 'TabNew' }, {
  callback = function()
    local current_buf = vim.api.nvim_get_current_buf()
    if vim.t.bufs ~= nil then
      if #vim.t.bufs == 0 then
        return
      else
        if vim.t.bufs[1] == current_buf then
          vim.api.nvim_set_hl(0, 'NvimTreeTitleSep', { link = 'NvimTreeTitleSepOn' })
        else
          vim.api.nvim_set_hl(0, 'NvimTreeTitleSep', { link = 'NvimTreeTitleSepOff' })
        end
      end
    end
  end,
})

autocmd({ 'VimEnter' }, {
  callback = function()
    local cwd = vim.fn.getcwd()
    utils.set_titlestring(cwd)
    utils.set_node_version(cwd)
    vim.env.PATH = '~/.nvm/versions/node/v20.10.0/bin:' .. vim.env.PATH
  end,
})
