local diag = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  diagnostics_color = {
    error = "DiagnosticError",
    warn  = "DiagnosticWarn",
    info  = "DiagnosticInfo",
    hint  = "DiagnosticHint",
  },
  symbols = {error = "E", warn = "W", info = "I", hint = "H"},
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

return {
  "hoob3rt/lualine.nvim",
  dependencies = {"kyazdani42/nvim-web-devicons", opt = true},
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"};
        lualine_c = {"filename", diag},
        lualine_x = {"%{ObsessionStatus()}", "searchcount", "diff", "encoding", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {},
    }
  end
}
