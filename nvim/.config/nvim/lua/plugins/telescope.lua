local map = vim.keymap.set

--@param value any
local function set(value)
  vim.fn.setreg('+', value)
end

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local previewers = require('telescope.previewers')
    local sorters = require('telescope.sorters')
    local actions = require('telescope.actions')

    local opts = {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '-L',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = { prompt_position = 'top', preview_width = 0.55, results_width = 0.8 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = { 'node_modules' },
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        path_display = { 'truncate' },
        winblend = 0,
        border = {},
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        buffer_previewer_maker = previewers.buffer_previewer_maker,
        mappings = {
          n = {
            ['q'] = actions.close,
            ['<C-Q>'] = false,
            ['<M-q>'] = false,
            ['<C-d>'] = function(prompt_bufnr) ---@param prompt_bufnr number
              actions.results_scrolling_down(prompt_bufnr)
            end,
            ['<C-u>'] = function(prompt_bufnr) ---@param prompt_bufnr number
              actions.results_scrolling_up(prompt_bufnr)
            end,
            ['<M-t>'] = actions.send_to_qflist + actions.open_qflist,
            ['yy'] = function()
              local state = require('telescope.actions.state')
              local title = state.get_current_picker(vim.api.nvim_get_current_buf()).prompt_title
              local selected = state.get_selected_entry()

              if title == 'Find Files' then
                set(selected[1])
                vim.notify('Yanked ' .. selected[1] .. ' into register.')
              end

              if title == 'Live Grep' then
                set(selected.filename)
                vim.notify('Yanked ' .. selected.filename .. ' into register.')
              end

              if title == 'Highlights' then
                set(selected.ordinal)
                vim.notify('Yanked ' .. selected.ordinal .. ' into register.')
              end
            end,
          },
          i = {
            ['<M-t>'] = actions.send_to_qflist + actions.open_qflist,
            ['<M-q>'] = false,
            ['<C-Q>'] = false,
          },
        },
      },
      extensions_list = { 'fzf' },
      extensions = { fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' } },
    }

    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    map('n', '<leader>fa', '<cmd> Telescope autocommands <CR>', { desc = 'Find autocommands 󱚟 ' })
    map('n', '<leader>fb', '<cmd> Telescope buffers <CR>', { desc = 'Find buffers ﬘ ' })
    map('n', '<leader>fc', '<cmd> Telescope commands <CR>', { desc = 'Find commands 󰘳 ' })
    map('n', '<leader>ff', '<cmd> Telescope find_files <CR>', { desc = 'Find files  ' })
    map('n', '<leader>fgc', '<cmd> Telescope git_commits <CR>', { desc = 'Find commits  ' })
    map('n', '<leader>fgs', '<cmd> Telescope git_status <CR>', { desc = 'Find Git status 󱖫 ' })
    map('n', '<leader>fh', '<cmd> Telescope help_tags <CR>', { desc = 'Find help 󰋖' })
    map('n', '<leader>fk', '<cmd> Telescope keymaps <CR>', { desc = 'Find keymaps  ' })
    map('n', '<leader>fl', '<cmd> Telescope highlights <CR>', { desc = 'Find highlight groups 󰸱 ' })
    map('n', '<leader>fm', '<cmd> Telescope marks <CR>', { desc = 'Find bookmarks  ' })
    map('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>', { desc = 'Find oldfiles  ' })
    map('n', '<leader>fr', '<cmd> Telescope resume <CR>', { desc = 'Find oldfiles  ' })
    map('n', '<leader>fw', '<cmd> Telescope live_grep <CR>', { desc = 'Find word (cwd)  ' })
    map('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>', { desc = 'Find in current buffer  ' })
  end,
}
