# Stack Reference -- Next.js + Tailwind

Use this reference when the project is a Next.js app with Tailwind or adjacent
React tooling.

## Detection

Confirm:

- `package.json` lists `next`
- Tailwind is actually installed
- whether the relevant component is server-rendered or client-rendered

## Rules

- Preserve server and client boundaries.
- Keep interactive behaviour in client components only.
- Verify dependencies before import.
- Match the installed Tailwind version.
- Do not force a design pattern that breaks the existing routing or app-shell
  structure.

## Verification

Typical checks:

- project build
- lint or test commands if they exist
- visual review for both desktop and mobile breakpoints
