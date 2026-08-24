return {
  "carlos-algms/agentic.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "opencode-acp",
  },
  keys = {
    {
      "<C-\\>",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "v", "i" },
      desc = "Toggle Agentic Chat",
    },
    {
      "<C-'>",
      function()
        require("agentic").add_selection_or_file_to_context()
      end,
      mode = { "n", "v" },
      desc = "Add selection/file to Agentic context",
    },
    {
      "<C-,>",
      function()
        require("agentic").new_session()
      end,
      mode = { "n", "v", "i" },
      desc = "New Agentic Session",
    },
  },
}
