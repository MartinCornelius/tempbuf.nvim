local snippets = {}

local M = {}

function M.add(snippet)
  table.insert(snippets, snippet)
end

function M.get(index)
  return snippets[tonumber(index)]
end

function M.get_all()
  return snippets
end

function M.count()
  return #snippets
end

return M
