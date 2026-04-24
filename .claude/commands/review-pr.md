---
name: review-pr
description: Review a Pull Request for code quality, bugs, and best practices. Use when the user asks to review a PR, check a PR, or audit changes.
---

# Review Pull Request

Takes a PR number or URL as argument. If not provided, review the most recent PR.

## Steps

1. **Fetch PR details:**
   ```bash
   gh pr view <number> --json title,body,additions,deletions,files,reviews
   gh pr diff <number>
   gh pr view <number> --comments
   ```

2. **Review checklist — check each item:**

   ### Code Quality
   - [ ] No `console.log` in production code
   - [ ] No `any` types (use `unknown` instead)
   - [ ] No hardcoded strings that should be i18n keys
   - [ ] Error handling present (no silent catches)
   - [ ] `captureException` called in catch blocks

   ### Security
   - [ ] No hardcoded API keys or secrets
   - [ ] No SQL injection risks (escaped user input)
   - [ ] No XSS risks
   - [ ] DB values use English identifiers (not Chinese)

   ### Testing
   - [ ] New code has corresponding tests
   - [ ] Tests cover edge cases (empty, null, error)
   - [ ] Test names describe behavior

   ### iOS / React Native
   - [ ] No emojis (use Ionicons)
   - [ ] Responsive scaling used for hardcoded sizes
   - [ ] Accessibility labels on interactive elements
   - [ ] Loading, error, and empty states handled

   ### Git
   - [ ] Conventional commit messages
   - [ ] PR title under 70 characters
   - [ ] No unrelated changes mixed in

3. **Provide feedback as a structured review:**
   - List issues found with file:line references
   - Categorize as: blocker, suggestion, nit
   - If clean, approve

4. **Post review:**
   ```bash
   gh pr review <number> --comment --body "<review>"
   # or
   gh pr review <number> --approve --body "LGTM"
   ```
