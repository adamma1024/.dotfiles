# /readme — Generate a Modern, Handsome README

Generate a polished, badge-heavy, well-structured README.md for the current repository. Inspired by top GitHub repos like [shadcn/ui](https://github.com/shadcn-ui/ui), [Next.js](https://github.com/vercel/next.js), [Tailwind CSS](https://github.com/tailwindlabs/tailwindcss), [Cal.com](https://github.com/calcom/cal.com), and [Documenso](https://github.com/documenso/documenso).

## What to do

### Step 1: Read the Project
- Read `package.json` (or equivalent) for name, description, scripts, dependencies
- Read existing `README.md` if any
- Read `CLAUDE.md` if exists
- Scan `src/` structure to understand architecture
- Check for `.env.example` or environment variable patterns

### Step 2: Write the README

Follow this exact structure:

```markdown
<p align="center">
  <img src="[logo path or placeholder]" width="60" />
</p>

<h1 align="center">[Project Name]</h1>

<p align="center">
  <strong>[One-line tagline — punchy, memorable]</strong><br/>
  [One sentence expanding on what it does]
</p>

<p align="center">
  <a href="#features">Features</a> &bull;
  <a href="#quick-start">Quick Start</a> &bull;
  <a href="#architecture">Architecture</a> &bull;
  <a href="#tech-stack">Tech Stack</a> &bull;
  <a href="#contributing">Contributing</a>
</p>

<p align="center">
  [BADGES — see badge rules below]
</p>
```

### Badge Rules
Include ALL relevant badges using shields.io format. Pick from:

**Framework/Runtime:**
```
![Next.js](https://img.shields.io/badge/Next.js-16-black?logo=nextdotjs)
![React](https://img.shields.io/badge/React-19-61dafb?logo=react)
![Node.js](https://img.shields.io/badge/Node.js-20+-339933?logo=nodedotjs)
![Python](https://img.shields.io/badge/Python-3.12-3776ab?logo=python)
![Swift](https://img.shields.io/badge/Swift-6-f05138?logo=swift)
![Kotlin](https://img.shields.io/badge/Kotlin-2.0-7f52ff?logo=kotlin)
![Rust](https://img.shields.io/badge/Rust-stable-dea584?logo=rust)
```

**Language/Types:**
```
![TypeScript](https://img.shields.io/badge/TypeScript-strict-blue?logo=typescript)
![JavaScript](https://img.shields.io/badge/JavaScript-ES2024-f7df1e?logo=javascript)
```

**Styling:**
```
![Tailwind](https://img.shields.io/badge/Tailwind-v4-38bdf8?logo=tailwindcss)
![shadcn/ui](https://img.shields.io/badge/shadcn%2Fui-latest-000?logo=shadcnui)
```

**Database:**
```
![Postgres](https://img.shields.io/badge/Postgres-16-336791?logo=postgresql)
![Neon](https://img.shields.io/badge/Neon-Serverless-00e599?logo=postgresql)
![Supabase](https://img.shields.io/badge/Supabase-Auth%20%2B%20DB-3fcf8e?logo=supabase)
![Redis](https://img.shields.io/badge/Redis-7-dc382d?logo=redis)
![MongoDB](https://img.shields.io/badge/MongoDB-7-47a248?logo=mongodb)
```

**AI:**
```
![Claude](https://img.shields.io/badge/Claude-Opus%20%7C%20Sonnet-cc785c?logo=anthropic)
![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4o-412991?logo=openai)
```

**Platform/Deploy:**
```
![Vercel](https://img.shields.io/badge/Vercel-deployed-000?logo=vercel)
![Docker](https://img.shields.io/badge/Docker-ready-2496ed?logo=docker)
![iOS](https://img.shields.io/badge/iOS-17+-000?logo=apple)
![Android](https://img.shields.io/badge/Android-14+-3ddc84?logo=android)
```

**Quality:**
```
![License](https://img.shields.io/badge/License-MIT-green)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)
```

Only include badges for technologies actually used. Check `package.json` dependencies.

### Section Rules

**Features** — Use a table or bullet list. Short descriptions. Show, don't tell.

**Quick Start** — Prerequisites → Clone → Install → Configure → Run. Use `bash` code blocks. Include `.env.example` content if applicable.

**Architecture** — ASCII tree of `src/` directory with one-line descriptions per directory. Only show directories that matter.

**Tech Stack** — Table with Layer | Technology columns. Link to docs.

**Scripts** — `bash` code block with all available commands.

**Environment Variables** — Table with Variable | Required | Description columns.

**Contributing** — Short, inviting. Fork → Branch → Commit → PR.

**License** — One line.

### Style Rules
- **No walls of text** — use tables, badges, and code blocks to break up content
- **Centered header** — always center the logo, title, tagline, and nav
- **One tagline, one description** — the tagline is punchy (under 10 words), the description is one sentence
- **ASCII art is fine** for architecture diagrams
- **No screenshots placeholder** — only include screenshot sections if there are actual screenshots
- **Footer** — end with a centered `<sub>` tagline or quote
- **No emojis in headings** — clean, professional look
- **Horizontal rules** (`---`) between major sections for visual breathing room
