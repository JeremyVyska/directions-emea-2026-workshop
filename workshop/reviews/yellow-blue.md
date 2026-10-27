---
reviewed_with: Codex (GPT-6.1)
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: cc4b374
outcome: completed
blockers_found: 2
blockers: 2
---

# BCQuality Review: yellow-blue

## Blockers

- `microsoft/knowledge/security/secrettext-with-httpclient.md` · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37 · The API key is embedded in source and concatenated into plain-text request URIs; store it securely and send a SecretText URI. · microsoft/knowledge/security/secrettext-with-httpclient.md
- `microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md` · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96, 97 · The double-booking test accepts any error from CreateBooking, so an unrelated failure can satisfy it; assert the expected error. · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md

## Findings

- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · Commit inside the maintenance loop persists rows separately and has no restart-safe progress marker. · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 59 · The maintenance-date condition runs after FindSet loads every equipment row; filter the date before iteration. · microsoft/knowledge/performance/apply-filters-before-iterating.md
- major · medium · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 60, 61 · The loop assigns the same Blocked value to each matching row; filter those rows and use an equivalent bulk assignment. · microsoft/knowledge/performance/prefer-modifyall-over-per-row-modify.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:75, 77 · GetTotalRevenue reads each completed booking to sum a stored amount; use CalcSums on the filtered set. · microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md
- major · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:65, 68, 81, 84 · Both booking update loops modify rows fetched with FindSet() instead of FindSet(true), leaving a read-to-write lock upgrade window. · microsoft/knowledge/performance/findset-true-applies-updlock-on-read.md
- major · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 14, 15 · OnUpgradePerCompany performs the migration directly; move the data work into a named helper called by the trigger. · microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39, 53 · Booking fixtures use fixed primary keys that can collide across repeated or parallel runs; generate unique keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 40, 57, 58, 59, 61, 73, 84 · Equipment and booking fixtures use fixed primary keys that can collide across tests; generate unique keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47, 61, 71 · Equipment and booking fixtures use fixed primary keys that can collide across tests; generate unique keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 89, 108 · Integration fixtures use fixed primary keys that can collide across runs; generate unique keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:27, 31, 45, 56 · The workflow test has separate WHEN actions and independently asserted results; split these falsifiable claims into focused tests. · microsoft/knowledge/testing/test-one-when-per-test.md
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 15 · The migration has no HasUpgradeTag guard or SetUpgradeTag completion marker, so it runs on every upgrade. · microsoft/knowledge/upgrade/use-upgrade-tags-not-version-checks.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5, 13, 34 · The test codeunit lacks FEATURE and SCENARIO tags. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6, 14, 31, 50 · The test codeunit lacks FEATURE and SCENARIO tags. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6, 14, 40 · The test codeunit lacks FEATURE and SCENARIO tags. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · The integration test codeunit has SCENARIO tags but no codeunit-level FEATURE tag. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · medium · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:39, 42, 46, 47, 50 · CheckSevereWeather returns false when the request fails or the response lacks a valid severeWeather value; this makes the safety check pass on failure. Treat an unavailable or invalid forecast explicitly. · agent finding
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61 · CreateTestBooking expects a var Booking record, but Equipment1 is a Record Equipment; pass a Booking fixture variable. · agent finding
- info · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:19, 20, 22 · The measured 250% availability slowdown is documented as a customer-safety trade-off; review separate implementation issues on their own evidence. · custom/knowledge/performance/respect-documented-safety-tradeoffs.md

Suppressed: None.

## Verdicts

Not triaged yet.
