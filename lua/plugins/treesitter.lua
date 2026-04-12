return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  branch = "main",

  lazy = false,

  opts = {
    ensure_installed = { "bash", "c", "lua", "markdown", "javascript", "python", "rust", "wgsl" },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
