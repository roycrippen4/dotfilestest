local M = {}
local fn = vim.fn

M.echo = function(str)
  vim.cmd('redraw')
  vim.api.nvim_echo({ { str, 'Bold' } }, true, {})
end

local function shell_call(args)
  local output = fn.system(args)
  assert(vim.v.shell_error == 0, 'External call failed with error code: ' .. vim.v.shell_error .. '\n' .. output)
end

M.lazy = function(install_path)
  ------------- base46 ---------------
  local lazy_path = fn.stdpath('data') .. '/lazy/base46'

  M.echo('  Compiling base46 theme to bytecode ...')

  local base46_repo = 'https://github.com/roycrippen4/base46'
  shell_call({ 'git', 'clone', '--depth', '1', '-b', 'v3.0', base46_repo, lazy_path })
  vim.opt.rtp:prepend(lazy_path)

  require('base46').compile()
  --------- lazy.nvim ---------------
  M.echo('  Installing lazy.nvim & plugins ...')
  local repo = 'https://github.com/folke/lazy.nvim.git'
  shell_call({ 'git', 'clone', '--filter=blob:none', '--branch=stable', repo, install_path })
  vim.opt.rtp:prepend(install_path)

  -- install plugins
  require('plugins')
  local lastpkg = vim.g.mason_binaries_list[#vim.g.mason_binaries_list]

  -- Keep track of which mason pkgs get installed
  require('mason-registry'):on('package:install:success', function(pkg)
    if tostring(pkg) == 'Package(name=' .. lastpkg .. ')' then
      print('Installation successful')
    end
  end)
end

return M
