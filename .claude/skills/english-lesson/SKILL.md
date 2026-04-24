---
name: english-lesson
description: Summarize English speaking lesson from recording/transcript. Extract vocabulary, categorize topics, highlight common phrases and pronunciation issues, generate practice exercises. Use when processing English lesson recordings, transcripts, or creating lesson summaries.
---

# English Lesson Summarizer

## When to Use

- User says "english lesson", "lesson summary", "summarize my lesson"
- User provides a transcript file, recording, or lesson notes to process
- User wants to create a lesson review note

## Workflow

### Phase 1: Extract Raw Content

**If given a video/audio recording path:**
1. Check if a transcript already exists (look for `-transcript.txt` alongside the file)
2. If no transcript, ask the user to provide one or use a transcription tool
3. Read the transcript file

**If given a transcript or raw notes:**
1. Read the full content
2. Identify speaker turns (teacher vs student) — teacher lines tend to be corrections, prompts, model sentences; student lines tend to have grammar errors and L1 interference

### Phase 2: Analyze & Categorize

**2a. Topic Extraction**
- Identify 3-5 main topics covered in the lesson
- Label each topic concisely (e.g., "Shopping experiences", "Polite refusals", "Storytelling structure")

**2b. Vocabulary Extraction**
- Extract ALL new words and phrases the teacher introduced or corrected
- For each word/phrase capture:
  - English word/phrase
  - Chinese meaning (Mandarin)
  - Example sentence from the lesson (prefer teacher's model sentence)
- Group into: **Lesson Vocabulary** (new words) and **Topic-Specific Vocabulary** (if a sub-domain like relationships, work, etc.)

**2c. Common Phrases & Expressions**
- Extract natural English expressions taught (e.g., "you're all set", "I'm not really into that")
- These are high-value — highlight them prominently
- Include usage context and Chinese equivalent

**2d. Pronunciation & Grammar Issues**
- Extract ALL teacher corrections (student said X → should be Y)
- Categorize corrections:
  - **Pronunciation**: similar-sounding words confused (e.g., "slipped" vs "slept", "lag" vs "leg")
  - **Grammar**: structural errors (e.g., "I try to don't use" → "I try not to use")
  - **Word choice**: wrong word used (e.g., "describe story" → "descriptive story")
  - **Article/plural**: missing articles or plural forms
- Flag **recurring patterns** across lessons if memory exists (check `~/my_outside_mind/notes/english/` for past lessons)

### Phase 3: Generate Practice Exercises

Create practice sections tailored to the student's weak areas:

**3a. Pronunciation Drills**
- List 5-8 minimal pairs or similar-sounding words from the lesson's problem areas
- Format: `word1 vs word2 — meaning1 vs meaning2`
- Include IPA pronunciation where helpful

**3b. Sentence Correction Exercise**
- Take 5-8 actual student errors from the transcript
- Present as "Fix this sentence" exercise with answers in a collapsed callout

**3c. Translation Practice (Chinese → English)**
- Write 8-10 Chinese sentences using the lesson's vocabulary and phrases
- Target the specific grammar patterns and expressions that were taught
- Mix difficulty: some straightforward vocabulary recall, some requiring the lesson's grammar patterns
- Include answers in a collapsed callout

**3d. Speaking Prompts**
- 3-5 questions the student can practice answering using the lesson's vocabulary
- These should be open-ended and personally relevant

### Phase 4: Generate Flashcards

Create Obsidian-compatible flashcards using the `::` separator format:
- Every new vocabulary word gets a flashcard
- Every teacher correction gets a flashcard (test the correct form)
- Key expressions get a "How to say X in English?" flashcard
- Format: `front :: back — example sentence`

### Phase 5: Write the Note

**Use the template** at `~/my_outside_mind/templates/english-lesson.md` (Templater template).

Write the completed note to: `~/my_outside_mind/notes/english/English Lesson {N} - {Topic Summary}.md`

- Determine lesson number by checking existing files in `~/my_outside_mind/notes/english/`
- Topic summary should be 2-4 words capturing the main themes

## Output Structure

The final note follows this structure (matching existing lesson notes):

```
---
title: English Lesson {N} - {Topic Summary}
tags: [english, lesson, flashcards]
date: {YYYY-MM-DD}
---

# Lesson {N} — {Topic Summary}

## Lesson Notes

### Topics Covered
(numbered list of 3-5 topics)

### {Topic Section 1}
(exercises, discussions, teacher prompts in callouts)

### {Topic Section 2}
...

### Vocabulary from This Lesson
(table: Word/Phrase | Meaning | Example)

### Common Phrases & Expressions
(table with usage context — these are the high-value natural expressions)

### Teacher's Feedback & Tips
> [!tip] Key corrections
> (all student errors → corrections)

> [!info] Pronunciation issues
> (problem sounds, minimal pairs, recurring issues)

---

## Practice Exercises

### Pronunciation Drills
(minimal pairs and problem words)

### Fix These Sentences
> [!example]- Answers (click to reveal)
> (corrected versions)

### Translate to English (Chinese → English)
> [!example]- Answers (click to reveal)
> (English translations)

### Speaking Prompts
(open-ended practice questions)

---

## Flashcards #english
(word :: definition — example sentence)
```

## Rules

1. **Faithful to the lesson** — only include what actually happened. Don't invent topics or vocabulary that weren't covered.
2. **Chinese translations are mandatory** — every vocabulary word and phrase needs Mandarin equivalent.
3. **Use teacher's model sentences** — prefer the teacher's corrected/improved versions over student's attempts.
4. **Flag recurring issues** — if a grammar pattern (e.g., -ed vs -ing adjectives) appeared in previous lessons, note it as a recurring issue.
5. **Practice exercises target weak spots** — don't generate generic exercises. Target the specific errors and patterns from THIS lesson.
6. **Translation exercises use natural Chinese** — write Chinese sentences a native speaker would say, requiring the student to produce the English patterns taught.
7. **Match existing note style** — follow the formatting of Lessons 3-5 in `~/my_outside_mind/notes/english/`.
8. **Lesson numbering** — check existing files to determine the next lesson number.

## Cross-Lesson Tracking

When processing a new lesson, quickly scan previous lesson files for:
- Recurring pronunciation issues (build a pattern)
- Vocabulary that reappears (mark as "review" not "new")
- Grammar patterns that keep coming up (escalate prominence)

This helps the student see their progress and persistent weak areas.
