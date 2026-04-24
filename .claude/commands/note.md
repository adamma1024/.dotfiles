---
name: note
description: Take a daily note in the Obsidian vault (~/my_outside_mind). Auto-tags, creates tasks, double-links to existing notes, works with Obsidian plugins. Use when the user wants to journal, capture thoughts, log learnings, or take notes.
---

# /note — Smart Daily Note

Capture thoughts into `~/my_outside_mind/journals/YYYY-MM-DD.md`. Works with the vault's Obsidian plugins natively.

## Usage

```
/note                              # Open today's note for appending
/note learned about React Server Components today
/note TODO: fix SSL on gradpass.site by Friday
```

## Obsidian Integration

Use these vault tools — don't reinvent what plugins already do:

- **Tasks plugin**: `#task` global filter required on every task. Emoji format: `➕` created, `📅` due, `⏳` scheduled, `⏫🔼🔽` priority, `🔁` recurrence. Statuses: `[ ]` todo, `[x]` done, `[/]` in progress, `[-]` cancelled.
- **Dataview**: inline metadata `[key:: value]` for queryable fields (e.g. `[project:: GradPass]`, `[met:: Person]`). Frontmatter `energy:` and `mood:` are queryable.
- **Spaced Repetition**: tags `#flashcards` `#algorithm` `#english` trigger SR review. Card format: `Question :: Answer`. Cloze: `==answer==`.
- **QuickAdd**: kanban capture appends to `kanbans/kanban.md` under `## TODO` as `- [ ] #task content`.
- **Templater**: CLI-created files skip Templater — render all `<% %>` to actual values (dates, links).
- **Calendar**: daily notes at `journals/YYYY-MM-DD.md` exactly. 250 words per dot.
- **Daily planner template**: `templates/daily-planner.md` — use its section structure (Top 3, Task Inbox, Time Blocks, Fleeting Notes, Reflection, Navigation).
- **Obsidian-git**: auto-commits every 5min, auto-pushes every 10min. No manual commit needed.

## Method

### Step 1: Get or Create Today's Journal

Path: `~/my_outside_mind/journals/YYYY-MM-DD.md`

- **Exists**: append to end (never overwrite)
- **Doesn't exist**: render `templates/daily-planner.md` with real dates (not Templater syntax). Include Navigation links to yesterday/tomorrow as `[[YYYY-MM-DD]]`.

### Step 2: Auto-Tag (Existing First)

Match content against vault's tags. **Prefer existing over new:**

`#task` `#job` `#work` `#algorithm` `#english` `#philosophy` `#tools` `#react` `#interview` `#education` `#frontend` `#git` `#mcp` `#security` `#ai` `#agent` `#resume` `#obsidian` `#project`

Only create new tags when clearly needed.

### Step 3: Extract Tasks (Tasks Plugin Format)

Convert actionable items to Tasks plugin format:

```
- [ ] #task #job Fix SSL on gradpass.site ⏫ ➕ 2026-04-21 📅 2026-04-25
```

- `#task` is **mandatory** (global filter)
- Add `#job` for work tasks
- Convert relative dates ("by Friday") to absolute
- Implicit actions ("need to", "follow up") become tasks too

### Step 4: Double-Link Existing Notes

Glob `notes/`, `kanbans/`, `journals/` to verify note exists before linking `[[note-name]]`.

- Link on first mention only
- Match by topic (e.g. "GradPass" → `[[GradPass]]`)
- Max 5 links unless content genuinely references more

### Step 5: Dataview Metadata & SR Cards

- Add `[key:: value]` for queryable fields when useful
- Format factual learnings as SR cards: `Question :: Answer #flashcards`

### Step 6: Place in Correct Section

| Content | Section in daily planner |
|---------|------------------------|
| Tasks | `## 📋 Task Inbox` → `### 💼 Job` or `### 🏠 Life` |
| Learnings | `## �� Fleeting Notes` |
| Reflection | `## 🌙 Daily Reflection` |
| General | New timestamped section at end (before Navigation) |

If journal already has content, append as:

```markdown

---

## HH:MM — [short title]

[tags] [metadata]

[content with [[links]]]

[tasks]
```

### Step 7: Cross-Reference

- Tasks for kanban → ask "Add to [[Master Kanban]]?" before modifying
- Don't auto-modify other files without confirmation

### Step 8: Summary

```
📝 journals/YYYY-MM-DD.md
Tags: #tag1 #tag2 | Tasks: N | Links: [[X]], [[Y]]
```

## Rules

- Append-only. Never overwrite.
- Chinese stays Chinese.
- Existing tags first.
- Glob before linking.
- `#task` on every task (Tasks plugin).
- Render Templater expressions (CLI bypasses Templater).
- Obsidian-git handles commits.
