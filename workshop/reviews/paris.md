---
reviewed_with: Claude Code (Claude Sonnet 5.5)
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 0
blockers: 0
---

# BCQuality Review: paris

Five skills ran (style, testing, performance, security, upgrade): 0 blocker, 13 major, 14 minor, 0 info. Rerun with custom rule documented-slowdown-needs-redesign (performance skill rerun; other four skills reused from the first run).

## Blockers

None.

## Findings

- major · high · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:15, 37 · API key concatenated into a plain Text URL and sent via HttpClient.Get; use SecretText, SetSecretRequestUri and IsolatedStorage · microsoft/knowledge/security/secrettext-with-httpclient.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:19-23 (called per row at 45) · Documented "~250% slower, accepted for customer safety" synchronous weather HTTP call, invoked once per equipment row; cache per Location and date, fetch once, or go background · custom/knowledge/performance/documented-slowdown-needs-redesign.md
- major · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:14-15 · OnUpgradePerCompany holds the data work inline instead of calling a named helper · microsoft/knowledge/upgrade/triggers-call-helpers-not-implementations.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · Commit() inside the Equipment loop in UpdateMaintenanceStatus · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:57-59 · FindSet over all Equipment with the date test inside the loop; filter first · microsoft/knowledge/performance/apply-filters-before-iterating.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:75-78 · GetTotalRevenue loops to sum a stored field; use CalcSums · microsoft/knowledge/performance/calcsums-instead-of-calcfields-in-loop.md
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 39, 53 · Hard-coded primary-key literals in fixtures; use GenerateGUID · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 40, 57-59, 61 · Hard-coded primary-key literals in fixtures · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 47 · Hard-coded primary-key literals in fixtures · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 78, 79 · Hard-coded primary-key literals in fixtures · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96-98 · asserterror verified only via GetLastErrorText() <> ''; use ExpectedError/ExpectedErrorCode · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md
- major · medium · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:20, 54 · Equipment No. set without creating the Equipment record; assumes pre-existing data · microsoft/knowledge/testing/test-data-must-be-random-and-complete.md
- major · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:72 · CreateTestBooking hardcodes Equipment 'TEST001' that is never created · microsoft/knowledge/testing/test-data-must-be-random-and-complete.md
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:9-16 · No HasUpgradeTag guard and no SetUpgradeTag call · microsoft/knowledge/upgrade/use-upgrade-tags-not-version-checks.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:13, 16 · Error() with hard-coded literal text instead of a Label · microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5, 12, 31 · No [FEATURE] on the codeunit, no [SCENARIO] on tests · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6, 13, 30, 49 · No [FEATURE], no [SCENARIO] · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6, 13, 39 · No [FEATURE], no [SCENARIO] · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · [SCENARIO] present, no codeunit-level [FEATURE] · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · medium · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:15, 37 · Static API key in the query string; prefer OAuth2 if the provider supports it · microsoft/knowledge/security/prefer-oauth2-over-api-keys-for-external-http-calls.md
- minor · medium · workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:80 · Message() with hard-coded literal instead of a Label · microsoft/knowledge/style/error-passes-parameters-directly-not-strsubstno.md
- minor · medium · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:65-70 · Per-row Modify() of a constant status; ModifyAll would do · microsoft/knowledge/performance/prefer-modifyall-over-per-row-modify.md
- minor · medium · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:18-27, 52-59 · Fixtures hand-rolled instead of a library or shared helper · microsoft/knowledge/testing/use-library-codeunits-for-test-fixtures.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:72-78, 83-90 · Fixtures hand-rolled instead of a library or shared helper · microsoft/knowledge/testing/use-library-codeunits-for-test-fixtures.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:24-27, 60-65, 68-77 · Fixtures hand-rolled instead of a library or shared helper · microsoft/knowledge/testing/use-library-codeunits-for-test-fixtures.md
- minor · medium · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:32-35, 78-81, 88-91, 107-113 · Fixtures hand-rolled instead of a library or shared helper · microsoft/knowledge/testing/use-library-codeunits-for-test-fixtures.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61 · Passes a Record Equipment to a `var Booking: Record Booking` parameter, which will not compile · agent finding

Suppressed: None.

## Verdicts

Not triaged yet.
