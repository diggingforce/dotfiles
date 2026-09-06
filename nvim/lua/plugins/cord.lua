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
        return "Editing " .. opts.filename
      end,
      viewing = function(opts)
        return "Viewing " .. opts.filename
      end,
    },
  },
}
