---
reviewed_with: "Copilot SDK in VS Code (model unknown)"
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 1
blockers: 0
---

# BCQuality Review: paris-007

Static review rerun after adding the Side A interface rule. Index refresh was skipped because `pwsh` is unavailable; knowledge was read by path. AL builds and tests were not run per workshop instructions.

## Blockers

- `microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md` · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96 · The test accepts any error from `CreateBooking`, so an unrelated failure can make the double-booking test pass; assert the expected error. · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md

## Findings

- major · high · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37 · The API key is embedded in a Label and concatenated into both request URIs passed to `HttpClient.Get`; keep the credential outside source and use SecretText with the secret-aware request URI API. · microsoft/knowledge/security/secrettext-with-httpclient.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · `Commit()` runs inside a full record loop without persisted progress, splitting the operation into per-row transactions and making retries reprocess completed work. · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57, 59 · The maintenance-date predicate is checked after `FindSet(true)` has read and update-locked the full Equipment set; filter eligible rows before iterating. · microsoft/knowledge/performance/apply-filters-before-iterating.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:77 · `GetTotalRevenue` iterates completed bookings only to sum the stored `Total Amount`; use `CalcSums` for the filtered total. · microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md
- major · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:65, 68 · The loop modifies each booking after a read-only `FindSet()`, leaving a lock-upgrade window that can deadlock; use `FindSet(true)` for this update loop. · microsoft/knowledge/performance/findset-true-applies-updlock-on-read.md
- major · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 15 · The upgrade trigger performs `ModifyAll` inline rather than dispatching to a named per-feature helper, mixing orchestration and migration logic. · microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:9, 10, 31, 47, 48, 59, 60, 75, 90 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. No variable contains spaces. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:9, 10, 11, 35, 54, 55, 70, 71 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. No variable contains spaces. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:10, 11, 12, 13, 29, 30, 31, 32, 33, 34, 35 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. No variable contains spaces. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:64, 77 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. No variable contains spaces. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:11 · This local variable lacks the `DDD` prefix and `Local` suffix. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:10, 15, 36 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:11, 16, 17, 18, 33, 34, 35, 36, 52, 53, 54 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:11, 16, 17, 18, 42, 43, 44 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:11, 16, 17, 18, 19, 20, 67, 68, 69, 70 · These declared variables lack the `DDD` prefix; local variables also lack the `Local` suffix. · custom/knowledge/style/ddd-variable-naming.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:13, 16 · Both user-facing `Error` calls use inline strings instead of translatable Label identifiers with placeholder comments. · microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:80 · The success `Message` uses an inline string instead of a translatable Label. · microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md
- minor · medium · workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:22, 26, 30, 34, 38, 42, 46 · These field tooltips mechanically restate their captions and do not explain what the values are used for or add other user guidance. · microsoft/knowledge/style/tooltip-required-on-page-fields.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:12, 33 · The codeunit and its test procedures omit the `[FEATURE]` and `[SCENARIO]` tags; the existing Given/When/Then comments do not replace them. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:13, 30, 49 · The codeunit and its test procedures omit the `[FEATURE]` and `[SCENARIO]` tags. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:13, 39 · The codeunit and its test procedures omit the `[FEATURE]` and `[SCENARIO]` tags. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · The codeunit lacks the `[FEATURE]` tag; its test procedures do have scenario comments. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · medium · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39 · Fixed primary-key values can collide across parallel or repeated test runs when data is not isolated; the executing runner's isolation is outside this scope. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 40, 57, 58, 59, 61 · Fixed equipment and booking identifiers risk collisions across parallel or repeated test runs; runner isolation is not in this scope. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47 · Fixed primary-key values can collide across parallel or repeated test runs when data is not isolated; the executing runner's isolation is outside this scope. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- minor · medium · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 75, 79, 89 · Fixed equipment and booking identifiers risk collisions across parallel or repeated test runs; runner isolation is not in this scope. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- minor · medium · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:27, 31, 45, 56 · The lifecycle test has multiple When actions with intermediate assertions that can be split into focused tests, reducing failure isolation. · microsoft/knowledge/testing/test-one-when-per-test.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:9 · BookingMgt depends on concrete AvailabilityMgt even though the same service implements IAvailabilityCheck; depend on the interface so callers can substitute the availability provider. · custom/knowledge/style/interface-before-second-implementation.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61 · The test passes an `Equipment` record to a helper whose `var` parameter is `Record Booking`; this type mismatch is likely to prevent the test code from compiling. · agent finding
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:24, 43, 64 · These tests exercise BounceUnit availability and therefore make outbound weather API requests; mock the integration or avoid the weather-dependent type for deterministic tests. · agent finding
- minor · medium · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:28, 53 · The lifecycle test also calls BounceUnit availability, which performs outbound weather API requests; isolate or mock that dependency for deterministic results. · agent finding
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9, 15 · The migration lacks a per-feature `HasUpgradeTag`/`SetUpgradeTag` guard, so each upgrade run rescans the table and fills newly blank locations again. · microsoft/knowledge/upgrade/use-upgrade-tags-not-version-checks.md

Suppressed: None.

## Verdicts

- workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96 → accept: because was needed
