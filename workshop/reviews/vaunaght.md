---
reviewed_with: GitHub Copilot (agent mode)
reviewed_files:
  - workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al
  - workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al
  - workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al
  - workshop/AmuseYou/RentalOperations/src/BookingList.Page.al
  - workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al
  - workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al
  - workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al
  - workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al
  - workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al
  - workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 1
blockers: 1
---

# BCQuality Review: vaunaght

## Blockers
- microsoft/knowledge/security/secrettext-with-httpclient.md · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37 · An API credential is embedded in a source Label and concatenated into plain-text request URIs passed to HttpClient.Get; use SecretText and the secret-aware request URI API. · microsoft/knowledge/security/secrettext-with-httpclient.md

## Findings
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39 · Test fixtures use hardcoded Booking primary keys, which can collide across parallel or repeated runs; generate unique fixture keys instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 57, 58, 59, 61 · Test fixtures use hardcoded Equipment and Booking primary keys, which can collide across parallel or repeated runs; generate unique fixture keys instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47 · Test fixtures use hardcoded Equipment and Booking primary keys, which can collide across parallel or repeated runs; generate unique fixture keys instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 89 · Test fixtures use hardcoded Equipment and Booking primary keys, which can collide across parallel or repeated runs; generate unique fixture keys instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96 · The negative test accepts any error from CreateBooking, so an unrelated failure can make the overlap test pass; assert the expected error or code. · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · Commit runs inside an unbounded FindSet loop without persisted progress, creating a transaction per row and making retries reprocess committed work. · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:59 · The Last Maintenance Date predicate is evaluated inside an unfiltered FindSet(true), so every equipment row is read and locked before nonmatching rows are discarded; apply the date filter before iteration. · microsoft/knowledge/performance/apply-filters-before-iterating.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:75, 77 · GetTotalRevenue loops to total the stored Total Amount field when the filtered total can be calculated with CalcSums. · microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md
- major · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:33, 50, 65, 81 · These reads use known subsets of Booking or Equipment fields but load full records; use SetLoadFields consistently for the applicable reads. · custom/knowledge/performance/setloadfields-for-applicable-reads.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:13, 57, 75 · These reads use known subsets of Equipment or Booking fields but load full records; use SetLoadFields consistently for the applicable reads. · custom/knowledge/performance/setloadfields-for-applicable-reads.md
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:46 · The test loads a full Booking record but reads only Status; use SetLoadFields for this known-subset read. · custom/knowledge/performance/setloadfields-for-applicable-reads.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:35, 54 · These tests load full Booking records but read only Total Amount or Status; use SetLoadFields for these known-subset reads. · custom/knowledge/performance/setloadfields-for-applicable-reads.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:41, 49, 60 · These tests load full Booking records but read only Total Amount and Status; use SetLoadFields for these known-subset reads. · custom/knowledge/performance/setloadfields-for-applicable-reads.md
- major · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:15 · OnUpgradePerCompany performs ModifyAll inline instead of dispatching a named upgrade helper, mixing orchestration and migration implementation. · microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61 · Agent finding: the call passes Equipment1 (Record Equipment) to a helper requiring var Booking: Record Booking, so the test cannot compile; pass a Booking record. · agent finding

Suppressed: microsoft/knowledge/performance/use-setloadfields-for-partial-records.md (custom rule takes precedence).

## Verdicts
Not triaged yet.