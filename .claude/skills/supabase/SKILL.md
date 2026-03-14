---
name: supabase
description: Supabase Auth, Database, and SSR patterns. Use when working with Supabase client setup, authentication, Row Level Security, database queries, storage, realtime, or @supabase/ssr middleware.
---

# Supabase Skill

## When to Use
- Setting up Supabase client (browser or server)
- Implementing authentication (sign in, sign up, OAuth, session management)
- Writing database queries via Supabase client or `postgres` tagged templates
- Configuring middleware for session refresh
- Setting up Row Level Security (RLS) policies
- Working with Supabase Storage, Realtime, or Edge Functions

## Core Patterns

### Client Setup

#### Browser Client (`@supabase/ssr`)
```ts
"use client";
import { createBrowserClient } from "@supabase/ssr";

export function createSupabaseBrowser() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}
```

#### Server Client (`@supabase/ssr` + cookies)
```ts
import "server-only";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";

export async function createSupabaseServer() {
  const cookieStore = await cookies();
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() { return cookieStore.getAll(); },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) =>
              cookieStore.set(name, value, options)
            );
          } catch {
            // Safe to ignore in Server Components
          }
        },
      },
    }
  );
}
```

#### Middleware (session refresh)
```ts
// src/middleware.ts (or src/proxy.ts for Next.js 16+)
import { createServerClient } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";

export async function middleware(request: NextRequest) {
  let supabaseResponse = NextResponse.next({ request });
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() { return request.cookies.getAll(); },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) => request.cookies.set(name, value));
          supabaseResponse = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          );
        },
      },
    }
  );
  await supabase.auth.getUser();
  return supabaseResponse;
}
```

### Authentication

#### Get current user (server)
```ts
const supabase = await createSupabaseServer();
const { data: { user }, error } = await supabase.auth.getUser();
// NEVER use getSession() for auth checks — only getUser() is secure
```

#### Sign in with OAuth
```ts
const { data, error } = await supabase.auth.signInWithOAuth({
  provider: "github", // or "google", "discord", etc.
  options: { redirectTo: `${origin}/auth/callback` },
});
```

#### Sign out
```ts
await supabase.auth.signOut();
```

#### Auth callback route (exchange code for session)
```ts
// src/app/auth/callback/route.ts
export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get("code");
  if (code) {
    const supabase = await createSupabaseServer();
    const { error } = await supabase.auth.exchangeCodeForSession(code);
    if (!error) return NextResponse.redirect(`${origin}/`);
  }
  return NextResponse.redirect(`${origin}/auth/sign-in`);
}
```

#### Auth UI (pre-built components)
```tsx
import { Auth } from "@supabase/auth-ui-react";
import { ThemeSupa } from "@supabase/auth-ui-shared";

<Auth
  supabaseClient={supabase}
  appearance={{ theme: ThemeSupa }}
  providers={["google", "github"]}
  redirectTo={`${origin}/auth/callback`}
/>
```

#### Auth state listener (client)
```ts
useEffect(() => {
  const { data: { subscription } } = supabase.auth.onAuthStateChange(
    (_event, session) => {
      setUser(session?.user ?? null);
    }
  );
  return () => subscription.unsubscribe();
}, [supabase]);
```

### Database Queries

#### Via Supabase client
```ts
// Select
const { data, error } = await supabase.from("posts").select("*").eq("user_id", userId);

// Insert
const { data, error } = await supabase.from("posts").insert({ title, body }).select().single();

// Update
const { data, error } = await supabase.from("posts").update({ title }).eq("id", id).select().single();

// Delete
const { error } = await supabase.from("posts").delete().eq("id", id);
```

#### Via `postgres` tagged templates (direct SQL)
```ts
import postgres from "postgres";
const sql = postgres(process.env.DATABASE_URL!, { ssl: "require" });

const rows = await sql`SELECT * FROM posts WHERE user_id = ${userId}`;
```

### Row Level Security (RLS)
```sql
-- Enable RLS
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- Policy: users can only see their own posts
CREATE POLICY "Users see own posts" ON posts
  FOR SELECT USING (auth.uid() = user_id);

-- Policy: users can insert their own posts
CREATE POLICY "Users insert own posts" ON posts
  FOR INSERT WITH CHECK (auth.uid() = user_id);
```

### Storage
```ts
// Upload
const { data, error } = await supabase.storage
  .from("avatars")
  .upload(`${userId}/avatar.png`, file);

// Get public URL
const { data } = supabase.storage.from("avatars").getPublicUrl("path/to/file");

// Download
const { data, error } = await supabase.storage.from("avatars").download("path/to/file");
```

### Realtime
```ts
const channel = supabase
  .channel("posts")
  .on("postgres_changes", { event: "INSERT", schema: "public", table: "posts" },
    (payload) => console.log("New post:", payload.new)
  )
  .subscribe();
```

## Environment Variables
```
NEXT_PUBLIC_SUPABASE_URL=https://<project-ref>.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...  (JWT anon key, safe for client)
DATABASE_URL=postgresql://...          (direct Postgres connection)
```

- `NEXT_PUBLIC_*` vars are safe for client-side (anon key has RLS restrictions)
- `DATABASE_URL` is server-only (bypasses RLS)
- Never expose `service_role` key client-side

## Anti-Patterns
- **Don't use `getSession()` for auth checks** — use `getUser()` which validates with the server
- **Don't skip middleware** — session cookies need refreshing to stay alive
- **Don't expose `service_role` key** — it bypasses RLS; use `anon` key client-side
- **Don't create a new Supabase client per request in client components** — use `useState(() => createClient())` to create once
- **Don't forget `try/catch` around `createSupabaseServer()`** during static generation when env vars may be absent

## Integration
- Works with `@supabase/auth-ui-react` for pre-built auth forms
- Use `@supabase/ssr` (not `@supabase/auth-helpers-nextjs` which is deprecated)
- For direct SQL, use `postgres` package alongside Supabase client
- Supabase client respects RLS; `postgres` direct connection bypasses it
