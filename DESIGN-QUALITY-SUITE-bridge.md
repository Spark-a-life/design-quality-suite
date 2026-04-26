# Design Quality Suite -- Integration Map

**Public name:** Design Quality Suite
**Version:** 1.1.0 | 2026-04-26

## What this is

The Design Quality Suite is a shared frontend quality layer that separates:

- core doctrine
- task-specific surfaces
- stack-specific references
- output-completeness rules
- **brand design tokens** (NEW v1.1.0)

It exists so design guidance does not fragment among multiple long skill files.

## Control model

One engine coordinates three surfaces:

| Component | Role |
|---|---|
| `design-quality-core.md` | Dispatches to the right references, preserves stack truth, defines verification |
| `skills/craft-skill/SKILL.md` | New build or deliberate frontend direction |
| `skills/refine-skill/SKILL.md` | Existing-project scan, diagnose, fix, verify |
| `output-contract.md` | Completeness and continuation contract |

## Integration map

| Component | Canonical spec (edit here) | Mirrors or wrappers |
|---|---|---|
| Engine | `.claude/commands/design-quality-core.md` | Copied into `.claude/commands/` of target projects via sync script |
| `craft-skill` | `skills/craft-skill/SKILL.md` | Thin wrappers under local skill folders |
| `refine-skill` | `skills/refine-skill/SKILL.md` | Thin wrappers under local skill folders |
| `/output-contract` | `.claude/commands/output-contract.md` | Thin wrappers under local skill folders |
| References | `references/` | Loaded only when needed by the engine |

## Position in the stack

The suite sits at the design and delivery-discipline layer:

```text
User intent
   |
Task surface (craft-skill, refine-skill, /output-contract) + --brand flag
   |
Design Quality Core v1.1.0
   |
References (stack mode, surface mode, verification, brands)
   |
Implementation and validation
   |
Audit trail (optional JSONL under `audit/brand-evaluations/` at project root)
```

It is intentionally architecture-first:

- stack truth before aesthetics
- existing systems before rewrites
- one shared doctrine before multiple wrappers
- verification after changes
- brand alignment when --brand flag is used (v1.1.0)

## Brand Registry (v1.1.0)

The suite now includes **63 brand design systems** for brand-aware UI generation.

| Category | Count | Examples |
|----------|-------|----------|
| AI/LLM | 12 | claude, openai, anthropic, cohere |
| Dev Tools | 7 | cursor, vercel, github, raycast |
| Design | 5 | figma, framer, webflow |
| Productivity | 7 | linear.app, notion, posthog |
| Fintech | 5 | stripe, coinbase, kraken |
| Backend | 6 | supabase, mongodb, hashicorp |
| Automotive | 7 | tesla, bmw, ferrari |
| Retail | 14 | airbnb, shopify, spotify |

**See:** `references/brands/README.md` for use cases

## Thin wrapper rule

Claude or Codex skill wrappers must remain thin:

1. read `design-quality-core.md`
2. read the requested task surface
3. load only the needed references
4. do not duplicate doctrine in the wrapper body

## Standalone adoption

1. Copy the needed root commands from `.claude/commands/` into your project.
2. Copy any needed files from `references/`.
3. Add thin local skill wrappers for `craft-skill` and `refine-skill`.
4. Keep the canonical copy in one place and sync the root command mirrors from there.

## Publish notes

This repo is community-safe because it does not depend on any private internal code.
If a downstream project needs internal governance rules, those should live in a
separate private reference layer rather than inside the public engine.
