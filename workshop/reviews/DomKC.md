---
reviewed_with: "GitHub Copilot (agent mode, model unknown)"
reviewed_files: [workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al, workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al, workshop/AmuseYou/RentalOperations/src/BookingList.Page.al, workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al, workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al, workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al, workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al, workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al]
bcquality_commit: 8e20c29
outcome: completed
blockers_found: 0
blockers: 0
---

# BCQuality Review: DomKC

## Blockers

None.

## Findings

- major · high · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:6, 15, 37 · A credential is stored as a plain-text label and interpolated into both HTTP request URIs. Carry the credential as `SecretText` and use the secret-aware request URI API. · microsoft/knowledge/security/secrettext-with-httpclient.md
- major · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:62 · `Commit()` runs inside the equipment iteration without persisted progress, splitting the operation into per-row transactions and allowing retries to repeat already committed work. Remove the loop commit or add restart-safe bounded checkpointing. · microsoft/knowledge/performance/avoid-commit-inside-loops.md
- major · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:19, 20, 39, 53, 54 · Test fixtures assign hardcoded equipment and booking identifiers to unique keys; use the test utility's unique-value helpers instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:21, 39, 40, 57, 58, 59, 61, 84, 85 · Test fixtures assign hardcoded equipment and booking identifiers to unique keys; use the test utility's unique-value helpers instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:21, 25, 26, 47, 71, 72 · Test fixtures assign hardcoded equipment and booking identifiers to unique keys; use the test utility's unique-value helpers instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:25, 33, 34, 75, 79, 80, 89, 90 · Test fixtures assign hardcoded equipment and booking identifiers to unique keys; use the test utility's unique-value helpers instead. · microsoft/knowledge/testing/use-generateguid-for-unique-test-fixture-values.md
- major · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:96 · The negative test accepts any error from `CreateBooking`, so unrelated failures can make the overlap test pass; assert the expected error or error code. · microsoft/knowledge/testing/asserterror-needs-expectederror-and-code.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingMgt.Codeunit.al:5 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations/src/AvailabilityMgt.Codeunit.al:5 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations/src/WeatherApiClient.Codeunit.al:3 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations/src/BookingList.Page.al:5 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations/src/RentalUpgrade.Codeunit.al:5 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/BookingCore/src/BookingStatus.Enum.al:6 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · The object name lacks the required `KCI` prefix, and the AL source has no ticketed `#region`/`#endregion` wrapper. · custom/knowledge/style/kci-team-coding-standards.md
- minor · high · workshop/AmuseYou/BookingCore.Test/src/BookingTests.Codeunit.al:5 · The test codeunit omits the `[FEATURE]` tag and its procedures omit `[SCENARIO]` comments, so the business behavior under test is not consistently labeled. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:6 · The test codeunit omits the `[FEATURE]` tag and its procedures omit `[SCENARIO]` comments, so the business behavior under test is not consistently labeled. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/BookingMgtTests.Codeunit.al:6 · The test codeunit omits the `[FEATURE]` tag and its procedures omit `[SCENARIO]` comments, so the business behavior under test is not consistently labeled. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · high · workshop/AmuseYou/Integration.Test/src/EndToEndBookingTests.Codeunit.al:6 · The test codeunit omits the `[FEATURE]` tag, although its test procedures do provide `[SCENARIO]` comments. · microsoft/knowledge/testing/test-feature-scenario-tags.md
- minor · medium · workshop/AmuseYou/RentalOperations.Test/src/UnitTests/AvailabilityTests.Codeunit.al:61 · The test passes an `Equipment` record to a helper whose parameter is a `Booking` record; this type mismatch prevents the test codeunit from compiling. Declare and pass a `Booking` record for the fixture. · agent finding

Suppressed: None.

## Verdicts

Not triaged yet.
