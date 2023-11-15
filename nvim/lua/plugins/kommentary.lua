return {
  "b3nj5m1n/kommentary",
  config = function()
    vim.keymap.set("v", "<leader>c", "<Plug>kommentary_visual_default")
    vim.keymap.set("n", "<leader>c", "<Plug>kommentary_line_default")

    local kommentary_conf = require('kommentary.config')

    kommentary_conf.configure_language("why3", {
      prefer_multi_line_comments = true,
      multi_line_comment_strings = {"(*", "*)"},
    })

    kommentary_conf.configure_language("lustre", {
      prefer_multi_line_comments = false,
      multi_line_comment_strings = {"(*", "*)"},
      single_line_comment_string = "--",
    })

    kommentary_conf.configure_language("coma", {
      prefer_multi_line_comments = false,
      prefer_single_line_comments = true,
      single_line_comment_string = "--",
    })

    kommentary_conf.configure_language("jasmin", {
      prefer_multi_line_comments = false,
      prefer_single_line_comments = true,
      single_line_comment_string = ";;",
    })

    kommentary_conf.configure_language("ocaml_interface", {
      prefer_multi_line_comments = true,
      multi_line_comment_strings = {"(*", "*)"},
    })

    kommentary_conf.configure_language("patmat", {
      prefer_multi_line_comments = true,
      multi_line_comment_strings = {"(*", "*)"},
    })

    kommentary_conf.configure_language("default", {
      use_consistent_indentation = true,
      ignore_whitespace = true,
    })
  end
}
