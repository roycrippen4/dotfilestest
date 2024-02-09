-- --- Handle when a terminal process exits
-- ---@param term Terminal
-- local function __handle_exit(term)
--   return function(...)
--     if term.on_exit then term:on_exit(...) end
--     if term.close_on_exit then
--       term:close()
--       if api.nvim_buf_is_loaded(term.bufnr) then
--         api.nvim_buf_delete(term.bufnr, { force = true })
--       end
--     end
--   end
-- end
