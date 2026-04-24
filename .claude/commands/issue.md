---
name: issue
description: Create a GitHub issue with structured format, labels, and milestone. Use when the user reports a bug, requests a feature, or wants to track work.
---

# Create GitHub Issue

Determine the issue type from the user's request. Before creating, check available labels and milestones:

```bash
gh label list --limit 20
gh milestone list
```

If needed labels don't exist, create them:
```bash
gh label create "bug" --color "d73a4a" --description "Something isn't working"
gh label create "enhancement" --color "a2eeef" --description "New feature or request"
gh label create "task" --color "0075ca" --description "Internal task"
gh label create "test" --color "bfd4f2" --description "Test coverage"
gh label create "docs" --color "0e8a16" --description "Documentation"
gh label create "P0" --color "b60205" --description "Critical priority"
gh label create "P1" --color "e99695" --description "High priority"
gh label create "P2" --color "fbca04" --description "Medium priority"
```

## Bug Report
```bash
gh issue create \
  --title "bug: <short description>" \
  --label "bug" \
  --milestone "<current milestone if exists>" \
  --body "$(cat <<'EOF'
## Bug Description
<What happened>

## Expected Behavior
<What should happen>

## Steps to Reproduce
1. <step 1>
2. <step 2>

## Environment
- Device: <iPhone model or simulator>
- iOS Version: <version>
- App Version: <version>

## Screenshots
<if applicable>
EOF
)"
```

## Feature Request
```bash
gh issue create \
  --title "feat: <short description>" \
  --label "enhancement" \
  --milestone "<current milestone if exists>" \
  --body "$(cat <<'EOF'
## Feature Description
<What the feature does>

## Motivation
<Why this is needed>

## Proposed Solution
<How to implement it>

## Acceptance Criteria
- [ ] <criterion 1>
- [ ] <criterion 2>
EOF
)"
```

## Task / Chore
```bash
gh issue create \
  --title "chore: <short description>" \
  --label "task" \
  --milestone "<current milestone if exists>" \
  --body "$(cat <<'EOF'
## Description
<What needs to be done>

## Acceptance Criteria
- [ ] <criterion 1>
- [ ] <criterion 2>
EOF
)"
```

## Priority Labels
Add priority label based on urgency:
- `--label "P0"` — Critical: app crashes, data loss, security
- `--label "P1"` — High: major feature broken, bad UX
- `--label "P2"` — Medium: minor bug, polish, nice-to-have

## Milestone
Check existing milestones first. If the user mentions a version (v1.0, v1.5, v2.0), use or create that milestone:
```bash
gh milestone create "v1.5" --description "Merchant features, distance filter"
```

Return the issue URL to the user.
