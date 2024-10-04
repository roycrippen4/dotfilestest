local fn = vim.fn
local g = vim.g
local sign_define = fn.sign_define
local strftime = fn.strftime
local sub = fn.substitute
local localtime = fn.localtime

if fn.exists('g:loaded_undotree') ~= 0 then
  return
end

g.loaded_undotree = 1

local time_second = '1 second ago'
local time_seconds = ' seconds ago'

local time_minute = '1 minute ago'
local time_minutes = ' minutes ago'

local time_hour = '1 hour ago'
local time_hours = ' hours ago'

local time_day = '1 day ago'
local time_days = ' days ago'

local time_original = 'Original'

if g.undotree_short_indicators == 1 then
  time_second = '1 s'
  time_seconds = ' s'

  time_minute = '1 m'
  time_minutes = ' m'

  time_hour = '1 h'
  time_hours = ' h'

  time_day = '1 d'
  time_days = ' d'

  time_original = 'Orig'
end

--=================================================
-- Help text

---@type string[]
local helpmore = {
  '    ===== Marks ===== ',
  '>num< : The current state',
  '{num} : The next redo state',
  '[num] : The latest state',
  '  s   : Saved states',
  '  S   : The last saved state',
  '  ===== Hotkeys =====',
}

---@type string[]
local helpless

if not g.undotree_helpline then
  helpless = {}
else
  helpless = { ' Press ? for help.' }
end

-- Custom key mappings: add this function to your vimrc.
-- You can define whatever mapping as you like, this is a hook function which
-- will be called after undotree window initialized.
--
-- function g:Undotree_CustomMap()
--     map <buffer> <c-n> J
--     map <buffer> <c-p> K
-- endfunction

local keymap = {
  { 'Help', '?', 'Toggle quick help' },
  { 'Close', 'q', 'Close undotree panel' },
  { 'FocusTarget', '<tab>', 'Set Focus back to the editor' },
  { 'ClearHistory', 'C', 'Clear undo history (with confirmation)' },
  { 'TimestampToggle', 'T', 'Toggle relative timestamp' },
  { 'DiffToggle', 'D', 'Toggle the diff panel' },
  { 'NextState', 'K', 'Move to the next undo state' },
  { 'PreviousState', 'J', 'Move to the previous undo state' },
  { 'NextSavedState', '>', 'Move to the next saved state' },
  { 'PreviousSavedState', '<', 'Move to the previous saved state' },
  { 'Redo', '<c-r>', 'Redo' },
  { 'Undo', 'u', 'Undo' },
  { 'Enter', '<2-LeftMouse>', 'Move to the current state' },
  { 'Enter', '<cr>', 'Move to the current state' },
}

sign_define('UndoTreeAdd', { text = '++', texthl = 'DiffAdd' })
sign_define('UndoTreeChange', { text = '++', texthl = 'DiffChange' })
sign_define('UndoTreeDel', { text = '++', texthl = 'DiffDel' })
sign_define('UndoTreeDelEnd', { text = '++', texthl = 'DiffDel' })

local sign_id = 2123654789

---@param time number The time to format (in seconds since epoch)
---@return string timestr A formatted time string based on user settings
local function gettime(time)
  if time == 0 then
    return time_original
  end

  if not g.undotree_relative_timestamp then
    local today = sub(strftime('%c', localtime()), ' .*$', '', 'g')

    if today == sub(strftime('%c', time), ' .*$', '', 'g') then
      return strftime('%H:%M', time)
    else
      return vim.fn.strftime('%H:%M:%S %b%d %Y', time)
    end
  else
    local sec = localtime() - time
    if sec < 0 then
      sec = 0
    end

    if sec < 60 then
      if sec == 1 then
        return time_second
      else
        return sec .. time_seconds
      end
    end

    if sec < 3600 then
      if math.floor(sec / 60) == 1 then
        return time_minute
      else
        return math.floor(sec / 60) .. time_minutes
      end
    end

    if sec < 86400 then
      if math.floor(sec / 3600) == 1 then
        return time_hour
      else
        return math.floor(sec / 3600) .. time_hours
      end
    end

    if math.floor(sec / 86400) == 1 then
      return time_day
    else
      return math.floor(sec / 86400) .. time_days
    end
  end
end

local counter = 0
local function get_unique_id()
  counter = counter + 1
end

---@class Panel
---@field bufname string
local Panel = {}

function Panel:init()
  self.bufname = 'invalid'
end

function Panel:set_focus()
  local winnr = vim.fn.bufwinnr(self.bufname)
end
