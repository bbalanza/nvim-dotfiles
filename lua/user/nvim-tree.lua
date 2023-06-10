-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

local on_attach = function(bufnr)

    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "<cr>", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Collapse All"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end


-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    on_attach = on_attach,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    sync_root_with_cwd = true,
    sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,

  },
})
