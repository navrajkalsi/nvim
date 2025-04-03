require("telescope").setup({
  extensions = {
    file_browser = {
      git_status = false,
      hijack_netrw = true,
      mappings = {
        ["i"] = {
        },
        ["n"] = {
        },
      },
    },
  },
  defaults = {
    layout_config = {
      width = 0.8,
      height = 0.7,
      preview_cutoff = 20,
    },
    sorting_strategy = "ascending",
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }, -- VS Code style borders
  },
  pickers = {
    find_files = { theme = "dropdown" }, -- VS Code-like small popup
    live_grep = { theme = "ivy" },
  },
})

require("telescope").load_extension "file_browser"
