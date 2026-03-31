# design-quality-suite

An architecture-first design quality system for Claude Code and Codex.

It separates shared design doctrine from task surfaces so frontend guidance does
not drift across "taste", "redesign", and "output completeness" prompts.

## What it does

One engine, three surfaces:

| Surface | Best for | Output posture |
|---|---|---|
| `/craft` | New UI direction or a fresh frontend pass | Build or refine a surface from first principles without inventing stack changes |
| `/refine` | Existing app or website | Scan, diagnose, fix, and verify without rewriting the whole project |
| `/output-contract` | Any implementation task requiring full delivery | Enforce completeness, ban placeholder output, and define clean continuation rules |

All three surfaces are powered by one canonical engine:

- `design-quality-core.md` -- dispatch, loading rules, shared doctrine, verification contract

## Canonical copy

**Source of truth:** `.claude/commands/`

- `design-quality-core.md` -- engine
- `craft.md` -- `/craft`
- `refine.md` -- `/refine`
- `output-contract.md` -- `/output-contract`

**References:** `references/`

- `shared-doctrine.md`
- `stack-react-vite-css.md`
- `stack-next-tailwind.md`
- `dashboard-mode.md`
- `landing-mode.md`
- `verification.md`

**Mirrors:** copy the four command files into `.claude/commands/` of any target
project. Run the sync script to regenerate mirrors from the canonical set:

```powershell
powershell -File "scripts/sync-design-quality-commands.ps1"
```

**Thin wrappers:** local Claude and Codex wrappers should point at the canonical
files above. Behaviour should not be duplicated in wrapper bodies.

## Install (other projects)

Copy the four command files under `.claude/commands/`, plus any references you
intend to use, into your target project. Keep wrappers thin and point them at
the canonical engine and command files.

## Architecture

This repo is intentionally layered:

1. **Engine**
   `design-quality-core.md` defines dispatch, truth rules, reference loading,
   and verification.
2. **Task surfaces**
   `taste.md`, `redesign.md`, and `output-contract.md` define when and how each
   surface is used.
3. **References**
   Stack-specific and surface-specific guidance lives in `references/`.
4. **Wrappers**
   Local skill wrappers instruct the agent to read the canonical files. They do
   not restate the doctrine.

This avoids the common failure mode where multiple design skills drift apart,
contradict one another, or duplicate large blocks of guidance.

## Usage

```text
/craft the high-command dashboard
/refine the analytics shell
/output-contract the frontend migration plan
```

Compound usage is allowed:

```text
/refine the settings page
/output-contract the patch
```

In that case, the redesign surface defines the work method and the output
contract defines completeness and continuation rules.

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
- explicit sync path
- stack truth before aesthetics
- verification after implementation

## Origin

A community contribution. Adapted from an internal governance-driven AI workflow system.
