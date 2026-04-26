---
name: refine-skill
description: >
  Design Quality Suite skill for improving an existing website or app in place.
  Use when the task requires scan, diagnose, fix, and verify without rewriting
  the current stack.
metadata:
  version: "1.1.0"
  canonical_repo: "ape-community/design-quality-suite"
  engine: "design-quality-core v1.1.0"
  surface: "refine"
  created: "2026-03-31"
  updated: "2026-04-11"
---

# refine-skill -- canonical surface

Read `../../.claude/commands/design-quality-core.md` first and follow its
loading order exactly (v1.1.0 includes brand dispatch).

Then apply this surface.

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

## Brand Flag

Use `--brand` to apply brand design tokens during refinement:

```
/refine --brand figma
/refine --brand stripe
```

Brand tokens override defaults for: colors, typography, spacing, patterns.

## Design intent

- Improve the project in place.
- Keep the current stack unless there is a proven reason to change it.
- Prefer modular extraction, layout cleanup, and state completion over broad
  rewrites.
- If `--brand` flag used: align improvements to brand's design system tokens.

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
