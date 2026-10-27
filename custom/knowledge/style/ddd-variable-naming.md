---
bc-version: [all]
domain: style
keywords: [variable-naming, ddd-prefix, local-variables, identifier-format]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Prefix variables with DDD and suffix locals with Local

## Description

Consistent variable names make code easier to read. This free-form team rule
sets a shared prefix and distinguishes local variables by their suffix.

## Best Practice

Start every variable name with `DDD`. For local variables, also end the name
with `Local`. Do not include spaces in variable names.

## Anti Pattern

Do not declare variables without the `DDD` prefix, omit the `Local` suffix from
local variables, or include spaces in variable names; inconsistent names make
code harder to read.
