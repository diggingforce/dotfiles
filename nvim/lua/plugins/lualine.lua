return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local colors = {
        bg = "NONE",
        black = "#191919",
        white = "#ffffff",
        gray = "#2e2e2e",
        light_gray = "#888888",
        offwhite = "#d9d7d6",
      }

      local monochrome = {
        normal = {
          a = { fg = colors.black, bg = colors.white, gui = "bold" },
          b = { fg = colors.white, bg = colors.gray },
          c = { fg = colors.offwhite, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.black, bg = colors.offwhite, gui = "bold" },
          b = { fg = colors.white, bg = colors.gray },
          c = { fg = colors.offwhite, bg = colors.bg },
        },
        visual = {
          a = { fg = colors.black, bg = colors.light_gray, gui = "bold" },
          b = { fg = colors.white, bg = colors.gray },
          c = { fg = colors.offwhite, bg = colors.bg },
        },
        replace = {
          a = { fg = colors.white, bg = colors.gray, gui = "bold" },
          b = { fg = colors.white, bg = colors.gray },
          c = { fg = colors.offwhite, bg = colors.bg },
        },
        command = {
          a = { fg = colors.black, bg = colors.white, gui = "bold" },
          b = { fg = colors.white, bg = colors.gray },
          c = { fg = colors.offwhite, bg = colors.bg },
        },
        inactive = {
          a = { fg = colors.light_gray, bg = colors.bg, gui = "bold" },
          b = { fg = colors.light_gray, bg = colors.bg },
          c = { fg = colors.light_gray, bg = colors.bg },
        },
      }

      opts.options = opts.options or {}
      opts.options.theme = monochrome
    end,
  },
}
