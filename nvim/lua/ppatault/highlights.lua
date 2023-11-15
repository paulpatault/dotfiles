
local function set_hl(name, opts) vim.api.nvim_set_hl(0, name, opts) end

local function cocaml(cs)

  if vim.o.background ~= "dark" or cs ~= "gruvbox" then return end

  set_hl("ocamlKeyword", { link = "GruvboxRedBold" })

  local strs = {
    "ocamlFullMod";
    "ocamlFuncWith";
    "ocamlGenMod";
    "ocamlMPRestr3";
    "ocamlMTDef";
    "ocamlMethod";
    "ocamlModParam";
    "ocamlModParam1";
    "ocamlModPath";
    "ocamlModType";
    "ocamlModTypeRestr";
    "ocamlModule";
    "ocamlObject";
    "ocamlScript";
    "ocamlWith";
  }

  for _, str in ipairs(strs) do
    set_hl(str, { fg = "#d5c4a1", bold = true, italic = true })
  end
end

local function ccoq()
  if os.getenv("THEME_BG") == "light" then
    set_hl("CoqtailSent",    { bg = "#fff6c0" })
    set_hl("CoqtailChecked", { bg = "#bcffbe" })
  else
    set_hl("Keyword",    { link = "GruvboxRedBold" })
    set_hl("PreProc",    { link = "GruvboxAquaBold" })
    set_hl("Type",       { link = "GruvboxYellowBold" })
    set_hl("Underlined", { link = "GruvboxBlueBold" })
    set_hl("CoqtailSent",    { bg = "#574300" })
    set_hl("CoqtailChecked", { bg = "#30423c" })
  end
end

local undergrp = vim.api.nvim_create_augroup("UndercurlDiags", {clear = true})

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    group = undergrp,
    pattern = { "*" },
    callback = function()
      set_hl("DiagnosticUnderlineWarning",     { undercurl = true, })
      set_hl("DiagnosticUnderlineError",       { undercurl = true, sp = "#fb4934" })
      set_hl("DiagnosticUnderlineHint",        { undercurl = true })
      set_hl("DiagnosticUnderlineInformation", { undercurl = true })
      set_hl("QuickScopePrimary",              { underline = true })
      set_hl("QuickScopeSecondary",            { undercurl = true })

      -- CMP
      local cs = os.getenv("COLORSCHEME")
      if cs == "gruvbox" then
        set_hl("CmpItemAbbr", { fg = "#a89984" })
        set_hl("CmpItemKind", { fg = "#fabd2f" })
        set_hl("CmpItemMenu", { fg = "#83a598" })
      end

      vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")

      if vim.bo.filetype == "ocaml" then cocaml(cs) end
      if vim.bo.filetype == "coq" then ccoq() end

    end
  }
)

vim.api.nvim_create_autocmd("Filetype",
  {
    group = undergrp,
    pattern = { "coq" },
    callback = ccoq
  })

vim.api.nvim_create_autocmd( { "Filetype" },
  {
    group = undergrp,
    pattern = { "scala" },
    callback = function()
      set_hl("scalaKeyword", { link = "GruvboxRedBold" })
      set_hl("scalaKeywordModifier", { link = "GruvboxRedBold" })
      set_hl("Keyword", { link = "GruvboxRedBold" })
    end
  })

vim.api.nvim_create_autocmd( { "Filetype" },
  {
    group = undergrp,
    pattern = { "ocaml", "ocaml.interface", "ocaml.ocamllex" },
    callback = cocaml
  })

