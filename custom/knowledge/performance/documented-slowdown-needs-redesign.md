---
bc-version: [all]
domain: performance
keywords: [slowdown, trade-off, documented-decision, http-call, loop, cache, background-task]
technologies: [al]
countries: [w1]
application-area: [all]
---

# A documented slowdown still needs a redesign

## Description

A comment that accepts a large slowdown (for example "250% slower, but safer") does not make the cost acceptable when the routine is called inside loops or per-record lookups, because the cost is multiplied by every caller. A documented slowdown needs a redesign. From card workshop/cards/performance/02-slower-for-a-reason.md, Side A.

## Best Practice

When a change makes a routine markedly slower, redesign so callers do not pay per call: cache the result for the call (for example per Location and date), fetch once outside the loop, or move the work to a background task or job queue. Treat a comment justifying the slowdown as a bug report, not as an exemption. See [`documented-slowdown-needs-redesign.good.al`](documented-slowdown-needs-redesign.good.al).

## Anti Pattern

Accepting a slow routine because a comment documents the trade-off, while the routine is still called once per record in a loop or lookup (for example a synchronous HTTP call per equipment row). See [`documented-slowdown-needs-redesign.bad.al`](documented-slowdown-needs-redesign.bad.al).
