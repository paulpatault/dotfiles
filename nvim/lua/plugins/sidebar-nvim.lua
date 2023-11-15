return {
  "sidebar-nvim/sidebar.nvim",
  config = function()
    require("sidebar-nvim").setup({
      open = false,
      side = "left",
      initial_width = 40,
      bindings = { ["q"] = function() require("sidebar-nvim").close() end },
      sections = { "git", "diagnostics", "buffers", "todos" },
    })
  end
}

