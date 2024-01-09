local options = {
  ensure_installed = {
    -- lua stuff
    'lua-language-server',
    'stylua',

    -- web dev stuff
    'css-lsp',
    'html-lsp',
    'js-debug-adapter',
    'json-language-server',
    'prettier',
    'rust-analyzer',
    'typescript-language-server',

    -- c/cpp stuff
    'clangd',
    'clang-format',
  },

  PATH = 'skip',

  ui = {
    icons = {
      package_pending = ' ',
      package_installed = '󰄳 ',
      package_uninstalled = ' 󰚌',
    },

    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      check_server_version = 'c',
      update_all_servers = 'U',
      check_outdated_servers = 'C',
      uninstall_server = 'X',
      cancel_installation = '<C-c>',
      toggle_help = '?',
    },
  },

  max_concurrent_installers = 10,
}

return options
