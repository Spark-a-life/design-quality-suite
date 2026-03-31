# Shared Doctrine

This file contains the shared frontend rules used by every surface in the
Design Quality Suite.

## Typography

- Prefer a deliberate sans-serif hierarchy for software and dashboard work.
- Use a monospace companion for metrics, logs, packet IDs, and timestamps.
- Tighten heading tracking and shorten line length for display text.
- Keep body copy readable: target roughly 55-65 characters where possible.

## Color and surfaces

- Use one accent family by default.
- Keep neutrals consistent; do not mix warm and cool grays casually.
- Avoid the default "purple AI glow" aesthetic unless explicitly requested.
- Use shadows and highlights to clarify hierarchy, not to decorate every panel.

## Layout

- Avoid default center-stacked page structures unless the surface genuinely
  calls for them.
- Use grid for multi-column layouts; avoid fragile flex width math.
- Keep a clear max-width so content does not drift edge-to-edge on wide screens.
- Cards are optional, not mandatory. Use them only when elevation helps.

## State completion

Every real interface should account for:

- loading
- empty
- error
- active or pressed
- focus-visible

Missing states make a UI feel incomplete even if the happy path looks polished.

## Motion

- Default to transform and opacity only.
- Motion should reinforce hierarchy, not distract from it.
- For operational surfaces, keep motion restrained and purposeful.

## Content discipline

- Do not use filler copy, generic company names, or synthetic-looking numbers.
- Prefer sentence case for headings unless a tighter system explicitly requires
  caps.
- Avoid dead controls and fake affordances.

## Accessibility

- Use semantic structure where possible.
- Ensure visible keyboard focus.
- Preserve contrast and legibility over stylistic effects.
- Do not hide meaning only in color or motion.
