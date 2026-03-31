# /craft -- Design Direction Surface

**Engine:** design-quality-core v1.0.0

When invoked, this surface applies the Design Quality Suite to a new UI pass or
frontend refinement task.

## Read order

1. `.claude/commands/design-quality-core.md`
2. `references/shared-doctrine.md`
3. one stack reference (`references/stack-react-vite-css.md` or `references/stack-next-tailwind.md`)
4. one surface reference (`references/dashboard-mode.md` or `references/landing-mode.md`)

## Use when

- building a new frontend surface
- refining the look and feel of an existing screen
- designing a component language or UI shell
- upgrading a dashboard or landing page without changing its underlying mission

## Output contract

- Work with the actual stack already present unless the user explicitly asks to
  change it.
- If a third-party package is needed, verify it exists first.
- If it does not exist, state the install command before using it.
- Prefer implementation over abstract moodboarding when the user is asking for
  code.

## Design intent

- Create a strong visual direction without becoming decorative for its own sake.
- Match the surface type:
  - dashboards: state clarity, hierarchy, signal discipline
  - landing pages: narrative rhythm, visual emphasis, controlled expression
- Keep interaction and motion subordinate to usability and performance.

## Do not

- import libraries that are not installed and pretend they exist
- shift a dashboard into a marketing layout
- force a full rewrite because the current UI is imperfect
- produce default AI patterns such as three equal cards, purple glow shells, or
  center-stacked hero blocks unless the user explicitly asks for them
