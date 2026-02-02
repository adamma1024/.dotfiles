---
description: Read the whole project and generate a local CLAUDE.md under .claude/, using ~/.claude/CLAUDE.md as a template.
allowed-tools: Read, Write, Glob, Grep, Bash(*)
---

# Init Local CLAUDE.md

Read current folder's files and generate a local CLAUDE.md under .claude/, using ~/.claude/CLAUDE.md as a template.

## Instructions

1. Review current paths
   - List folders and files
   - Understand the constructions of this project

2. **Find related documentation**:
   - Search `/docs/` for files mentioning rules
   - Check */.md files to understand the whole project

3. **Sum up development rules and criteria**:
   - For frontend:
      - Critical Dependencies, like Component lib and framework
      - CSS rules, like the guideline of TailwindCSS
      - Lint rules
   - For backend:
      - TDD
      - Langage, like python
      - Dependencies, like flask
      - Databases, like PostgresDB
      - Lint rules
   - Highlight the file paths of these patterns to check the update

4. **Generate a CLAUDE.md**:
   - Save it to `./.claude/CLAUDE.md`
