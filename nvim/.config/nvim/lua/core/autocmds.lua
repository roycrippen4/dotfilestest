local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local namespace = vim.api.nvim_create_namespace
local pattern = { 'DressingInput', 'help', 'logger', 'man', 'qf', 'query', 'scratch', 'undotree', 'telescope', 'TelescopePrompt' }
local general = augroup('general', { clear = true })

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('InsertEnter', {
  desc = 'Disable cursorline in insert mode',
  group = general,
  callback = function(args)
    if not vim.tbl_contains(pattern, vim.bo[args.buf].ft) then
      vim.cmd('set nocul')
    end
  end,
})

autocmd('InsertLeave', {
  desc = 'Enable cursorline after leaving insert mode',
  group = general,
  callback = function(args)
    if not vim.tbl_contains(pattern, vim.bo[args.buf].ft) then
      vim.cmd('set cul')
    end
  end,
})

autocmd('BufWritePost', {
  desc = 'Reload kitty config on save',
  pattern = 'kitty.conf',
  callback = function()
    os.execute('pkill -USR1 kitty')
  end,
})

-- don't list quickfix buffers
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd('FileType', {
  group = general,
  pattern = 'hypr',
  callback = function(args)
    vim.bo[args.buf].commentstring = '# %s'
  end,
})

autocmd('ExitPre', {
  group = augroup('StopDaemons', { clear = true }),
  callback = function()
    vim.fn.jobstart(vim.fn.expand('$HOME') .. '/.bin/stop-nvim-daemons.sh', { detach = true })
  end,
})

autocmd('FileType', {
  group = general,
  pattern = 'harpoon',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    require('core.utils').highlight_marked_files(bufnr, namespace('Harpoon"tmarks"'))
    vim.keymap.set('n', 'K', '', { silent = true, buffer = bufnr })
  end,
})

-- Forces help pages to be in a vertical split
autocmd('FileType', {
  pattern = 'help',
  group = general,
  callback = function()
    vim.api.nvim_set_option_value('bufhidden', 'unload', { scope = 'local' })
    vim.cmd('wincmd L')
    vim.api.nvim_win_set_width(0, 100)
    vim.cmd('set winhighlight=Normal:HelpNormal')
  end,
})

-- Sets many plugin windows to close on `q`
autocmd('FileType', {
  group = general,
  pattern = pattern,
  callback = function(args)
    vim.keymap.set('n', 'q', '<cmd>q!<cr>', { buffer = args.buf })
  end,
})

-- Sets terminal titlestring to the current working directory
autocmd('VimEnter', {
  group = general,
  pattern = 'NvimTree_1',
  once = true,
  callback = function()
    local cwd = vim.fn.getcwd()
    local env = os.getenv('HOME')

    if cwd == env then
      vim.o.titlestring = '~/' .. '  '
      return
    end

    if cwd and type(env) == 'string' then
      local match = string.match(cwd, env)
      if match then
        vim.o.titlestring = cwd:gsub(match, '~') .. '  '
        return
      end
      vim.o.titlestring = cwd
    end
  end,
})

-- Autocommand to restore the cursor position when the buffer is read
autocmd('BufReadPost', {
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = general,
  pattern = '*/node_modules/*',
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- Adds missing commas to lua files
autocmd('BufWritePre', {
  group = general,
  pattern = '*',
  callback = function()
    local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    if #diagnostics > 0 then
      require('core.utils').add_missing_commas(diagnostics)
    end
  end,
})

autocmd('CmdwinEnter', {
  group = augroup('_fix_ts_cmdwin', { clear = false }),
  callback = function()
    vim.cmd('setfiletype vim')
  end,
})

autocmd('FileType', {
  group = general,
  pattern = 'gitcommit',
  callback = function()
    feed('i', 'n')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  callback = function(ctx)
    local backdrop_name = 'TelescopeBackdrop'
    local telescope_bufnr = ctx.buf
    local zidx = 50

    local backdrop_bufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(backdrop_bufnr, false, {
      relative = 'editor',
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.columns,
      focusable = false,
      style = 'minimal',
      zindex = zidx - 1,
    })

    vim.api.nvim_set_hl(0, backdrop_name, { bg = '#000000', default = true })
    vim.wo[winnr].winhighlight = 'Normal:' .. backdrop_name
    vim.wo[winnr].winblend = 50
    vim.bo[backdrop_bufnr].buftype = 'nofile'

    vim.api.nvim_create_autocmd({ 'WinClosed', 'BufLeave' }, {
      once = true,
      buffer = telescope_bufnr,
      callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
        if vim.api.nvim_buf_is_valid(backdrop_bufnr) then
          vim.api.nvim_buf_delete(backdrop_bufnr, { force = true })
        end
      end,
    })
  end,
})
