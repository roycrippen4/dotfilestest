---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'VeryLazy',
  lazy = vim.fn.argc(-1) == 0,
  init = function(plugin)
    require('lazy.core.loader').add_to_rtp(plugin)
    require('nvim-treesitter.query_predicates')
  end,
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'comment',
      'cpp',
      'css',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'graphql',
      'html',
      'http',
      'hyprlang',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'jsonc',
      'lua',
      'luadoc',
      'luap',
      'markdown',
      'markdown_inline',
      'ocaml',
      'ocaml_interface',
      'python',
      'query',
      'rasi',
      'regex',
      'ron',
      'rust',
      'svelte',
      'sxhkdrc',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
      'zig',
    },
    indent = { enable = true },
    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 50000
      end,
    },
    auto_install = true,
  },
  config = function(_, opts)
    vim.filetype.add({
      extension = {
        cts = 'typescript',
        es6 = 'javascript',
        gif = 'image',
        jpeg = 'image',
        jpg = 'image',
        mts = 'typescript',
        png = 'image',
        postcss = 'css',
        rasi = 'rasi',
        rofi = 'rasi',
        wofi = 'rasi',
        sh = 'sh',
        zsh = 'sh',
      },
      filename = {
        ['.babelrc'] = 'json',
        ['.eslintrc'] = 'json',
        ['.prettierrc'] = 'json',
        ['.stylelintrc'] = 'json',
        ['sxhkdrc'] = 'sxhkdrc',
        ['.zshrc'] = 'sh',
        ['.zshenv'] = 'sh',
      },
      pattern = {
        ['.*config/git/config'] = 'gitconfig',
        ['todo%.txt'] = 'todotxt',
        ['.*/waybar/config'] = 'jsonc',
        ['.*/kitty/.+%.conf'] = 'kitty',
        ['.*/hypr/.+%.conf'] = 'hyprlang',
        ['%.env%.[%w_.-]+'] = 'sh',
      },
    })

    vim.treesitter.language.register('bash', 'kitty')

    require('nvim-treesitter.configs').setup(opts)
  end,
}
