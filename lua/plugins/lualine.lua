require("lualine").setup({
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require
    local icons = require("lazyvim.config").icons
    local Util = require("lazyvim.util")
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
          {
            function()
              local package_info = package.loaded["package-info"]
              if package_info and type(package_info.get_status) == "function" then
                return package_info.get_status()
              end
              return ""
            end,
            cond = function()
              return package.loaded["package-info"] ~= nil
            end,
            color = Util.ui.fg("Statement"),
          },
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
          },
        },
        lualine_x = {
          {
            function()
              local noice = package.loaded["noice"]
              if noice and noice.api and noice.api.status and noice.api.status.command then
                if type(noice.api.status.command.get) == "function" then
                  return noice.api.status.command.get()
                elseif type(noice.api.status.command) == "function" then
                  return noice.api.status.command()
                end
              end
              return ""
            end,
            cond = function()
              local noice = package.loaded["noice"]
              return noice
                and noice.api
                and noice.api.status
                and (type(noice.api.status.command) == "table" or type(noice.api.status.command) == "function")
            end,
            color = Util.ui.fg("Statement"),
          },
          {
            function()
              local noice = package.loaded["noice"]
              if noice and noice.api and noice.api.status and noice.api.status.mode then
                if type(noice.api.status.mode.get) == "function" then
                  return noice.api.status.mode.get()
                elseif type(noice.api.status.mode) == "function" then
                  return noice.api.status.mode()
                end
              end
              return ""
            end,
            cond = function()
              local noice = package.loaded["noice"]
              return noice
                and noice.api
                and noice.api.status
                and (type(noice.api.status.mode) == "table" or type(noice.api.status.mode) == "function")
            end,
            color = Util.ui.fg("Constant"),
          },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
})
