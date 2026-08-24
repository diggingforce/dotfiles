return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  event = "VeryLazy",
  opts = {
    display = {
      theme = "minecraft",
    },
    text = {
      editing = function(opts)
        local agentic_ft = {
          AgenticChat = true,
          AgenticInput = true,
          AgenticCode = true,
          AgenticFiles = true,
          AgenticDiagnostics = true,
        }
        if agentic_ft[opts.filetype] then
          return true
        end
        return "Editing " .. opts.filename
      end,
      viewing = function(opts)
        local agentic_ft = {
          AgenticChat = true,
          AgenticInput = true,
          AgenticCode = true,
          AgenticFiles = true,
          AgenticDiagnostics = true,
        }
        if agentic_ft[opts.filetype] then
          return true
        end
        return "Viewing " .. opts.filename
      end,
    },
  },
}
