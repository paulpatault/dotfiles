
---------------------------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = [[\]]
vim.g.langmenu = "en_US.UTF-8"
vim.g.completeopt = "menuone,noinsert,noselect"
vim.g.highlightedyank_highlight_duration = 100
vim.g.columns = 80

---------------------------------------------------------------------------------------------------

vim.wo.cursorline = true
vim.wo.winfixwidth = true
vim.wo.linebreak = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "80"
vim.wo.wrap = false
vim.wo.list = false

vim.wo.foldmethod = "marker"
vim.wo.foldmarker = "{{{|,|}}}"

---------------------------------------------------------------------------------------------------

--[[ vim.opt.grepprg = "rg --vimgrep $*"
vim.opt.grepformat = "%f:%l:%c:%m" ]]

vim.opt.shortmess = "filnxtToOFS"
vim.opt.guicursor = "i:block"
vim.opt.autoindent = true
vim.opt.modeline = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo/"

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.synmaxcol = 4000
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.hidden = true
vim.opt.lazyredraw = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.encoding = "utf-8"
vim.opt.spelllang = {"en"}
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 1
vim.opt.timeoutlen = 300
vim.opt.mouse = "nv"
vim.opt.mousescroll = "ver:3,hor:0"
vim.opt.list = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.listchars = {tab = '▸ ', trail = '·', extends='❯',precedes='❮',nbsp='±'}

vim.cmd.set("textwidth=0")

---------------------------------------------------------------------------------------------------
