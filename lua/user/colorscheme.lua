local M = {
  'rose-pine/neovim',
  name = 'rose-pine',
  opts = {
    variant = 'main',
    dark_variant = 'main',
  },
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config(_, opts)
  require("rose-pine").setup(opts)
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
