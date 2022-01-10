local M = {}

function get_name(s)
  local l = 1; local r = #s
  for i = 1, #s do 
    local c = string.sub(s, i, i)
    if c == '.' then
      r = i - 1 
    elseif c == '/' then
      l = i + 1
    end
  end
  return string.sub(s, l, r)
end

function file_exist(s)
  if vim.api.nvim_eval("empty(glob('" .. s .. "'))") == 1 then
    return false
  else 
    return true
  end
end

function M.install(plugins) 
  vim.fn['plug#begin']()
  for i = 1, #plugins do 
    local s = 'Plug ' .. "'" .. plugins[i].name .. "'" 
    if plugins[i].options ~= nil then
      s = s .. ', {'
      for j = 1, #plugins[i].options do
        s = s .. " '" .. plugins[i].options[j][1] .. "':" 
        s = s .. " '" .. plugins[i].options[j][2] .. "',"
      end
      s = s .. '}'
    end
    vim.cmd(s)
  end
  vim.fn['plug#end']()
  for i = 1, #plugins do
    local file_name = get_name(plugins[i].name)
    local has_lua = file_exist('~/.config/nvim/lua/configs/' .. file_name .. '.lua')
    local has_vim = file_exist('~/.config/nvim/lua/configs/' .. file_name .. '.vim')

    if has_lua == true then
      require('configs.' .. file_name)
    end
    if has_vim == true then
      vim.cmd("source ~/.config/nvim/lua/configs/" .. file_name .. ".vim")
    end
  end
end

return M
