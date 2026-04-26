# Brand Registry — Use Cases

**Version:** 1.0 | **Date:** 2026-04-26 | **Author:** Dr Will

This document explains why the 63-brand design system registry was created and how to use it.

---

## Why 63 Brands?

The brand registry enables **brand-aware UI generation** — AI that produces interfaces matching specific design systems (Linear, Stripe, Figma, etc.).

**Without brands:** Generic AI layouts, mismatched aesthetics
**With brands:** Pixel-matched output aligned to established design systems

---

## The 5 Core Use Cases

### Use Case 1: New UI → Match a Design System

**Request:** "Build me an issue tracker dashboard for my dev team"

**Command:**
```
/craft --brand linear.app
```

**Outcome:** React dashboard with Linear design tokens applied:
- Primary color: `#5E6AD2`
- Sidebar: 240px fixed, `#F7F7F9`
- List items: 32px height
- Buttons: 28px, 6px radius

---

### Use Case 2: Specific Stack + Specific Brand

**Request:** "Create a payment analytics dashboard matching Stripe's style"

**Command:**
```
/craft --brand stripe --stack next-tailwind
```

**Outcome:** Next.js + Tailwind payment UI with Stripe tokens:
- Primary: `#635BFF`
- Data-dense layouts
- Fintech-appropriate spacing

---

### Use Case 3: Refine Existing UI → Brand Alignment

**Request:** "Make my existing dashboard feel like Claude's interface"

**Command:**
```
/refine --brand claude
```

**Outcome:** Targeted refinement of existing UI:
- Primary: `#D4A373` (warm beige)
- Background: `#FEFCF8`
- Text-forward, minimal chrome

---

### Use Case 4: Full Contract Delivery

**Request:** "Build me a complete onboarding flow matching Figma's design system. No placeholders."

**Command:**
```
/craft --brand figma --output-contract
```

**Outcome:** Complete, deployable onboarding UI:
- Figma brand tokens applied
- No TODOs or placeholder code
- Guaranteed continuation if truncated

---

### Use Case 5: Audit Trail Review

**Request:** "Show me all brand-aligned UI work this week"

**Query:** From the project root, read JSONL lines (one JSON object per line), for example:

```powershell
Get-Content "audit/brand-evaluations/brand-eval-*.jsonl" | ConvertFrom-Json
```

**Outcome:** Full audit trail of brand selections:
```
timestamp | brand       | verdict | stack
----------|-------------|---------|------
2026-04-26| linear.app  | EVALUATE| react-vite-css
2026-04-26| stripe      | EVALUATE| next-tailwind
2026-04-26| claude      | EVALUATE| react-vite-css
```

---

## Brand Categories

| Category | Brands | When to Use |
|----------|--------|-------------|
| **AI/LLM** | claude, openai, anthropic, cohere, etc. | Chat interfaces, AI products |
| **Dev Tools** | cursor, vercel, github, raycast, warp | Developer dashboards, IDEs |
| **Design** | figma, framer, miro, webflow, clay | Design tools, creative UIs |
| **Productivity** | linear, notion, posthog, sentry | Project management, analytics |
| **Fintech** | stripe, coinbase, kraken, revolut | Payments, crypto, banking |
| **Backend** | supabase, mongodb, hashicorp | Infrastructure UIs |
| **Automotive** | tesla, bmw, ferrari | Premium/automotive UIs |
| **Retail** | airbnb, shopify, spotify | Consumer products |

---

## Audit Contract

Every brand-aware invocation writes to:

```
audit/brand-evaluations/brand-eval-{YYYY-MM-DD}.jsonl
```

**Schema:**
```json
{
  "evaluation_id": "eval-{timestamp}-001",
  "brand_selected": "{brand}",
  "brand_category": "{category}",
  "stack_detected": "{stack}",
  "gate_chain": ["shared-doctrine", "verification", "stack-{stack}", "surface-{surface}", "brand-{brand}"],
  "verdict": "EVALUATE",
  "elapsed_seconds": 1.8,
  "evaluator": "design-quality-core v1.1.0"
}
```

---

## Quick Reference

| Command | Example |
|---------|---------|
| `/craft --brand {brand}` | `/craft --brand linear.app` |
| `/refine --brand {brand}` | `/refine --brand figma` |
| `/output-contract --brand {brand}` | `/output-contract --brand claude` |
| List all brands | `references/index.json` |

---

## Verification

```powershell
# Count brands
(Get-ChildItem references/brands -Directory).Count
# Output: 63

# List brands by category
Get-Content references/index.json | ConvertFrom-Json | 
  Select-Object -ExpandProperty brands | 
  Group-Object category
```

---

**End of document**