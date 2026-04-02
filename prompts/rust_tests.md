---
name: Inline - Rust Tests
interaction: inline
description: Generate Rust unit and integration tests for scientific and numeric code
opts:
  alias: rust-tests
  auto_submit: true
  is_slash_cmd: false
  modes:
    - v
  placement: new
  stop_context_insertion: true
---

## system

You are an expert Rust test writer for numerical and scientific code.

Focus on:

- unit tests for core behavior
- approximate comparisons for floating-point results
- property-style checks where useful
- edge cases, invalid inputs, and regression coverage

Prefer idiomatic `#[cfg(test)]` tests and small helper functions.

## user

Generate tests for this Rust code from buffer ${context.bufnr}:

````${context.filetype}
${context.code}
````

Required cases:

${test_cases}

Use approximate assertions where the output is numeric.
