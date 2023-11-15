return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-file-browser.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
  config = function()

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "p + [F]iles" })
    vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "p + [H]elp tags" })
    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "p + [G]it files" })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "p + [B]uffer" })
    vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "p + [D]iagnostics" })
    vim.keymap.set("n", "<leader>pr", builtin.live_grep, { desc = "p + [R]ipgrep" })
    vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "p + [K]eymaps" })
    vim.keymap.set("n", "<leader>pq", builtin.quickfix, { desc = "p + [Q]uickfix" })
    vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "p + [S]tring grep search" })
    vim.keymap.set("n", "<leader>p",  builtin.builtin, { desc = "p (telescope base)" })
    vim.keymap.set("n", "<leader>pds", builtin.lsp_document_symbols, { desc = "p + [D]ocument + [S]ymbols" })
    vim.keymap.set("n", "<leader>pws", builtin.lsp_workspace_symbols, { desc = "p + [W]orkspace + [S]ymbols" })
    vim.keymap.set("n", "<leader>pm", builtin.marks, { desc = "p + [M]arks" })

    vim.keymap.set("n", "<leader>pc", function() builtin.colorscheme({enable_preview=true}) end, { desc = "p + [C]olorscheme"})

    local telescope = require('telescope')

    require('plenary.filetype').add_file({
      ['md']  = 'markdown',
      ['v']   = 'coq',
      ['lus'] = 'lustre',
      ['ept'] = 'lustre'})

      telescope.setup({
        pickers = {
          keymaps   = {
            layout_config = { width = 0.7 },
            theme = "dropdown",
          },
          find_files  = { theme = "dropdown" },
          git_files   = { theme = "dropdown" },
          buffers     = { theme = "dropdown" },
          diagnostics = { theme = "dropdown" },
          live_grep   = { theme = "dropdown" },
          help_tags   = { theme = "dropdown" },
          quickfix    = { theme = "dropdown" },
          builtin     = { theme = "dropdown" },
          lsp_document_symbols = { theme ="dropdown" },
          lsp_workspace_symbols = { theme = "dropdown" },
        },
        defaults = {
          file_ignore_patterns = {
            [[undo/%.*]], [[_build/*]],
            [[%.key]],
            [[%.agdai]],
            [[_opam/*]], [[%.cmo]], [[%.cmi]], [[%.cmx]],
            [[%.o]],
            [[%.gz]],
            [[%.cmt]], [[%.cmti]],
            [[%.pyc]],
            [[%.aux]],
            [[%.jpg]], [[%.png]],
            [[%.aux]], [[%.fdb_latexmk]], [[%.fls]], [[%.log]], [[%.synctex.gz]],
            [[%.bbl]], [[%.bcf]], [[%.blg]], [[%.out]], [[%.toc]], [[%.vrb]],
            [[%.run.xml]], [[%.pdf]]},

            file_sorter = require("telescope.sorters").get_fzy_sorter,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

          },
          extensions = {
            fzy_native = {
              override_generic_sorter = false,
              override_file_sorter = true
            }
          },
        })

        pcall(telescope.load_extension, "fzy_native")
      end
    }
