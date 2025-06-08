local store = require("tempbuf.store")

local M = {}

function M.pick()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local previewers = require("telescope.previewers")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local snippets = store.get_all()

  pickers.new({}, {
    prompt_title = "Tempbuf Snippets",

    finder = finders.new_table {
      results = snippets,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name or (entry.filetype .. " - " .. entry.timestamp),
          ordinal = entry.name or entry.timestamp,
        }
      end,
    },

    previewer = previewers.new_buffer_previewer({
      define_preview = function(self, entry)
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.content)
        vim.bo[self.state.bufnr].filetype = entry.value.filetype
      end,
    }),

    sorter = conf.generic_sorter({}),

    attach_mappings = function(_, map)
      actions.select_default:replace(function()
        local entry = action_state.get_selected_entry()
        local snip = entry.value
        vim.cmd("enew!")
        vim.bo.filetype = snip.filetype
        vim.api.nvim_buf_set_lines(0, 0, -1, false, snip.content)
      end)
      return true
    end,

  }):find()
end

return M
