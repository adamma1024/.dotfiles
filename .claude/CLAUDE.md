# Global Claude Code Instructions

These principles apply to ALL projects. Project-specific details (stack, directories, commands) belong in each project's own CLAUDE.md.

## Decision-Making Principles

### Upgrade Forward, Never Downgrade
When a version mismatch exists between packages, ALWAYS upgrade the dependent package to support the newer version. Downgrading pins you to old code, creates tech debt, and delays inevitable migration pain. Ask: "What version of X supports the latest Y?" not "What old version of Y still works with X?"

### Research Industry Standards First
Before implementing any feature or fix, research how popular, production-grade apps solve the same problem. Choose the industry-standard, battle-tested design — not the simplest toy implementation. Example: for chat unread badges, use a `last_read_at` per-conversation pattern (like Stream Chat, WhatsApp, Telegram) instead of a per-message `delivered` boolean.

### Fix Root Causes, Not Symptoms
Never apply workarounds without first identifying the proper fix. If a workaround is faster, implement the proper fix anyway — then decide if the workaround is still needed. Example: don't patch a Podfile compiler flag when the real fix is upgrading the SDK.

### Investigate Before Assuming
Before proposing a fix, verify the ACTUAL setup. Don't assume based on common patterns. Check what tools/services are actually configured (e.g., EAS Secrets vs Expo Environment Variables, npm vs pnpm). Wrong assumptions lead to fixes that need reverting.

### Fail Fast With Clear Errors
Never use `!` non-null assertions on external inputs (env vars, API responses, config files). Add runtime guards that throw descriptive errors explaining what's missing and how to fix it. Silent `undefined` propagation is the worst kind of bug.

### Verify ALL Call Sites
When a component/function accepts parameters, check EVERY instance where it's called — not just the obvious one. Bugs often hide in the secondary call site that was copy-pasted without the new props.

### Audit Dependency Arrays
React `useEffect` dependency arrays are a top source of bugs. Every variable from the closure that could change MUST be in the deps array. When in doubt, split effects by concern — each effect should have one clear trigger.

## Code Quality Standards

### Error Handling
- NEVER swallow errors silently
- Always show user feedback for errors
- Log errors with context for debugging
- Optimistic updates MUST have rollback on failure

### UI States
- Always handle: loading, error, empty, success states
- Show loading ONLY when no data exists (not on refresh)
- Every list needs an empty state

### Mutations
- Disable buttons during async operations
- Show loading indicator on the triggering button
- Always have onError handler with user feedback

## Git Conventions

- **Branch naming**: `ml/{description}` (e.g., `ml/fix-login`)
- **Commit format**: Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, etc.)
- **PR titles**: Same as commit format
- **Commit co-author**: Always include `Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>`
- **Always stash before branching**: Run `git stash` before `git checkout -b` or `git checkout` if there are uncommitted changes. Linter hooks can revert changes during branch switches.

## Testing Philosophy

- **Test-first is non-negotiable**: Never write implementation without a failing test. If fixing a bug, write a test that reproduces it first
- **Run tests before AND after every change**: Tests must pass before moving on
- **Test behavior, not implementation**: Assert on outputs and side effects, not internal state
- **No skipped tests**: Never commit `it.skip()` — either fix or delete

## When Fixing a Bug

1. Write a test that reproduces the bug (must fail)
2. Identify the ROOT CAUSE — not just where it crashes, but WHY
3. Fix the code (test turns green)
4. Check for the same pattern elsewhere in the codebase
5. Add regression guard comment: `// regression: #issue-description`

## When Upgrading Dependencies

1. Check what the latest stable version is — don't settle for "one version up"
2. Run the official upgrade tool if one exists (e.g., `npx expo install --fix`)
3. Upgrade ALL related packages together (don't leave peer deps mismatched)
4. Update test mocks/setup if the upgraded library changed its API
5. Run full test suite — fix failures from the upgrade before touching anything else
6. Update build configs (eas.json, Podfile, etc.) if the upgrade changes requirements

## Slash Commands

- `/setup-workspace` — Bootstrap Claude Code config for any new project
- `/grill` — Ruthless QA: find every flaw, suggest concrete fixes
- `/readme` — Generate polished README with badges
- `/021` — Zero-to-one engineering workflow
- `/pr` — Create conventional PR
- `/review-pr` — Code review a PR
- `/check` — Run lint + test + typecheck
- `/release` — Tag and release
- `/ship` — Build-Grill-Fix loop (see below)
- `/drain` — Compress notes to minimal precise wording (40-60% reduction)
- `/note` — Smart daily note: auto-tag, create tasks, double-link to vault

## /ship — Build-Grill-Fix Loop

Autonomous implementation loop that builds features to industry standard. Invoke with `/ship <feature description>` or `/ship` (reads from project roadmap in `~/my_outside_mind/`).

### Loop Protocol

```
REPEAT until grill finds 0 CRITICAL and 0 HIGH issues:

  PHASE 1 — RESEARCH
  - Research how top 3 apps in the domain solve this (Mercari, OfferUp, FB Marketplace, Xianyu, WhatsApp, Stripe, etc.)
  - Identify the industry-standard pattern, not the toy implementation
  - Check ~/my_outside_mind/ for existing specs and decisions

  PHASE 2 — IMPLEMENT
  - Use parallel agents for independent work (migrations, screens, components, edge functions)
  - Every feature needs: schema + RLS + RPC + UI + i18n (en/zh) + types + error handling + analytics
  - Run tests after implementation. All must pass before proceeding.
  - Commit to feature branch (never main)

  PHASE 3 — GRILL
  - Launch parallel grill agents — one per feature or feature group
  - Each agent acts as a ruthless QA reviewer comparing against industry solutions
  - Check for: security holes (RLS bypass, auth.uid enforcement), dead code paths,
    orphaned screens with no entry point, missing error handling, race conditions,
    N+1 queries, client-side ops that should be server-side, missing DB constraints,
    stale state, cascade effects, abuse vectors, missing empty/loading/error states
  - Classify every issue: CRITICAL / HIGH / MEDIUM / LOW
  - CRITICAL = broken, insecure, or fundamentally wrong approach
  - HIGH = works but deviates from industry standard or has significant edge case gaps

  PHASE 4 — FIX
  - Fix ALL CRITICAL and HIGH issues found in Phase 3
  - Use parallel agents for independent fixes
  - Run tests again. All must pass.
  - Commit fixes.

  PHASE 5 — RE-GRILL
  - Grill again but ONLY the areas that were fixed
  - If new CRITICAL/HIGH found → loop back to PHASE 4
  - If only MEDIUM/LOW remain → exit loop, report remaining items

END REPEAT
```

### Quality Gates (exit criteria)
- 0 CRITICAL issues
- 0 HIGH issues
- All tests passing
- All features have entry points reachable by users
- All DB operations are atomic where needed
- All RPCs enforce auth.uid()
- All client-side state has loading/error/empty handling
- Server-side for reliability (DB triggers > client-side calls)
- i18n complete for all user-facing strings

### Output
After loop exits, produce:
1. Summary of what was built + architecture decisions
2. Remaining MEDIUM/LOW items as GitHub issues
3. Updated feature designs in ~/my_outside_mind/ if specs changed
4. PR ready for review

## Skill Activation

Before implementing, check if skills apply:
- Tests → `testing-patterns`
- Forms → `formik-patterns`
- GraphQL → `graphql-schema`
- Debugging → `systematic-debugging`
- UI → `react-ui-patterns`
- Supabase → `supabase`
- Components → `shadcn-ui`

## External Context

- **Long-term context storage**: `~/my_outside_mind/` — Obsidian vault with project notes, kanbans, dev tracker, journals. Check here for roadmaps, feature specs, and project decisions before asking the user.
  - Project specs: `~/my_outside_mind/notes/projects/`
  - Kanbans: `~/my_outside_mind/kanbans/`
  - Dev tracker: `~/my_outside_mind/dev-tracker-2026.md`

## Tools

- **File searching**: Use `rg` (ripgrep) instead of `grep`
- **JSON processing**: Use `jq` for JSON parsing
- **Package manager**: Check which one the project uses (npm/pnpm/yarn) before running install commands — default to pnpm for Adam's projects
