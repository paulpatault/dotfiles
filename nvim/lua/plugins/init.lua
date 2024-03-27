return {

    -- Dependencies
    "nvim-lua/plenary.nvim",

    -- LSP
    "neovim/nvim-lspconfig",
    "ocaml/ocaml-lsp",
    "paulpatault/whycode",
    -- "scalameta/nvim-metals",
    "sublimelsp/LSP-pyls",
    "tomtomjhj/coq-lsp.nvim",


    -- Languages
    "bohlender/vim-smt2",
    "fladson/vim-kitty",
    "isti115/agda.nvim",
    "MTDL9/vim-log-highlighting",
    "neovimhaskell/haskell-vim",
    "bfontaine/conflicts.vim",
    "ocaml/vim-ocaml",
    "ELLIOTTCABLE/vim-menhir",
    "whonore/Coqtail",
    -- "lepture/vim-jinja",
    -- "mechatroner/rainbow_csv",
    -- "wreien/vim-jasmin",
    -- "guersam/vim-j",

    -- Colors
    "rafi/awesome-vim-colorschemes",
    "ellisonleao/gruvbox.nvim",
    "kyazdani42/nvim-web-devicons",
    "lilydjwg/colorizer",

    -- Other
    "GCBallesteros/jupytext.vim",
    "alec-gibson/nvim-tetris",
    "cohama/lexima.vim",
    "famiu/bufdelete.nvim",
    "folke/zen-mode.nvim",
    "junegunn/vim-peekaboo",
    "lewis6991/impatient.nvim",
    "machakann/vim-highlightedyank",
    "machakann/vim-sandwich",
    "machakann/vim-swap",
    "neomake/neomake",
    "sindrets/diffview.nvim",
    "tpope/vim-obsession",
    "wellle/targets.vim",

    { "GCBallesteros/vim-textobj-hydrogen", dependencies = "kana/vim-textobj-user" },
}

--[[ return {
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
} ]]
