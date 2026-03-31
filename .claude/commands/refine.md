# /refine -- Existing Project Refinement Surface

**Engine:** design-quality-core v1.0.0

When invoked, this surface upgrades an existing website or app without breaking
its current working structure.

## Read order

1. `.claude/commands/design-quality-core.md`
2. `references/shared-doctrine.md`
3. one stack reference (`references/stack-react-vite-css.md` or `references/stack-next-tailwind.md`)
4. one surface reference (`references/dashboard-mode.md` or `references/landing-mode.md`)

## Workflow

Always work in this order:

1. **Scan**
   Detect framework, styling system, surface type, current layout patterns, and
   existing dependency boundaries.
2. **Diagnose**
   Identify generic patterns, weak hierarchy, missing states, accessibility
   gaps, and avoidable design debt.
3. **Fix**
   Apply focused upgrades that preserve behaviour and keep the diff reviewable.
4. **Verify**
   Run the project checks that exist and report the outcome.

## Design intent

- Improve the project in place.
- Keep the current stack unless there is a proven reason to change it.
- Prefer modular extraction, layout cleanup, and state completion over broad
  rewrites.

## Output rules

- Findings should be concrete and tied to the real code.
- Fixes should be staged, not speculative.
- If the user asked for code, implement the highest-leverage pass instead of
  writing only a conceptual review.

## Do not

- restyle the entire app blindly
- break established behaviour for aesthetic novelty
- recommend a different framework when refactoring the current one is enough
- leave loading, empty, error, or focus states unresolved
