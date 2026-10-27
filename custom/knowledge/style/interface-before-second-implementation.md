---
bc-version: [all]
domain: style
keywords: [interface, implementation, dependency-inversion, extensibility, contract]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Define the interface before a second implementation exists

## Description

Using an interface from the first implementation lets callers and tests depend
on a stable contract rather than a concrete codeunit. Introducing that contract
later can require breaking changes. From
`workshop/cards/code-quality/04-interface-before-second-impl.md`, Side A.

## Best Practice

When a codeunit provides a service that callers or tests should be able to
substitute, define its interface with the first implementation and have the
codeunit implement it. Have consumers depend on that interface, even when only
one implementation currently exists.

## Anti Pattern

Do not make consumers depend directly on a concrete codeunit when the service
is intended to be replaceable. Waiting for a second implementation to introduce
the interface can require changing existing consumers and their contracts.
