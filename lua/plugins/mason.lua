return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "hadolint",
        "prettierd",
        "shfmt",
        "stylua",
        "selene",
        "shellcheck",
        "delve",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      },
    },
  },
}
