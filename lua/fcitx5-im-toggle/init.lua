local M = {}

local last_ime_state = 1

local function has_fcitx5()
  return vim.fn.executable("fcitx5-remote") == 1
end

local function get_ime_state()
  if not has_fcitx5() then return 0 end
  return tonumber(vim.fn.system("fcitx5-remote")) or 0
end

local function ime_off()
  if has_fcitx5() then
    vim.fn.system("fcitx5-remote -c")
  end
end

local function ime_on()
  if has_fcitx5() then
    vim.fn.system("fcitx5-remote -o")
  end
end

local ime_group = vim.api.nvim_create_augroup("IME", { clear = true })

function M.setup()
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = ime_group,
    callback = function()
      last_ime_state = get_ime_state()
      ime_off()
    end,
  })

  vim.api.nvim_create_autocmd("InsertEnter", {
    group = ime_group,
    callback = function()
      if last_ime_state == 1 then
        ime_off()
      else
        ime_on()
      end
    end,
  })
end

return M

