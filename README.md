# tempbuf.nvim

A minimal Neovim plugin for working with temporary scratch buffers.

Useful for testing code snippets, writing quick notes, or trying out ideas without touching your project files.

## Features

- `:Tempbuf [filetype]` - Open a scratch buffer with optional filetype
- `:TempbufSave` - Save the buffer contents to an local persistent snippet store
- `:TempbufList` - List saved snippets
- `:TempbufLoad [id]` - Load a previously saved snippet into a new buffer
- `:TempbufDelete [id]` - Delete a specific snippet
- `:TempbufClearAll` - Clear all snippets

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "martincornelius/tempbuf.nvim",
}
```

## Commands
| Command            | Description                                    |
| ----------------   | ---------------------------------------------- |
| `:Tempbuf`         | Open empty buffer (optionally: `:Tempbuf lua`) |
| `:TempbufSave`     | Save current buffer content                    |
| `:TempbufList`     | Show list of saved snippets                    |
| `:TempbufLoad 1`   | Load snippet with ID 1                         |
| `:TempbufDelete 1` | Delete snippet with ID 1                       |
| `:TempbufClearAll` | Clear all saved snippets                       |

