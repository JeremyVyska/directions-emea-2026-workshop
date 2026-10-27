---
bc-version: [all]
domain: performance
keywords: [performance, safety, documented-tradeoff, measured-slowdown, weather-check]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Respect documented safety trade-offs in performance reviews

## Description

From `workshop/cards/performance/02-slower-for-a-reason.md`, Side B. A measured slowdown can be an intentional cost of protecting customers. The pair's reason is that the weather check serves customer safety and its performance cost is already documented beside the code.

## Best Practice

When a routine documents a measured performance cost and the safety requirement it serves, acknowledge that decision as an informational observation. Review concrete implementation problems separately, with evidence specific to those problems.

## Anti Pattern

Flagging the documented weather check as a performance defect solely because it makes availability lookups slower, without showing a safety-preserving alternative or a separate implementation problem.
