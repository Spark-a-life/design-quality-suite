# Design Quality Suite -- Integration Map

**Public name:** Design Quality Suite
**Version:** 1.0.0 | 2026-03-31

## What this is

The Design Quality Suite is a shared frontend quality layer that separates:

- core doctrine
- task-specific surfaces
- stack-specific references
- output-completeness rules

It exists so design guidance does not fragment across multiple long skill files.

## Control model

One engine coordinates three surfaces:

| Component | Role |
|---|---|
| `design-quality-core.md` | Dispatches to the right references, preserves stack truth, defines verification |
| `taste.md` | New build or deliberate frontend direction |
| `redesign.md` | Existing-project scan, diagnose, fix, verify |
| `output-contract.md` | Completeness and continuation contract |

## Integration map

| Component | Canonical spec (edit here) | Mirrors or wrappers |
|---|---|---|
| Engine | `.claude/commands/design-quality-core.md` | Copied into `.claude/commands/` of target projects via sync script |
| `/craft` | `.claude/commands/craft.md` | Thin wrappers under local skill folders |
| `/refine` | `.claude/commands/refine.md` | Thin wrappers under local skill folders |
| `/output-contract` | `.claude/commands/output-contract.md` | Thin wrappers under local skill folders |
| References | `references/` | Loaded only when needed by the engine |

## Position in the stack

The suite sits at the design and delivery-discipline layer:

```text
User intent
   |
Task surface (/taste, /redesign, /output-contract)
   |
Design Quality Core
   |
References (stack mode, surface mode, verification)
   |
Implementation and validation
```

It is intentionally architecture-first:

- stack truth before aesthetics
- existing systems before rewrites
- one shared doctrine before multiple wrappers
- verification after changes

## Thin wrapper rule

Claude or Codex skill wrappers must remain thin:

1. read `design-quality-core.md`
2. read the requested task surface
3. load only the needed references
4. do not duplicate doctrine in the wrapper body

## Standalone adoption

1. Copy `.claude/commands/` from this repo into your project.
2. Copy any needed files from `references/`.
3. Add thin local wrappers if your environment supports them.
4. Keep the canonical copy in one place and sync mirrors from there.

## Publish notes

This repo is community-safe because it does not depend on private WiseGen code.
If a downstream project needs internal governance rules, those should live in a
separate private reference layer rather than inside the public engine.
