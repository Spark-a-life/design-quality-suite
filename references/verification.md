# Verification

Every implementation pass should end with the most relevant checks available.

## Minimum verification

- confirm the stack and dependency assumptions used
- run the primary project build if code changed
- run tests for the touched area if a test command exists
- note any checks that could not be run

## UI verification

At minimum, confirm:

- the surface renders
- primary interactions still work
- layout does not break on narrow widths
- loading, empty, and error states are not obviously regressed

## Reporting

State:

- what was changed
- what was verified
- what remains unverified

Do not claim runtime behaviour you did not actually test.
