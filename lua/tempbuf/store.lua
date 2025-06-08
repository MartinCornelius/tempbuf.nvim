local snippets = {}
local path = vim.fn.stdpath("data") .. "/tempbuf_snippets.json"

local function load_from_disk()
  local f = io.open(path, "r")
  if f then
    local content = f:read("*a")
    f:close()
    if content ~= "" then
      local ok, decoded = pcall(vim.fn.json_decode, content)
      if ok and type(decoded) == "table" then
        snippets = decoded
      end
    end
  end
end

local function save_to_disk()
  local f = io.open(path, "w")
  if f then
    f:write(vim.fn.json_encode(snippets))
    f:close()
  end
end

local M = {}

function M.add(snippet)
  table.insert(snippets, snippet)
  save_to_disk()
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

function M.delete(index)
  index = tonumber(index)
  if index and snippets[index] then 
    table.remove(snippets, index)
    save_to_disk()
    print("Deleted snippet #" .. index)
  else 
    print("Invalid snippet index")
  end
end

function M.clear_all()
  snippets = {}
  save_to_disk()
  print("All tempbuf snippets cleared.")
end

-- Initilize on plugin load
load_from_disk()

return M
