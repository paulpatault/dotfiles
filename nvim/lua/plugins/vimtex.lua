return {
  "lervag/vimtex",

  config = function()

    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_enable = 1
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_engine = "lualatex"
    vim.g.vimtex_compiler_latexmk = {
      engine = "lualatex",
      options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode"
      }
    }
  end
}

-- https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/
