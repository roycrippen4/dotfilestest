local dressing_ok, dressing = pcall(require, 'dressing')
local tree = require('nvim-tree.api').tree

if not dressing_ok then
  return
end

dressing.setup({
  input = {
    get_config = function(opts)
      if opts.prompt == 'Create file ' then
        return {
          min_width = (function()
            local path_length = #opts.default
            return path_length + 5
          end)(),
          title_pos = 'left',
        }
      end

      if opts.prompt == 'Move to: ' then
        opts.default = opts.default .. '/'
        return {
          min_width = (function()
            local path_length = #opts.default
            return path_length + 5
          end)(),
          title_pos = 'left',
        }
      end

      if string.find(opts.prompt, ' y/N: ') then
        opts.prompt = 'Delete: y/n'
        return {
          width = nil,
          min_width = (function()
            local length = #opts.prompt
            return length
          end)(),
          max_width = 15,
          title_pos = 'center',
        }
      end

      if opts.prompt == 'Rename to ' then
        local name = tree.get_node_under_cursor().name
        opts.prompt = 'Rename ' .. name .. '?'
        return nil
      end
      return nil
    end,
    win_options = {
      winhighlight = 'FloatBorder:CmpBorder',
    },
  },
})
