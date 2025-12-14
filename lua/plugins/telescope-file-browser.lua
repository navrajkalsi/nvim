return {
  'nvim-telescope/telescope-file-browser.nvim',

  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim'
  },

  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          hijack_netrw = true,
          mappings = {
            ["i"] = { },
            ["n"] = { },
          },
        },
      },
      defaults = {
        layout_config = {
          width = 0.8,
          height = 0.7,
          preview_cutoff = 20,
        },
        -- sorting_strategy = "ascending",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }, -- VS Code style borders
      }
    }

    require('telescope').load_extension 'file_browser'
  end
}
