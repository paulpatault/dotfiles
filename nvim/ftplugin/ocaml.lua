local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_set_var("python_host_prog", "/usr/bin/python")
vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
vim.api.nvim_set_var("merlin_python_version", 3)

vim.api.nvim_set_var("opamshare", opam_share)
vim.opt.rtp:append(opam_share .. "/merlin/vim/doc")
vim.opt.rtp:append(opam_share .. "/merlin/vim")
vim.opt.rtp:append(opam_share .. "/merlin/vimbufsync")
vim.opt.rtp:append(opam_share .. "/ocp-indent/vim")

vim.api.nvim_set_var("float_term_ocaml_utop", false)

local function utopterm(mode)
  if vim.api.nvim_get_var("float_term_ocaml_utop") then
    local ok, _ = pcall(function() vim.cmd("FloatermShow utopterm_" .. mode) end)
    if not ok then
       vim.api.nvim_set_var("float_term_ocaml_utop", false)
       utopterm(mode)
    end
  else
    vim.cmd("FloatermNew --name=utopterm_" .. mode .. " --wintype=" .. mode .. " utop")
    vim.api.nvim_set_var("float_term_ocaml_utop", true)
  end
end

vim.api.nvim_create_autocmd( {"BufRead","BufWinEnter","FileType"}, {
  group = vim.api.nvim_create_augroup("ocaml_grp", {clear = true}),
  pattern = { "*.ml", "*.mli" }, -- "ocaml_interface"
  callback = function ()
    if vim.bo.ft ~= "ocaml" then return end

    pcall(vim.cmd("unlet b:did_indent"))

    vim.cmd.source(opam_share .. "/ocp-indent/vim/indent/ocaml.vim")
    vim.opt.iskeyword:append("_")

    vim.keymap.set("n", "<localleader>ff", function() utopterm("float") end, { desc = "OCaml - [F]loaterm with utop ([F]loat)" })
    vim.keymap.set("n", "<localleader>fs", function() utopterm("split") end, { desc = "OCaml - [F]loaterm with utop ([S]plit)" })
    vim.keymap.set("n", "<localleader>fv", function() utopterm("vsplit") end, { desc = "OCaml - [F]loaterm with utop ([V]split)" })

    vim.keymap.set("n", "<localleader>i", function() vim.cmd("!ocaml %") end, { desc = "OCaml - [I]nterpret file" })

    -- switch
    vim.keymap.set("n", "<localleader>s", function() vim.call("OCaml_switch", 0) end)
    vim.keymap.set("n", "<localleader>S", function() vim.call("OCaml_switch", 1) end)

    vim.keymap.set("i", "<C-a>", " assert false", { desc = "OCaml - insert [A]ssert false" })
    -- vim.keymap.set("n", "<C-a>", "a assert false<ESC>", { desc = "OCaml - insert [A]ssert false" })

  end
})

-- nvim_set_var("ocaml_noend_error", 1)
-- nvim_set_var("ocaml_revised", 1)

vim.g.neoformat_ocaml_ocamlformat = {
  exe = "ocamlformat",
  no_append = true,
  stdin = true,
  args = {
    "--disable-outside-detected-project",
    "--name",
    [[%:p"]],
    "-"
  }
}

vim.g.neoformat_enabled_ocaml = { "ocamlformat" }

--[[ vim.keymap.set("n", "ml", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":ML " .. filename)
end)

vim.keymap.set("n", "mli", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":MLI " .. filename)
end) ]]
