return {
   "laytan/cloak.nvim",
   cmd = "CloakEnable",
   opts = {
      cloak_character = '*',
      highlight_group = 'Comment',
      patterns = {
         {
            file_pattern = '.env*',
            cloak_pattern = { '=.+', ':.+' },
         },
      },
   }
}
