return {
   "folke/trouble.nvim",
   enabled = true,
   dependencies = "nvim-tree/nvim-web-devicons",
   keys = {
      {
         "<leader>xx",
         function()
            require("trouble").toggle("workspace_diagnostics")
         end,
         desc = "Trouble toggle"
      },
      {
         "<leader>xn",
         function()
            require("trouble").next({ skip_groups = true, jump = true })
         end,
         desc = "Trouble toggle next"
      },
      {
         "<leader>xp",
         function()
            require("trouble").previous({ skip_groups = true, jump = true })
         end,
         desc = "Trouble toggle previous"
      }
   },
   opts = {
      use_diagnostic_signs = true,
   }
}
