---
name: pr
description: Create a well-structured Pull Request with conventional format. Use when the user asks to create a PR, submit changes, or open a pull request.
---

# Create Pull Request

## Steps

1. **Check current state:**
   - Run `git status` to see all changes
   - Run `git diff main...HEAD --stat` to see what's different from main
   - Run `git log main..HEAD --oneline` to see commits

2. **Ensure on a feature branch:**
   - If on `main`, create a branch: `git checkout -b <initials>/<description>`
   - Branch naming: `<initials>/<short-description>` (e.g. `ml/fix-login`)

3. **Stage and commit if needed:**
   - Stage specific files (never `git add .`)
   - Use conventional commit format: `feat:`, `fix:`, `docs:`, `test:`, `ci:`, `refactor:`
   - Include `Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>` in commit message

4. **Push and create PR:**
   ```bash
   git push origin <branch-name>
   gh pr create --title "<type>: <description>" --body "$(cat <<'EOF'
   ## Summary
   <1-3 bullet points describing what changed and why>

   ## Changes
   <list of files/areas changed>

   ## Test plan
   - [ ] <specific test steps>

   Generated with [Claude Code](https://claude.com/claude-code)
   EOF
   )"
   ```

5. **Return the PR URL to the user**

## Rules
- PR title under 70 characters
- Always include test plan
- Never force push
- Never push directly to main
