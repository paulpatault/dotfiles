require("ppatault.set")
require("ppatault.lazy")
require("impatient")
require("ppatault.mappings")
require("ppatault.globals")
require("ppatault.highlights")
require("ppatault.theme")

local fts = {
  zsh = "sh",
  mlw = "why3",
  mp  = "patmat",
  wh  = "why3",
  lus = "lustre",
  ept = "lustre",
  mll = "ocaml.ocamllex",
  mli = "ocaml.interface",
  fx  = "scala.no_lsp",
  anfix = "scala.no_lsp",
  conflicts = "conflicts",
  k = "jasmin",
  proof = "proof",
  mly = "menhir",
  coma = "coma",
}

local options_group = vim.api.nvim_create_augroup("OptionsGroup", {clear = true})

for k, v in pairs(fts) do
  vim.api.nvim_create_autocmd({"BufRead","BufNewFile"},
    {
      pattern = "*." .. k,
      command = "set filetype=" .. v,
      group = options_group,
    }
  )
end
--[[ vim.api.nvim_create_autocmd({"FileType","BufRead","BufNewFile"}, {
    pattern = { "qf" },
    callback = function()
      vim.cmd("set ma")
    end,
    group = options_group
}) ]]

vim.api.nvim_create_autocmd({"FileType","BufRead","BufNewFile"}, {
    pattern = {"*"},
    callback = function()
      if vim.bo.ft ~= "tex" and vim.bo.ft ~= "markdown" and vim.bo.ft ~= "text" then
        vim.cmd("setlocal nospell")
      else
        vim.cmd("setlocal spell")
        --[[ local ok, res = pcall(require("ppatault.utils").wrap_toogle)
        if not ok then
          print("WRAP ERROR")
          print(res)
        end ]]
      end
    end,
    group = options_group
})
vim.api.nvim_create_autocmd({"FileType","BufRead","BufNewFile"}, {
    pattern = { "c", "cpp"},
    command = "set sw=4",
    group   = options_group
})
vim.api.nvim_create_autocmd({"FileType","BufRead","BufNewFile"}, {
    pattern = { "markdown", "lua", "kawa", "ocaml", "why3", "lustre", "latex" },
    command = "set sw=2",
    group   = options_group
})

--[[ vim.api.nvim_create_autocmd({"FileType","BufRead","BufNewFile"}, {
    pattern = {"*.tex", "*.md", "*.txt" },
    callback = function()
      vim.cmd("setlocal spell")
      vim.cmd.set("textwidth=80")
    end,
    group = options_group
}) ]]


-- lsp loading
local ok, res = pcall(function() require("ppatault.lsp") end)

if not ok then
  print("No LSP")
  print(res)
end

function R(name)
    require("plenary.reload").reload_module(name)
end

