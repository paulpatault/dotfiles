local lsp = require("lspconfig")
local util = require("lspconfig.util")

-------------------------------------------------------------- DIAGNOSTIC STYLE

vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn  guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo  guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint  guibg=#1E205D guifg=#0000FF gui=bold
]]

vim.fn.sign_define("DiagnosticSignError", { text=nil, texthl="DiagnosticSignError", linehl=nil, numhl="DiagnosticLineNrError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text=nil, texthl="DiagnosticSignWarn" , linehl=nil, numhl="DiagnosticLineNrWarn" })
vim.fn.sign_define("DiagnosticSignInfo",  { text=nil, texthl="DiagnosticSignInfo" , linehl=nil, numhl="DiagnosticLineNrInfo" })
vim.fn.sign_define("DiagnosticSignHint",  { text=nil, texthl="DiagnosticSignHint" , linehl=nil, numhl="DiagnosticLineNrHint" })

vim.cmd.autocmd("ColorScheme * highlight NormalFloat guibg=#3c3836")
vim.cmd.autocmd("ColorScheme * highlight FloatBorder guifg=white guibg=#3c3836")

vim.diagnostic.config({
  underline = true,
  virtual_text = false
  -- { format = function(_) return "" end }
})

---------------------------------------------------------------------- MAPPINGS

local function gd(jump_type)
    local ok, _ = pcall(function()
      require("telescope.builtin").lsp_definitions({ jump_type=jump_type })
    end)
    if not ok then
      vim.cmd(jump_type)
      vim.lsp.buf.definition()
    end
end

local function map(bufnr, mod, key, f, desc)
  vim.keymap.set(mod, key, f, { desc = "lsp - " .. desc, buffer = bufnr, remap = false })
end


local function on_attach(client, bufnr)

  map(bufnr, "n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map(bufnr, "n", "<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame")
  map(bufnr, "n", "gr", vim.lsp.buf.references, "[G]o [R]e[F]erences")
  map(bufnr, "n", "gd", vim.lsp.buf.definition, "[G]o [D]efinition")
  map(bufnr, "n", "gD", vim.lsp.buf.declaration, "[G]o [D]efinition")
  map(bufnr, "n", "gi", vim.lsp.buf.implementation, "[G]o [I]mplementation")
  map(bufnr, "n", "gT", vim.lsp.buf.type_definition, "[G]o [T]ype definition")
  map(bufnr, "n", "dc", vim.lsp.buf.hover, "[D]iagnostic [C]heck type")
  map(bufnr, "n", "ds", vim.lsp.buf.signature_help, "[D] [S]ignature_help")
  map(bufnr, "n", "dl", vim.diagnostic.open_float, "[D]iagnostic [L]ine")
  map(bufnr, "n", "dn", vim.diagnostic.goto_next, "[D]iagnostic [N]ext")
  map(bufnr, "n", "[d", vim.diagnostic.goto_prev, "[D]iagnostic [prev")
  map(bufnr, "n", "]d", vim.diagnostic.goto_next, "[D]iagnostic ]next")
  map(bufnr, "n", "<leader>d",  function()
    if vim.diagnostic.is_disabled() then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end, "[D]iagnostic [T]oogle")

  map(bufnr, "n", "<leader>dsh", function() vim.lsp.semantic_tokens.stop(bufnr, client["id"]) end, "[D]isable [S]emantic [H]ighlight")
  map(bufnr, "n", "<leader>esh", function() vim.lsp.semantic_tokens.start(bufnr, client["id"]) end, "[E]nable [S]emantic [H]ighlight")

  map(bufnr, "n", "gdv", function()
         local ok, _ = pcall(function() gd("vsplit") end)
         if not ok then print("Internal Error") end
     end,
     "[G]o [D]efinition")

  map(bufnr, "n", "gds", function()
         local ok, _ = pcall(function() gd("split") end)
         if not ok then print("Internal Error") end
     end,
     "[G]o [D]efinition")

  -- disable semantic highlight
  client.server_capabilities.semanticTokensProvider = nil
  -- client.server_capabilities.semanticTokens.serverCancelSupport = true
  -- client.server_capabilities.semanticTokens.augmentsSyntaxTokens = false
  -- vim.cmd([[normal \<leader>dsh]])
end

-------------------------------------------------------------------------- WHY3
vim.lsp.set_log_level("debug")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

--[[ local function on_attach_why3(client, bufnr)
  on_attach(client, bufnr)

  map(bufnr, "n", "<C-R>", function()
    local uri = client.workspace_folders[1].uri
    local ok = vim.lsp.buf_notify(0, "proof/reloadSession", { uri })
    if ok then
      print("Session reloaded")
    else
      local err = string.format("[ERROR] Notification proof/reloadSession failed (with uri=%s)", uri)
      error(err)
    end
  end, "[R]eload Session")

end ]]

--[[ require("whycode").setup({
  lsp = {
    on_attach = on_attach_why3,
    cmd = { "/Users/paulpatault/d/git/whycode/extension/whycode2" }, --path to executable
    verbose = false,
    -- capabilities = capabilities
  },
}) ]]


------------------------------------------------------------------------- Scala

lsp.metals.setup({ on_attach = on_attach })

------------------------------------------------------------------------- C/C++

lsp.clangd.setup({
  default_config = {
    cmd = { "clangd", "--background-index" };
    filetypes = { "c", "cpp", "objc", "objcpp" };
    root_dir = function(fname)
      return util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
  on_attach = on_attach
})

-------------------------------------------------------------------------- RUST

lsp.rust_analyzer.setup({ on_attach = on_attach })

------------------------------------------------------------------------- OCAML

lsp.ocamllsp.setup({
  cmd = { "ocamllsp", "--fallback-read-dot-merlin" };
  filetypes = {"ocaml", "ocaml.interface", "ocaml.ocamllex", "ocaml.menhir", "menhir"};
  root_dir = function(fname)
    return
    util.find_git_ancestor(fname)
    or vim.loop.os_homedir()
    or util.root_pattern("*.opam", ".git", "dune-project")
  end;
  on_attach = on_attach;
  commands = { }
})
    --[[ SemanticTokensToogle = {
      vim.cmd("<leader>dsh")
      local ok, _ = pcall (function() vim.lsp.semantic_tokens.start(bufnr, client["id"]) end)
      if not ok then print("[Internal Error] semantic highlight")
      else print("SH ok")
      end
    } ]]

-------------------------------------------------------------------------- HTML

local hcap = vim.lsp.protocol.make_client_capabilities()
hcap.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup({ on_attach = on_attach; capabilities = hcap })

------------------------------------------------------------------------- LATEX

lsp.texlab.setup({ on_attach = on_attach })

--------------------------------------------------------------------------- LUA
lsp.lua_ls.setup ({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", },
      diagnostics = { globals = {"vim"}, },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), },
      telemetry = { enable = false, },
    },
  },
})

------------------------------------------------------------------------ PYTHON
lsp.pylsp.setup({ on_attach = on_attach })

----------------------------------------------------------------------- HASKELL
-- lsp.hls.setup({ on_attach = on_attach })

require('lspconfig')['hls'].setup{
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  -- cmd = { "haskell-language-server-wrapper" }
}

---------------------------------------------------------------------------- JS
local on_attach_js = function(_, bufnr)
  on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lsp.tsserver.setup({
    on_attach = on_attach_js;
    flags = {debounce_text_changes = 150}
})

--------------------------------------------------------------------------- COQ

require("coq-lsp").setup ({
  coq_lsp_nvim = {},
  lsp = {
    on_attach = on_attach,
    init_options = { show_notices_as_diagnostics = true, },
  },
})
