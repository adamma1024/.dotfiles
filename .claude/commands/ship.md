# /ship — Build-Grill-Fix Loop

Autonomous implementation loop that builds features to industry standard. Run the full RESEARCH → IMPLEMENT → GRILL → FIX → RE-GRILL cycle until 0 CRITICAL and 0 HIGH issues remain.

## Usage

```
/ship <feature description>        # Ship a specific feature
/ship                              # Read from ~/my_outside_mind/ roadmap
```

## Argument: $ARGUMENTS

## Protocol

REPEAT until grill finds 0 CRITICAL and 0 HIGH issues:

### PHASE 1 — RESEARCH
- Research how top 3 apps in the domain solve this (Mercari, OfferUp, FB Marketplace, Xianyu, WhatsApp, Stripe, etc.)
- Identify the industry-standard pattern, not the toy implementation
- Check ~/my_outside_mind/ for existing specs and decisions

### PHASE 2 — IMPLEMENT
- Use parallel agents for independent work (migrations, screens, components, edge functions)
- Every feature needs: schema + RLS + RPC + UI + i18n (en/zh) + types + error handling + analytics
- Run tests after implementation. All must pass before proceeding.
- Commit to feature branch (never main)

### PHASE 3 — GRILL
- Launch parallel grill agents — one per feature or feature group
- Each agent acts as a ruthless QA reviewer comparing against industry solutions
- Check for: security holes (RLS bypass, auth.uid enforcement), dead code paths, orphaned screens with no entry point, missing error handling, race conditions, N+1 queries, client-side ops that should be server-side, missing DB constraints, stale state, cascade effects, abuse vectors, missing empty/loading/error states
- Classify every issue: CRITICAL / HIGH / MEDIUM / LOW
- CRITICAL = broken, insecure, or fundamentally wrong approach
- HIGH = works but deviates from industry standard or has significant edge case gaps

### PHASE 4 — FIX
- Fix ALL CRITICAL and HIGH issues found in Phase 3
- Use parallel agents for independent fixes
- Run tests again. All must pass.
- Commit fixes.

### PHASE 5 — RE-GRILL
- Grill again but ONLY the areas that were fixed
- If new CRITICAL/HIGH found → loop back to PHASE 4
- If only MEDIUM/LOW remain → exit loop, report remaining items

END REPEAT

## Quality Gates (exit criteria)
- 0 CRITICAL issues
- 0 HIGH issues
- All tests passing
- All features have entry points reachable by users
- All DB operations are atomic where needed
- All RPCs enforce auth.uid()
- All client-side state has loading/error/empty handling
- Server-side for reliability (DB triggers > client-side calls)
- i18n complete for all user-facing strings

## Output
After loop exits, produce:
1. Summary of what was built + architecture decisions
2. Remaining MEDIUM/LOW items as GitHub issues
3. Updated feature designs in ~/my_outside_mind/ if specs changed
4. Commit ready for review

## What to ship

If no argument is provided, check ~/my_outside_mind/notes/projects/ for the active project's roadmap and find the next unbuilt feature. If an argument is provided, ship that: $ARGUMENTS
