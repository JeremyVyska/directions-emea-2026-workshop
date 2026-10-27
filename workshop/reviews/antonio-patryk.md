---
reviewed_with: "GitHub Copilot (agent mode)"
reviewed_files: ["workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al", "workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al", "workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al", "workshop/AmuseYou/RentalOperations/src/BookingList.Page.al", "workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al", "workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al", "workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al", "workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al", "workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al", "workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al"]
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 1
blockers: 1
---

# BCQuality Review: antonio-patryk

## Blockers

- `microsoft/knowledge/security/secrettext-with-httpclient.md` · `workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 17, 37, 39` · The API key is embedded in a label, concatenated into plain-text request URIs, and sent through `HttpClient.Get`, exposing the credential instead of keeping it in a `SecretText` request URI.

## Findings

- major · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96-97` · The negative test accepts any error from `CreateBooking`; an unrelated failure can make it pass without proving that the overlap validation rejected the booking. · `microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 62` · `Commit()` runs inside an unbounded record loop without persisted progress, committing each row separately and allowing retries to repeat already committed work. · `microsoft/knowledge/performance/avoid-commit-inside-loops.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:65` · The loop modifies each booking after `FindSet()` takes no update lock; use `FindSet(true)` to avoid the shared-lock-to-update-lock window described by the guidance. · `microsoft/knowledge/performance/findset-true-applies-updlock-on-read.md`
- major · high · `workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 15` · `OnUpgradePerCompany` performs `ModifyAll` directly instead of dispatching the migration through a named helper, mixing trigger orchestration with implementation. · `microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md`
- major · high · `workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39` · Test fixtures use fixed booking numbers as primary keys; generate unique fixture keys to prevent collisions across repeated or parallel test execution. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39-40, 57-59, 61` · Test fixtures use fixed equipment and booking numbers as primary keys; generate unique fixture keys to prevent collisions across repeated or parallel test execution. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47` · Test fixtures use fixed equipment and booking numbers as primary keys; generate unique fixture keys to prevent collisions across repeated or parallel test execution. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- major · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 89` · Test fixtures use fixed equipment and booking numbers as primary keys; generate unique fixture keys to prevent collisions across repeated or parallel test execution. · `microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md`
- minor · medium · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61` · The test passes `Equipment1` (`Record Equipment`) to `CreateTestBooking`'s `var Booking: Record Booking` parameter, so this test code cannot compile; pass a `Booking` variable instead. · agent finding
- minor · high · `custom/knowledge/performance/setloadfields-for-read-only-reads.md` · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:13, 43` · These read-only equipment reads omit `SetLoadFields`; the Side A custom rule requires field selection even where a temporary-record copy consumes the full row. · `custom/knowledge/performance/setloadfields-for-read-only-reads.md`
- minor · high · `custom/knowledge/performance/setloadfields-for-read-only-reads.md` · `workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:50` · The equipment lookup is read-only and uses only the daily rate, but does not select that field with `SetLoadFields`. · `custom/knowledge/performance/setloadfields-for-read-only-reads.md`
- minor · high · `workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:75-77` · The procedure reads every completed booking and adds the stored amount in AL although it only needs one total; use a filtered `CalcSums` for the stored-field aggregate. · `microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md`
- minor · high · `workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:13, 16` · The user-facing errors use inline text rather than `Err` Labels; declare labels so the messages retain translation metadata. · `microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md`
- minor · high · `workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:80` · The user-facing message uses inline text rather than a `Label`; declare a label so the messages retain translation metadata. · `microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md`
- minor · high · `workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5, 13, 34` · The codeunit lacks a `[FEATURE]` comment and its test procedures lack `[SCENARIO]` comments, though they already mark GIVEN/WHEN/THEN. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6, 14, 31, 50` · The codeunit lacks a `[FEATURE]` comment and its test procedures lack `[SCENARIO]` comments, though they already mark GIVEN/WHEN/THEN. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6, 14, 40` · The codeunit lacks a `[FEATURE]` comment and its test procedures lack `[SCENARIO]` comments, though they already mark GIVEN/WHEN/THEN. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`
- minor · high · `workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6` · The codeunit lacks a `[FEATURE]` comment; its test procedures already contain `[SCENARIO]` and GIVEN/WHEN/THEN comments. · `microsoft/knowledge/testing/test-feature-scenario-tags.md`

Suppressed: `microsoft/knowledge/performance/use-setloadfields-for-partial-records.md`, `microsoft/knowledge/performance/skip-setloadfields-on-write-and-transferfields.md` (custom-layer precedence).

## Verdicts

Not triaged yet.