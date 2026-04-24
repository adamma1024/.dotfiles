---
name: drain
description: Compress notes to minimal precise wording. Removes filler, hedge words, redundancy. Preserves links, tags, structure. Targets 40-60% word reduction. Use when the user wants to compress, distill, tighten, or minimize notes.
---

# /drain — Compress Notes to Their Essence

Distill verbose notes into minimal, precise wording. Remove filler. Keep every remaining word load-bearing. Preserve Obsidian links, frontmatter, and structure.

## Usage

```
/drain                              # Drain the current file (user specifies)
/drain notes/projects/app-idea.md   # Drain a specific note
/drain journals/2026-04-20.md       # Compress a journal entry
/drain kanbans/kanban.md            # Tighten a kanban board
/drain notes/learned/               # Drain all notes in a folder
```

## Method

### Step 1: Read and Measure
Read the target file(s). Count words. Identify the note type:
- **Idea/plan** → compress to atomic claims + next actions
- **Journal/log** → extract decisions, blockers, insights; discard narration
- **Study note** → compress to principles + examples; cut redundant explanation
- **Kanban/list** → deduplicate, merge overlapping items, sharpen descriptions
- **Project doc** → compress to requirements, constraints, decisions, open questions

### Step 2: Drain — Remove Water
Strip these on sight:
- **Hedge words**: "I think", "maybe", "probably", "kind of", "seems like", "basically"
- **Filler transitions**: "In order to", "It's worth noting that", "As mentioned above"
- **Redundant context**: restating what's obvious from headers or frontmatter
- **Narrative padding**: backstory that doesn't inform a decision
- **Duplicated ideas**: same point said two ways — keep the sharper one
- **Dead items**: completed tasks with no reference value, stale TODOs that will never happen
- **Vague statements**: "improve performance", "make it better" → replace with specific action or delete

### Step 3: Press — Compress What Remains
Apply these transforms:
- **One idea = one line** (or one short paragraph max)
- **Lead with the verb** for action items: "Implement X" not "We should think about implementing X"
- **Use concrete nouns**: "Neon Postgres" not "the database", "RLS policy" not "security stuff"
- **Numbers over adjectives**: "3 API calls" not "several calls", "200ms" not "slow"
- **Merge related bullets** that say the same thing differently
- **Promote buried insights**: if paragraph 3 has the real point, move it to line 1
- **Shorten headers** to 2-4 words where possible
- **Convert prose to bullets** when content is a list disguised as paragraphs

### Step 4: Preserve Structure
Do NOT remove:
- YAML frontmatter (keep intact, but tighten values if verbose)
- `[[wiki-links]]` — these are the knowledge graph; keep every link
- `#tags` — preserve all tags
- Callout blocks (`> [!type]`) — keep the callout, compress its content
- Code blocks — keep verbatim unless clearly dead/unused
- Section hierarchy — maintain heading levels, but shorten heading text

### Step 5: Report
After draining, output:

```
## Drain Report
| Metric | Before | After | Reduction |
|--------|--------|-------|-----------|
| Words  | X      | Y     | Z%        |
| Lines  | X      | Y     | Z%        |

**Removed:** [1-line summary of what was cut]
**Sharpened:** [1-line summary of what was reworded]
**Preserved:** all links, tags, frontmatter, code blocks
```

Target: **40-60% word reduction** while preserving 100% of actionable information.

## Rules
- Never invent information. Only compress what exists.
- If a sentence is already tight, leave it alone.
- When unsure if something is filler vs. important context, keep it but flag: `<!-- review: is this needed? -->`
- Respect the note's language — if written in Chinese, compress in Chinese. Don't translate.
- For folder targets, process each file independently and show a summary table at the end.
- Always show a diff or before/after for the user to approve before writing changes.
- If the note is already under 100 words and well-written, say so and don't force changes.
