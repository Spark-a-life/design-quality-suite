# Design Quality Suite -- Skills Pointer

The Design Quality Suite is implemented as **slash commands plus one engine**
under `../.claude/commands/` in this package, with optional **thin wrappers**
in local Claude or Codex skill folders.

## Live surfaces

| Surface | Slug | Description |
|---|---|---|
| **craft** | `craft` | New UI direction or frontend pass using the shared design-quality engine |
| **refine** | `refine` | Existing-project refinement workflow: scan, diagnose, fix, verify |
| **output-contract** | `output-contract` | Completeness contract for implementation-heavy tasks |

Behaviour is defined by the canonical `.md` files -- not duplicated in long-form
skill bodies here.

## Using these surfaces

### In Claude Code

```text
/craft [surface or task]
/refine [surface or task]
/output-contract [task]
```

### As standalone skills

Create thin wrappers that read:

- `design-quality-core.md`
- the relevant command file
- only the needed references

## Source of truth

**Canonical:** `.claude/commands/` (repo root)

Sync mirrors with `scripts/sync-design-quality-commands.ps1`.
