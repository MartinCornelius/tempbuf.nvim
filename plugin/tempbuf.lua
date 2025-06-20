local tempbuf = require("tempbuf")

vim.api.nvim_create_user_command("Tempbuf", function(opts)
  tempbuf.create(opts.args)
end, { nargs = "?" })

vim.api.nvim_create_user_command("TempbufSave", function()
  tempbuf.save()
end, {})

vim.api.nvim_create_user_command("TempbufList", function()
  tempbuf.list()
end, {})

vim.api.nvim_create_user_command("TempbufLoad", function(opts)
  tempbuf.load(tonumber(opts.args))
end, { nargs = 1 })

vim.api.nvim_create_user_command("TempbufDelete", function(opts)
  tempbuf.delete(tonumber(opts.args))
end, { nargs = 1 })

vim.api.nvim_create_user_command("TempbufClearAll", function()
  tempbuf.clear_all()
end, {})

vim.api.nvim_create_user_command("TempbufPick", function()
  require("tempbuf.ui").pick()
end, {})

