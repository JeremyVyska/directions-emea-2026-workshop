---
bc-version: [all]
domain: performance
keywords: [setloadfields, record-read, read-only, field-loading, modify]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Use SetLoadFields for read-only record reads

## Description

SetLoadFields should be used broadly when the required fields are known, rather
than waiting for a read path to become a measured hot spot. Do not use it when
the record will be modified in the same flow; those paths should load normally.
From workshop/cards/performance/03-setloadfields-everywhere.md, Side A.

## Best Practice

On read-only record retrievals, call SetLoadFields with the fields the code
needs. Leave records that are modified in the same flow on the normal loading
path.

## Anti Pattern

Skipping SetLoadFields on read-only reads solely because the table or current
workload seems small, or using it on a record that the same flow modifies.