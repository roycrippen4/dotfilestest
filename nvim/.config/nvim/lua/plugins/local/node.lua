local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local term = require('plugins.local.term')

local M = {}

M.ns_id = vim.api.nvim_create_namespace('package_json_runner')

---@return boolean
local function is_package_json()
  return vim.bo.ft == 'json' and vim.fn.expand('%:t') == 'package.json'
end

-- returns a table of a scripts and their associated line numbers
local function get_script_table()
  M.scripts = {}
  local lines = vim.fn.readfile(vim.fn.expand('%'))

  for i, line in ipairs(lines) do
    if line:find('scripts') then
      local start_line = i
      local end_line = start_line

      for j = start_line + 1, #lines do
        if lines[j]:find('}') then
          end_line = j
          break
        end
      end

      -- need to also check for items like "check:watch"
      for k = start_line + 1, end_line do
        local script = lines[k]:match('"[%s]*(.-)[%s]*":')
        if script then
          table.insert(M.scripts, { line = k, script = script })
        end
      end
    end
  end

  return M.scripts
end

---@return boolean
local function cursor_on_script()
  local cursor = vim.fn.line('.')

  for _, script in ipairs(M.scripts) do
    if cursor == script.line then
      return true
    end
  end

  return false
end

local function match_script()
  local cursor = vim.fn.line('.')

  for _, script in ipairs(M.scripts) do
    if cursor == script.line then
      return script.script
    end
  end
end

local function can_run_script()
  if not is_package_json() then
    vim.notify('Not a package.json file', 3)
    return false
  end

  if not cursor_on_script() then
    vim.notify('Cursor not on a script', 3)
    return false
  end

  vim.notify('Running ' .. match_script(), 1)
  return true
end

local function has_bun_lock()
  return vim.fn.filereadable('bun.lockb') == 1
end

function M.run_script()
  if not can_run_script() then
    return
  end

  local runner = (has_bun_lock() and 'bun run ') or 'npm run '
  local script = runner .. match_script()
  term.send(script, 'H')
end

local function set_keymaps()
  vim.keymap.set('n', '<leader>nr', function()
    M.run_script()
  end)
end

local function create_highlights()
  vim.api.nvim_set_hl(0, 'RunScript', { fg = '#80F0F0' })
end

local function set_virtual_text()
  if not is_package_json() then
    return
  end

  if not M.ns_id then
    M.ns_id = vim.api.nvim_create_namespace('package_json_runner')
  end

  for _, script in ipairs(M.scripts) do
    local col = vim.fn.getline(script.line):find('"' .. script.script) - 4
    vim.api.nvim_buf_set_extmark(0, M.ns_id, script.line - 1, 0, {
      virt_text = { { ' ', 'RunScript' } },
      virt_text_win_col = col,
    })
  end
end

function M.setup()
  M.scripts = get_script_table()
  set_keymaps()
  create_highlights()
  set_virtual_text()
end

autocmd('BufEnter', {
  pattern = 'package.json',
  group = augroup('PackageCheck', { clear = true }),
  callback = M.setup,
})

autocmd({ 'UIEnter', 'DirChanged' }, {
  group = augroup('nvmrc', { clear = true }),
  pattern = '*',
  callback = function()
    vim.schedule(function()
      local nvmrc = vim.fn.findfile('.nvmrc', vim.fn.getcwd())
      if nvmrc == '' then
        return
      end
      local node_version = vim.fn.trim(vim.fn.readfile(nvmrc)[1])

      if node_version == 'v:null' then
        vim.notify('No node version specified in .nvmrc', 3)
        return
      end

      term.send('nvm use ' .. node_version, 'H')
      vim.defer_fn(function()
        term.toggle_horizontal()
      end, 50)
    end)
  end,
})

return M
