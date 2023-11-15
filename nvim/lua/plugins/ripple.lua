return {
  -- yrip / yR
  "urbainvaes/vim-ripple",
  config = function()
    vim.g.ripple_repls = {
      rml = {
        command = "rmltop",
        post = ";;",
        addcr  = 1
      },
      python = {
        command = "ipython --no-autoindent",
        addcr = 1
      },
      --[[ coq = {
        command = "coqtop",
        pre = "",
        post = "",
        addcr = 0
      }, ]]
      ocaml = {
        command = "ocaml",
        pre = "",
        post = ";;",
        addcr = 0
      }
    }
  end
}
