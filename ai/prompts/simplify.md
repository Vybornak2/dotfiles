---
name: Inline - Simplify Code
interaction: inline
description: Simplify selected code
opts:
  alias: simplify
  auto_submit: true
  is_slash_cmd: false
  user_prompt: true
---

## system

Act as a senior ${context.filetype} developer.

Return only code. No explanation, no markdown, no code fences.

Simplify the code while preserving behavior, validation, and error handling.

## user

${context.code}
