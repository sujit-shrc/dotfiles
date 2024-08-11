return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "gitignore",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- MDX
        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
  {
    "nvim-treesitter/playground",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
}
