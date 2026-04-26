# design-quality-core -- Canonical Engine

**Version:** 1.1.0 | **Date:** 2026-04-11

This is the underlying engine for `craft-skill`, `refine-skill`, and
`/output-contract`. It defines dispatch, reference loading, stack truth, and
verification. It is not meant to be invoked directly.

## Architecture

The suite is intentionally split into:

1. **Engine**
   Shared rules and loading logic live here.
2. **Task surfaces**
   `craft-skill`, `refine-skill`, and `/output-contract` add only task-specific
   behaviour.
3. **References**
   Stack-specific and surface-specific rules are loaded only when needed.

## Dispatch rules

Use:

- `craft-skill` when the user wants a new frontend direction, a fresh UI pass,
  a component system, or deliberate aesthetic refinement.
- `refine-skill` when the user already has a website or app and wants to
  improve it without rewriting the stack.
- `/output-contract` when the task requires complete output, no placeholders,
  and explicit continuation behaviour.

If `refine-skill` and `/output-contract` are both requested on the same task:

- `refine-skill` defines the work method
- `/output-contract` defines the delivery contract
- do not merge or weaken either set of rules

## Mandatory loading order

Always read these first:

1. `references/shared-doctrine.md`
2. `references/verification.md`

Then select exactly one stack reference:

- `references/stack-react-vite-css.md`
- `references/stack-next-tailwind.md`

Then select exactly one surface reference:

- `references/dashboard-mode.md`
- `references/landing-mode.md`

Do not bulk-load every reference file if the stack and surface are already clear.

## Universal rules

### 1. Stack truth first

- Detect the actual framework, styling method, and dependency set before making
  recommendations.
- Do not migrate frameworks by default.
- Do not assume packages exist.

### 2. Existing systems first

- Preserve the current design system and information architecture unless the
  user is explicitly asking for a structural rewrite.
- In redesign work, prefer extraction and targeted improvement over replacement.

### 3. One doctrine, many surfaces

- Shared typography, color, layout, motion, state, and accessibility rules live
  in `shared-doctrine.md`.
- Task surfaces should not restate that doctrine in full.

### 4. Surface-specific intent

- Dashboard and control-plane work should optimize for clarity, signal density,
  and state truth.
- Landing and editorial work may use more narrative pacing and expressive
  spacing.

### 5. Verification after implementation

- If code changes are made, run the most relevant project checks that exist.
- Report what was verified and what was not.

## Failure modes to avoid

- Generic AI layouts that ignore the real stack
- Rewrites justified as "faster" without evidence
- Motion or style ideas that require dependencies not present in the repo
- Placeholder states, dead controls, or invented runtime capability
- Multiple skills or wrappers drifting away from a shared source of truth

## Brand Dispatch (v1.1)

### Brand Flag

Use `--brand` flag to apply brand design tokens from `references/brands/`:

```
/craft --brand linear.app
/refine --brand figma
/output-contract --brand claude
```

Available brands are indexed in `references/index.json`.

### Brand Loading Order

After selecting stack and surface references, if `--brand` flag is present:

5. Load brand meta from `references/brands/{brand}/meta.json`
6. Apply brand tokens (colors, typography, spacing, patterns)
7. Write audit entry to `audit/brand-evaluations/brand-eval-{date}.jsonl` (repo root; create the directory if missing)

### Brand-Aware Failure Modes

| Failure | Response |
|---------|----------|
| Brand not in index | Error: show available alternatives from `references/index.json` |
| Brand-stack conflict | Warn: "Brand aesthetic may conflict with {stack}. Proceeding with adjustments." |
| Missing brand meta | Fallback: use shared-doctrine.md defaults |

### Audit Contract (v1.1)

Every brand-aware invocation writes:

```json
{
  "evaluation_id": "eval-{timestamp}-001",
  "timestamp": "ISO8601 UTC",
  "candidate_slug": "craft-brand-{brand}",
  "verdict": "EVALUATE|DISCARD|PATTERN-ONLY",
  "brand_selected": "{brand}",
  "brand_category": "{category}",
  "stack_detected": "{stack}",
  "stack_compatible": true,
  "gate_chain": ["shared-doctrine", "verification", "stack-{stack}", "surface-{surface}", "brand-{brand}"],
  "elapsed_seconds": 1.8,
  "evaluator": "design-quality-core v1.1.0"
}
```

Audit path: `audit/brand-evaluations/brand-eval-{YYYY-MM-DD}.jsonl` (under the project root; hosts may symlink or redirect elsewhere)

---

## Public contract

Every surface built on this engine must preserve:

- stack truth
- minimal dependency assumptions
- explicit state boundaries
- complete delivery when output is requested
- verifiable changes where feasible
- brand alignment when `--brand` flag is used
