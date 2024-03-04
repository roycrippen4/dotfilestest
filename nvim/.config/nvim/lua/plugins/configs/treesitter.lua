local options = {
  ensure_installed = {
    'gitignore',
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'html',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'luap',
    'luadoc',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'regex',
    'ron',
    'rust',
    'svelte',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
    'zig',
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 50000
    end,
  },
}

return options
