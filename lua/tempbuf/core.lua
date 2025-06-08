local store = require("tempbuf.store")

local M = {}

function M.create(filetype)
  vim.cmd("enew")
  if filetype and tiletype ~= "" then
    vim.bo.filetype = filetype
  end
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "hide"
  vim.bo.swapfile = false
end

function M.save()
  local content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local filetype = vim.bo.filetype or "scratch"
  if filetype == "" then
    filetype = "scratch"
  end
  local snippet = {
    content = content,
    filetype = filetype,
    timestamp = os.date("%Y-%m-%d %H:%M:%S")
  }
  store.add(snippet)
  print("Snippet saved as #" .. store.count())
end

function M.list()
  local snippets = store.get_all()
  for i, snip in ipairs(snippets) do
    print(i .. ": " .. snip.filetype .. " - " .. snip.timestamp)
  end
end

function M.load(index)
  local snippet = store.get(index)
  if not snippet then
    print("Invalid snippet index")
    return
  end
  vim.cmd("enew")
  vim.bo.filetype = snippet.filetype
  vim.api.nvim_buf_set_lines(0, 0, -1, false, snippet.content)
end

function M.delete(index)
  store.delete(index)
end

function M.clear_all()
  store.clear_all()
end

return M
