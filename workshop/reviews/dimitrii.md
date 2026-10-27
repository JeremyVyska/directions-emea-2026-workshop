---
reviewed_with: GitHub Copilot (agent mode)
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 0
blockers: 0
---

# BCQuality Review: dimitrii

## Blockers

None.

## Findings

- major · high · `workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37` · The API credential is held in a plain Label and concatenated into request URIs sent through `HttpClient.Get`, exposing it as ordinary text and in the URI. Carry it as `SecretText` through the secret-aware request URI API. · `microsoft/knowledge/security/secrettext-with-httpclient.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 62` · `Commit()` runs once per matching Equipment row inside an unbounded `FindSet(true)` loop, without a persisted checkpoint. This fragments the operation and leaves partial progress if a later row fails; remove the per-row commits or use bounded, restart-safe batches. · `microsoft/knowledge/performance/avoid-commit-inside-loops.md`
- major · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96, 97` · The negative test accepts any error from `CreateBooking`; an unrelated failure can satisfy the test without proving that overlapping bookings are rejected. Assert the expected error text or code. · `microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:19, 20, 22` · This availability lookup is also called for each equipment row in `GetAvailableEquipment`; for BounceUnits it makes synchronous weather HTTP requests, and the source documents an approximately 250% slowdown accepted solely by comment. Redesign the hot path while preserving freshness and safety. · `custom/knowledge/performance/no-large-latency-regressions-in-hot-paths.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 60, 61` · The loop only assigns the same `Blocked := true` value and calls `Modify()` without per-row trigger behavior. Filter qualifying records and use equivalent `ModifyAll` semantics. · `microsoft/knowledge/performance/prefer-modifyall-over-per-row-modify.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:73, 75, 77` · `GetTotalRevenue` reads every completed booking and sums a stored Decimal field in AL when only the total is needed; use filtered `CalcSums` and verify the resulting key/SIFT trade-off. · `microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:39` · The in-scope test inserts BounceUnit equipment and then calls availability, which reaches this synchronous HTTP call before the test transaction ends. The remote wait can extend the lifetime of earlier write locks; move the call outside the open write transaction or isolate it from this test path. · `microsoft/knowledge/performance/httpclient-inside-write-transaction-holds-locks.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 12, 14, 15` · `OnUpgradePerCompany` contains migration implementation directly. Keep the trigger as a dispatch point and move this feature's data work into a named helper so it can be tracked and managed independently. · `microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md`
- major · high · `workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39` · Hard-coded booking primary-key fixtures can collide across parallel or repeated test runs; use a table-aware unique fixture value. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 57, 58, 59, 61` · Hard-coded equipment and booking primary-key fixtures can collide across parallel or repeated test runs; use table-aware unique fixture values. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47` · Hard-coded equipment and booking primary-key fixtures can collide across parallel or repeated test runs; use table-aware unique fixture values. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 80, 89, 90` · Hard-coded equipment and booking primary-key fixtures can collide across parallel or repeated test runs; use table-aware unique fixture values. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- minor · high · `workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5, 13, 34` · The codeunit and test procedures omit the `[FEATURE]` and `[SCENARIO]` tags required by the test structure guidance. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6, 14, 31, 50` · The codeunit and test procedures omit the `[FEATURE]` and `[SCENARIO]` tags required by the test structure guidance. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6, 14, 40` · The codeunit and test procedures omit the `[FEATURE]` and `[SCENARIO]` tags required by the test structure guidance. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6` · The test procedures have scenario tags, but the codeunit lacks the `[FEATURE]` tag that names their shared functional area. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · medium · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61` · `CreateTestBooking` expects a `Record Booking`, but this call passes `Equipment1` (`Record Equipment`), so the test source has a record-type mismatch. · agent finding

Suppressed: None.

## Verdicts

Not triaged yet.
