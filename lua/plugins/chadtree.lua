-- Import CHADTree plugin
return {
  "ms-jpq/chadtree",
  config = function()
    -- Apply CHADTree settings
    vim.g.chadtree_settings = chadtree_settings

    -- Global keybinds for toggling CHADTree
    vim.keymap.set('n', '\\', ':CHADopen --always-focus<CR>', { noremap = true, silent = true, desc = "Toggle CHADTree" })
  end
}
