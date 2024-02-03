local M = {}
local merge_tb = vim.tbl_deep_extend

vim.api.nvim_set_hl(0, 'UrlHighlight', { fg = 'gray' })
local url_ns = vim.api.nvim_create_namespace('UrlHighlight')

local skip_ft = {
  'NvimTree',
  'Trouble',
  'alpha',
  'dap-repl',
  'dapui_breakpoints',
  'dapui_console',
  'dapui_scopes',
  'dapui_stacks',
  'dapui_watches',
  'dashboard',
  'fidget',
  'help',
  'harpoon',
  'lazy',
  'logger',
  'neo-tree',
  'noice',
  'nvcheatsheet',
  'nvdash',
  'terminal',
  'toggleterm',
  'vim',
}

function M.highlight_url()
  if require('nvim-treesitter.parsers').has_parser() then
    local node = vim.treesitter.get_node({ lang = 'comment' })

    if not node then
      return
    end

    vim.api.nvim_buf_clear_namespace(0, url_ns, 0, -1)
    if node:type() == 'uri' then
      local line, col_start, _, col_end = node:range()
      vim.api.nvim_buf_add_highlight(0, url_ns, 'UrlHighlight', line, col_start, col_end)
    end
  end
end

---@return boolean
function M.should_format_lua_func()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.getpos('.')[3]
  local pattern = '%)%s*end$'
  local start_pos, end_pos = line:find(pattern)

  if start_pos then
    local res = col > start_pos and col <= end_pos
    return res
  end

  return false
end

--- Adds highlighting to any marked files that are currently visible behind the harpoon floating window
---@param bufnr integer harpoon.ui buffer handle
---@param ns_id integer namespace identifier
M.highlight_marked_files = function(bufnr, ns_id)
  local open_files = M.list_open_files()

  if vim.bo[bufnr].ft ~= 'harpoon' then
    log('bad bufnr')
  end

  for _, open_file in ipairs(open_files) do
    for idx = 1, require('harpoon.mark').get_length() do
      local marked_file = require('harpoon.mark').get_marked_file_name(idx)

      if string.find(open_file, marked_file) then
        vim.api.nvim_buf_add_highlight(bufnr, ns_id, 'HarpoonOpenMark', idx - 1, 0, -1)
      end
    end
  end
end

--- Takes a [bufnr]. Returns [true] if bufnr is visible, [false] if not
---@param bufnr integer buffer handle/number
M.is_buf_visible = function(bufnr)
  local wins = vim.api.nvim_list_wins()
  local should_skip = vim.tbl_contains(skip_ft, vim.bo[bufnr].ft) or vim.api.nvim_buf_get_name(bufnr) == ''

  for _, win in ipairs(wins) do
    if vim.api.nvim_win_get_buf(win) == bufnr and not should_skip then
      return true
    end
  end
  return false
end

--- Get's a list of absolute paths for all open files. Ignores plugin windows/buffers
---@return string[] open_files list of open files
M.list_open_files = function()
  local bufs = vim.api.nvim_list_bufs()
  local visible_bufs = {}

  for _, bufnr in ipairs(bufs) do
    if M.is_buf_visible(bufnr) then
      local name = vim.api.nvim_buf_get_name(bufnr)
      table.insert(visible_bufs, name)
    end
  end
  return visible_bufs
end

M.load_config = function()
  local config = require('core.default_config')
  local chadrc_path = vim.api.nvim_get_runtime_file('lua/custom/chadrc.lua', false)[1]

  if chadrc_path then
    local chadrc = dofile(chadrc_path)

    config.mappings = M.remove_disabled_keys(chadrc.mappings, config.mappings)
    config = merge_tb('force', config, chadrc)
    config.mappings.disabled = nil
  end

  return config
end

M.remove_disabled_keys = function(chadrc_mappings, default_mappings)
  if not chadrc_mappings then
    return default_mappings
  end
  local keys_to_disable = {}
  for _, mappings in pairs(chadrc_mappings) do
    for mode, section_keys in pairs(mappings) do
      if not keys_to_disable[mode] then
        keys_to_disable[mode] = {}
      end
      section_keys = (type(section_keys) == 'table' and section_keys) or {}
      for k, _ in pairs(section_keys) do
        keys_to_disable[mode][k] = true
      end
    end
  end

  -- make a copy as we need to modify default_mappings
  for section_name, section_mappings in pairs(default_mappings) do
    for mode, mode_mappings in pairs(section_mappings) do
      mode_mappings = (type(mode_mappings) == 'table' and mode_mappings) or {}
      for k, _ in pairs(mode_mappings) do
        -- if key if found then remove from default_mappings
        if keys_to_disable[mode] and keys_to_disable[mode][k] then
          default_mappings[section_name][mode][k] = nil
        end
      end
    end
  end

  return default_mappings
end

M.load_mappings = function(section, mapping_opt)
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then
        return
      end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts = merge_tb('force', { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
          -- merge default + user opts
          local opts = merge_tb('force', default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require('nvconfig').mappings

    if type(section) == 'string' then
      mappings[section]['plugin'] = nil
      mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ 'BufRead', 'BufWinEnter', 'BufNewFile' }, {
    group = vim.api.nvim_create_augroup('BeLazyOnFileOpen' .. plugin, {}),
    callback = function()
      local file = vim.fn.expand('%')
      local condition = file ~= '[lazy]' and file ~= ''

      if condition then
        vim.api.nvim_del_augroup_by_name('BeLazyOnFileOpen' .. plugin)
        if plugin ~= 'nvim-treesitter' then
          vim.defer_fn(function()
            require('lazy').load({ plugins = plugin })
            if plugin == 'nvim-lspconfig' then
              vim.cmd('silent! do FileType')
            end
          end, 0)
        else
          require('lazy').load({ plugins = plugin })
        end
      end
    end,
  })
end

-- Bust the cache of all required Lua files.
-- After running this, each require() would re-run the file.
local function unload_all_modules()
  -- Lua patterns for the modules to unload
  local unload_modules = {
    '^j.',
  }

  for k, _ in pairs(package.loaded) do
    for _, v in ipairs(unload_modules) do
      if k:match(v) then
        package.loaded[k] = nil
        break
      end
    end
  end
end

function M.reload()
  vim.cmd.LspStop()
  vim.fn.execute('silent !pkill -9 eslint_d')
  unload_all_modules()
  vim.cmd.luafile('$MYVIMRC')
end

---@param diagnostics Diagnostic[]
function M.add_missing_commas(diagnostics)
  for _, diag in pairs(diagnostics) do
    if diag.message == 'Miss symbol `,` or `;` .' or diag.message == 'Missed symbol `,`.' then
      vim.api.nvim_buf_set_text(0, diag.lnum, diag.col, diag.lnum, diag.col, { ',' })
    end
  end
end

return M
