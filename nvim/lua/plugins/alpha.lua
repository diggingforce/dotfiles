return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function(_, dashboard)
      dashboard = dashboard or require("alpha.themes.dashboard")

      local custom_ascii = {
        [[                                   ]],
        [[  ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
        [[ •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪ ]],
        [[ ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
        [[ ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
        [[ ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
        [[                                   ]],
      }

      local fastfetch_lines = {}
      local handle = io.popen("fastfetch -l none --pipe 2>/dev/null")
      if handle then
        local result = handle:read("*a") or ""
        handle:close()
        result = string.gsub(result, "\27%[[0-9;]*[mKABCDEFGHfJ]", "")
        result = result:match("^%s*(.-)%s*$") or ""
        if result ~= "" then
          fastfetch_lines = vim.split(result, "\n")
        end
      end

      vim.api.nvim_set_hl(0, "AlphaWhiteText", { fg = "#FFFFFF" })

      dashboard.section.header.val = custom_ascii
      dashboard.section.header.opts.hl = "AlphaWhiteText"

      local fastfetch_section = {
        type = "text",
        val = fastfetch_lines,
        opts = {
          position = "center",
          hl = "AlphaWhiteText",
        },
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", "󰈔  New File", "<cmd>ene | startinsert<CR>"),
        dashboard.button("p", "󰉋  Load Projects", "<cmd>e ~/Projects<CR>"),
        dashboard.button("q", "󰈆  Quit", "<cmd>qa<CR>"),
      }
      dashboard.section.buttons.opts.spacing = 0

      local total_height = #custom_ascii + 1 + #fastfetch_lines + 1 + 3

      dashboard.config.layout = {
        {
          type = "padding",
          val = function()
            return math.max(0, math.floor((vim.o.lines - total_height) / 2))
          end,
        },
        dashboard.section.header,
        { type = "padding", val = 1 },
        fastfetch_section,
        { type = "padding", val = 1 },
        dashboard.section.buttons,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      local laststatus = 3

      local group = vim.api.nvim_create_augroup("alpha_hide_statusline", { clear = true })

      vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "User" }, {
        group = group,
        pattern = { "alpha", "AlphaReady", "VeryLazy" },
        callback = function()
          if vim.bo.filetype == "alpha" then
            vim.opt.laststatus = 0
          end
        end,
      })

      vim.api.nvim_create_autocmd("BufUnload", {
        group = group,
        callback = function(ev)
          if vim.bo[ev.buf].filetype == "alpha" then
            vim.opt.laststatus = laststatus
          end
        end,
      })

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)
    end,
  },
}
