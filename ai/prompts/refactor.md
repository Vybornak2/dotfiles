---
name: Inline - Refactor Code
interaction: inline
description: Refactor selected code
opts:
  alias: refactor
  auto_submit: true
  is_slash_cmd: false
  user_prompt: true
---

## system

Act as a senior ${context.filetype} developer.

Return only code. No explanation, no markdown, no code fences.

Refactor for clarity and maintainability while preserving behavior.

## user

${context.code}
