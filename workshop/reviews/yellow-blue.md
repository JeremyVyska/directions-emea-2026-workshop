---
reviewed_with: Codex (GPT-6.1)
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: 4251fba
outcome: completed
blockers_found: 2
blockers: 2
---

# BCQuality Review: yellow-blue

## Blockers

- `microsoft/knowledge/security/secrettext-with-httpclient.md` · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37 · An API key is embedded in source and concatenated into plain-text request URLs; carry it as SecretText and send a secret request URI. · microsoft/knowledge/security/secrettext-with-httpclient.md
- `microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md` · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96, 97 · The test accepts any error from CreateBooking, so an unrelated setup or permission failure can satisfy the double-booking assertion; check the expected error. · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md

## Findings

- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · Commit inside the maintenance loop persists each row separately and leaves no restart-safe progress marker. · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 59 · The maintenance-date condition is checked after FindSet loads every equipment row; apply the date filter before iteration. · microsoft/knowledge/performance/apply-filters-before-iterating.md
- major · medium · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 60, 61 · The loop only assigns Blocked to a constant and modifies each matching row; filter the matching rows and use an equivalent bulk assignment. · microsoft/knowledge/performance/prefer-modifyall-over-per-row-modify.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:75, 77 · GetTotalRevenue reads each completed booking only to sum the stored Total Amount field; use CalcSums on the filtered records. · microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md
- major · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:65, 68 · ProcessDailyBookings modifies rows fetched with FindSet() rather than FindSet(true), leaving a read-to-write lock upgrade window. · microsoft/knowledge/performance/findset-true-applies-updlock-on-read.md
- major · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 14, 15 · OnUpgradePerCompany performs the data change directly; move this migration into a named helper called by the trigger. · microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39, 53 · Booking fixtures use fixed primary keys that can collide across tests or repeated runs; generate unique fixture keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 40, 57, 58, 59, 61, 73, 84 · Equipment and booking fixtures use fixed primary keys that can collide across tests or repeated runs; generate unique fixture keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47, 61, 71 · Equipment and booking fixtures use fixed primary keys that can collide across tests or repeated runs; generate unique fixture keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 89, 108 · Integration fixtures use fixed primary keys that can collide across tests or repeated runs; generate unique fixture keys. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:27, 31, 45, 56 · The workflow test contains several WHEN actions with separate assertions, so its failures do not identify one claim; split the independently asserted actions into focused tests. · microsoft/knowledge/testing/test-one-when-per-test.md
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 15 · The migration runs on every upgrade because it has no HasUpgradeTag guard or SetUpgradeTag completion marker. · microsoft/knowledge/upgrade/use-upgrade-tags-not-version-checks.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5, 13, 34 · The test codeunit has no FEATURE or SCENARIO tags, making the tested business claims harder to scan. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6, 14, 31, 50 · The test codeunit has no FEATURE or SCENARIO tags, making the tested business claims harder to scan. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6, 14, 40 · The test codeunit has no FEATURE or SCENARIO tags, making the tested business claims harder to scan. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · The integration test codeunit has SCENARIO tags but no codeunit-level FEATURE tag. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- info · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:19, 20, 22 · The measured 250% availability slowdown is documented as a customer-safety trade-off; respect that decision while reviewing separate implementation issues on their own evidence. · custom/knowledge/performance/respect-documented-safety-tradeoffs.md

Suppressed: None.

## Verdicts

Not triaged yet.
