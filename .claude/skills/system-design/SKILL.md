---
name: system-design
description: System design interview note creation from Hello Interview or similar sources. Use when studying system design, creating system design notes, or summarizing system design problem breakdowns. Covers requirements, entities, API, architecture, and deep dives.
---

# System Design Note Creator

## When to Use

- User shares a Hello Interview or similar system design URL
- User says "system design" + a system name (e.g., "design Uber", "design WhatsApp")

## Core Principle

**Summarize ONLY what the source shows. Do NOT expand, embellish, or add your own analysis.** The user needs concise notes they can review quickly before an interview — not an encyclopedia.

## Workflow

### Phase 1: Fetch Content & Images

1. WebFetch the URL. If JS-rendered (returns only CSS), use a subagent with WebSearch to find the content.
2. Also try the answer key URL: replace `problem-breakdowns` with `answer-keys`.
3. Use a subagent to find ALL image URLs on `files.hellointerview.com` CDN.
4. Download all SVGs/PNGs to `~/my_outside_mind/notes/assets/system-design/` named `{system}-{description}.svg`.

### Phase 2: Create Note

Create at `~/my_outside_mind/notes/interview/system design/Design {System}.md`.

**Structure follows Hello Interview's own flow:**

```
---
title: Design {System}
type: system-design
difficulty: {easy|medium|hard}
date-added: {YYYY-MM-DD}
status: in-progress
source: {URL}
tags: [system-design, interview]
---
# Design {System}

> [!info] Source + one-line context

## Requirements
- Embed requirements diagram
- FR: numbered list, use Hello Interview's exact wording
- NFR: numbered list with their exact numbers
- Below the line: brief list of out-of-scope items

## Core Entities
- Embed entities diagram
- Brief list or table — match source

## API Design
- Code block with endpoints exactly as source shows
- Callout for key design decisions (polling vs WS, sync vs async)

## High-Level Architecture
- Embed diagrams progressively (simple → full) as source builds up
- Walk through each functional requirement showing how architecture evolves
- Include data flow numbered lists
- Use Bad/Good/Great/Optimal tiers when source uses them

## Deep Dives
- ONLY the deep dives the source covers
- Embed relevant diagrams
- Problem → Solution → Trade-offs
- Use comparison tables for tiered solutions

## Review Checklist
- Checkbox summary

## Key Patterns Used
- ASCII tree of patterns
```

## Rules

1. **Faithful to source** — only include what Hello Interview actually covers. If it's behind a paywall or not shown, omit it.
2. **Concise** — interview-speed notes. No walls of text. Tables > paragraphs.
3. **Embed images** at the top of each relevant section with italic caption.
4. **Use `==highlight==`** sparingly for truly key terms.
5. **Use Obsidian callouts** for tips, warnings, and interview guidance from the source.
6. **Use Hello Interview's tiered pattern** (Bad/Good/Great/Optimal) when they use it.
7. **Include the source's exact interview tips** — these are gold for prep.
8. **No invented sections** — if the source doesn't cover surge pricing, don't add surge pricing.
