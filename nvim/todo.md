# TODOs

## Bugs

- codecompanion generate commit message doesn't work

## Keymaps

- unstage hunk (GitSigns)
- unstage buffer (GitSigns)

## Plugins

- nvim-dap 
- undotree
- neotest

## Learn

- [Neovim terminal](https://www.youtube.com/watch?v=ooTcnx066Do)
- `:help lua-guide`
- check one additional source for learning lua and neovim configuration

## Code Companion

- add custom agent-group
- refer to `codecompanion-usage-agents-and-tools`

```lua
groups = {
  ["my_agent"] = {
    description = "My custom agent",
    system_prompt = function(group, ctx)
      return string.format(
        "You are a coding agent. The date is %s. The user is on %s.",
        ctx.date,
        ctx.os
      )
    end,
    tools = { "read_file", "insert_edit_into_file", "run_command" },
    opts = {
      collapse_tools = true,
      ignore_system_prompt = true, -- Remove the chat's default system prompt
      ignore_tool_system_prompt = true, -- Remove the default tool system prompt
    },
  },
},
```

## Optional

- try Qwen2.5
- try ClaudeCode ingetration

