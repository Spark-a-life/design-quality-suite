# Stack Reference -- React + Vite + CSS or Tailwind

Use this reference when the project is React on Vite with CSS modules, plain
CSS, or Tailwind.

## Detection

Confirm:

- `package.json` lists `react` and `vite`
- styling is plain CSS, CSS modules, Tailwind, or a mix already present

## Rules

- Work with the current styling system; do not migrate to another one by default.
- Keep interactive logic local unless there is a real state-sharing need.
- Isolate animation-heavy pieces from large parent layouts when practical.
- Before adding a library, check `package.json`.

## Tailwind note

- Detect whether the project is on Tailwind v3 or v4 before using syntax or
  config patterns.
- Do not assume shadcn or motion libraries are installed.

## Verification

Typical checks:

- `npm run build`
- relevant test command if present
- visual sanity on both desktop and narrow widths
