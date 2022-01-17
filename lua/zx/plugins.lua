local M = {}

local function get_name(s)
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

local function get_full_name(s) 
  local l = 1
  for i = 1, #s do 
    local c = string.sub(s, i, i)
    if c == '/' then
      l = i + 1
    end
  end
  return string.sub(s, l, #s)
end

local function file_exist(s)
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
  local need_install = false;
  for i = 1, #plugins do
    local file_name = get_name(plugins[i].name)
    local installed = file_exist('~/.local/share/nvim/plugged/' .. get_full_name(plugins[i].name) .. '/')
    local has_lua = file_exist('~/.config/nvim/lua/configs/' .. file_name .. '.lua')
    local has_vim = file_exist('~/.config/nvim/lua/configs/' .. file_name .. '.vim')
    if installed == false then 
      need_install = true 
    end
    if has_lua == true and installed then
      require('configs.' .. file_name)
    end
    if has_vim == true and installed then
      vim.cmd("source ~/.config/nvim/lua/configs/" .. file_name .. ".vim")
    end
  end
  if need_install then 
    vim.cmd('autocmd VimEnter * PlugInstall | q')
  end
end
