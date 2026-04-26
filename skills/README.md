# Design Quality Suite -- Skills Pointer

The Design Quality Suite is implemented as **two canonical skills plus one
engine**, with an optional root `output-contract` command and thin local
wrappers in Claude or Codex skill folders.

## Live surfaces

| Surface | Slug | Description |
|---|---|---|
| **craft** | `craft-skill` | New UI direction or frontend pass using the shared design-quality engine |
| **refine** | `refine-skill` | Existing-project refinement workflow: scan, diagnose, fix, verify |
| **output-contract** | `output-contract` | Completeness contract for implementation-heavy tasks |

Behaviour is defined by the canonical files -- not duplicated in long-form
skill bodies here.

## Using these surfaces

### As standalone skills

Create thin wrappers that read:

- `design-quality-core.md`
- the relevant canonical skill file
- only the needed references

## Source of truth

**Canonical engine and command:** `.claude/commands/` (repo root)

**Canonical skill surfaces:** `craft-skill/` and `refine-skill/`

Sync root command mirrors with `scripts/sync-design-quality-commands.ps1`.
