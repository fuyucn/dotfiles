return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "bufWinEnter",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs"
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "html",
        "css",
        "scss",
        "typescript",
        "tsx",
        "python",
        "markdown",
        "markdown_inline",
        "bash",
        "json",
        'jsonc',
        'jsdoc',
        'diff'
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = { enable = true },
      autopairs = {
        enable = true
      },
      autotag = {
        enable = true
      },
    })
  end
}
