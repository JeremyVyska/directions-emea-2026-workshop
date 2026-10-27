---
bc-version: [all]
domain: style
keywords: [ui, page-run, message, confirm, management-codeunit, business-logic, job-queue, testability]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Management codeunits never open UI

## Description

Business logic has to run from job queues, APIs and tests, where nobody can see a page, a message or a confirmation. A codeunit that opens UI either fails there or needs a test handler for every call. From card workshop/cards/code-quality/01-mgt-codeunit-opens-ui.md, Side A.

## Best Practice

Management and business-logic codeunits (names ending in `Mgt`, `Management` or similar) contain no Page.Run, Page.RunModal, Message, Confirm, StrMenu or Hyperlink calls. They return values or raise errors. The page or page action that calls the logic does the Get and the Page.Run, and shows any messages or confirmations. Error() with a Label is allowed, because an error is not UI.

## Anti Pattern

A procedure in a management codeunit that opens a page or asks the user something. One example is an "open the card for this booking number" helper that calls Page.Run(Page::"Booking Card", Booking). A thin helper like this still counts: once it is in the codeunit, job queue, API and test callers can reach the UI through it.
