# design-quality-suite

An architecture-first design quality system for Claude Code and Codex.

It separates shared design doctrine from task surfaces so frontend guidance does
not drift among `craft-skill`, `refine-skill`, and `output-contract`.

## What it does

One engine, two skills, one command:

| Surface | Entry point | Best for | Output posture |
|---|---|---|---|
| Craft | `skills/craft-skill/SKILL.md` | New UI direction or a fresh frontend pass | Build or refine a surface from first principles without inventing stack changes |
| Refine | `skills/refine-skill/SKILL.md` | Existing app or website | Scan, diagnose, fix, and verify without rewriting the whole project |
| Output contract | `.claude/commands/output-contract.md` | Any implementation task requiring full delivery | Enforce completeness, ban placeholder output, and define clean continuation rules |

All three surfaces are powered by one canonical engine:

- `design-quality-core.md` -- dispatch, loading rules, shared doctrine, verification contract

## Canonical copy

**Engine + root command:** `.claude/commands/`

- `design-quality-core.md` -- engine
- `output-contract.md` -- `/output-contract`

**Skill surfaces:** `skills/`

- `craft-skill/SKILL.md` -- craft surface
- `refine-skill/SKILL.md` -- refine surface

**References:** `references/`

- `shared-doctrine.md`
- `stack-react-vite-css.md`
- `stack-next-tailwind.md`
- `dashboard-mode.md`
- `landing-mode.md`
- `verification.md`

**Mirrors:** copy the remaining root command files into `.claude/commands/` of
any target project. Run the sync script to regenerate those mirrors:

```powershell
powershell -File "scripts/sync-design-quality-commands.ps1"
```

**Thin wrappers:** local Claude and Codex wrappers should point at the canonical
files above. Behaviour should not be duplicated in wrapper bodies.

## Install (other projects)

Copy `design-quality-core.md` and `output-contract.md` under `.claude/commands/`
if the target project needs the root command layer. Install thin `craft-skill`
and `refine-skill` wrappers that point at the canonical skills above.

## Architecture

This repo is intentionally layered:

1. **Engine**
   `design-quality-core.md` defines dispatch, truth rules, reference loading,
   and verification.
2. **Task surfaces**
   `skills/craft-skill/SKILL.md`, `skills/refine-skill/SKILL.md`, and
   `output-contract.md` define when and how each surface is used.
3. **References**
   Stack-specific and surface-specific guidance lives in `references/`.
4. **Wrappers**
   Local skill wrappers instruct the agent to read the canonical files. They do
   not restate the doctrine.

This avoids the common failure mode where multiple design skills drift apart,
contradict one another, or duplicate large blocks of guidance.

## Usage

Use `craft-skill` or `refine-skill` through your host environment's skill
loader, and combine either one with `/output-contract` when you need the
completeness contract as well.

## Repo layout

```text
design-quality-suite/
|- .claude/commands/
|- references/
|- scripts/
|- skills/
|- DESIGN-QUALITY-SUITE-bridge.md
|- LICENSE
\- README.md
```

## Publish posture

This repo is designed to be community-publishable:

- architecture-first
- canonical source of truth
- thin wrappers
- explicit sync path for the remaining root commands
- stack truth before aesthetics
- verification after implementation

## Origin

A community contribution. Adapted from an internal governance-driven AI workflow system.
