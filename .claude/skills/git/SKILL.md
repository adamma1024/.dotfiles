# Git Conflict Resolution Patterns

Strategies for resolving git conflicts when rebasing feature branches with many diverged changes.

## Pattern 1: Reset + Stash + Rebase (Preferred for heavy conflicts)

**When to use:** Your local branch has commits that conflict heavily with the target branch (e.g., 20+ conflicting files during rebase). Instead of resolving conflicts commit-by-commit during an interactive rebase, flatten everything into unstaged changes and apply them on a clean base.

### Steps

```bash
# 1. Abort any in-progress rebase
git rebase --abort

# 2. Mixed-reset to the remote branch (uncommits but keeps changes as unstaged files)
git reset origin/<your-branch>

# 3. Stash all the unstaged changes
git stash push -m "description of changes"

# 4. Fetch latest and rebase the now-clean branch onto target
git fetch origin main
git rebase origin/main

# 5. Pop the stash — changes apply as unstaged diffs on the fresh base
git stash pop

# 6. Review, stage, and commit
git diff                    # review changes
git add -p                  # stage selectively
git commit -m "message"
```

### Why this works

- `git reset origin/<branch>` converts commits into unstaged working-directory changes (mixed reset)
- `git stash` captures those changes cleanly
- After rebasing the empty branch onto the target, `git stash pop` applies your changes as a single diff against the new base
- Conflicts (if any) are now in **one pass** instead of per-commit during rebase, and often there are **zero conflicts** because git can merge the full diff cleanly

### Comparison with alternatives

| Approach | Conflict resolution | Risk |
|---|---|---|
| `git rebase` (standard) | Per-commit, can cascade | Each commit may re-conflict |
| `git merge` | Single pass | Creates merge commit, messier history |
| **Reset + Stash + Rebase** | **Single pass, often zero** | Squashes commit history into one |

**Trade-off:** This squashes your N commits into one. If you need to preserve individual commit history, use standard rebase instead.

## Pattern 2: Cherry-pick specific commits

**When to use:** You only need 1-2 specific commits from a branch, not the full branch history.

```bash
git checkout target-branch
git cherry-pick <commit-sha>
# resolve conflicts if any
git cherry-pick --continue
```

## Pattern 3: Take ours/theirs for bulk resolution

**When to use:** You know one side is entirely correct for specific files.

```bash
# During a rebase conflict, take the incoming (rebased) version
git checkout --theirs <file>
git add <file>

# Or take the base version
git checkout --ours <file>
git add <file>

# Bulk: accept all incoming changes for a file pattern
git checkout --theirs -- "backend/src/__tests__/*"
git add backend/src/__tests__/
```

## Tips

- Always `git stash list` to verify your stash exists before destructive operations
- Use `git log --oneline -10` and `git log --oneline origin/<branch> -10` to compare local vs remote before any operation
- `git reset` (no flag) = mixed reset = keeps changes unstaged. Use `--hard` only when you want to discard changes entirely
- `git reflog` is your safety net — it tracks every HEAD movement for ~90 days
