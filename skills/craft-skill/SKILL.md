---
name: craft-skill
description: >
  Design Quality Suite skill for new UI direction or fresh frontend passes.
  Use when building a new frontend surface, upgrading the visual direction of
  an existing screen, or shaping a component language without changing the
  underlying stack.
metadata:
  version: "1.1.0"
  canonical_repo: "ape-community/design-quality-suite"
  engine: "design-quality-core v1.1.0"
  surface: "craft"
  created: "2026-03-31"
  updated: "2026-04-26"
---

# craft-skill -- canonical surface

Read `../../.claude/commands/design-quality-core.md` first and follow its
loading order exactly (v1.1.0 includes brand dispatch).

Then apply this surface.

## Brand Flag

Use `--brand` to match a specific design system:

```
craft-skill --brand linear.app
craft-skill --brand figma
craft-skill --brand stripe
```

Brand tokens override defaults for: colors, typography, spacing, patterns.

## Use when

- building a new frontend surface
- refining the look and feel of an existing screen
- designing a component language or UI shell
- upgrading a dashboard or landing page without changing its underlying mission
- creating UI that matches a specific brand aesthetic (via `--brand`)

## Output contract

- Work with the actual stack already present unless the user explicitly asks to
  change it.
- If a third-party package is needed, verify it exists first.
- If it does not exist, state the install command before using it.
- Prefer implementation over abstract moodboarding when the user is asking for
  code.
- If `--brand` flag used: apply brand tokens from `references/brands/{brand}/meta.json`

## Design intent

- Create a strong visual direction without becoming decorative for its own
  sake.
- Match the surface type:
  - dashboards: state clarity, hierarchy, signal discipline
  - landing pages: narrative rhythm, visual emphasis, controlled expression
- If `--brand` flag used: align to brand's design system tokens
- Keep interaction and motion subordinate to usability and performance.

## Do not

- import libraries that are not installed and pretend they exist
- shift a dashboard into a marketing layout
- force a full rewrite because the current UI is imperfect
- produce default AI patterns such as three equal cards, purple glow shells, or
  centre-stacked hero blocks unless the user explicitly asks for them
- use brand aesthetics that conflict with detected stack (warn if conflict detected)
