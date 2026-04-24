---
name: contract
description: Generate professional Chinese software development contracts (软件开发合同). Use when creating, modifying, or reviewing software development contracts for freelance/agency work. Covers IP, milestones, payment, maintenance, liability, and third-party service cost evaluation.
---

# Software Development Contract Skill (软件开发合同)

## When to Use
- Creating a new software development contract for a client
- Modifying an existing contract for a new version/phase
- Reviewing contract terms for completeness
- Evaluating third-party service costs for a project
- Generating a contract from a requirements document or feature list

## Invocation
`/contract` or `/contract <project-name>`

## Input Required
Before generating, gather:
1. **Project name** and version
2. **Feature list** with descriptions (shipped + planned)
3. **Tech stack** (languages, frameworks, services)
4. **Timeline** (working days, milestone count)
5. **Client info** (甲方) — or leave blank for template
6. **Developer info** (乙方) — company name, address, contact, bank account

If not provided, prompt the user for these.

## Contract Structure (中国软件开发合同标准结构)

Generate contracts with these sections in order:

### Header
- 合同标题 (contract title)
- 甲方信息 (client info — name, address, representative, contact)
- 乙方信息 (developer info — company, address, representative, contact)
- 鉴于条款 (recitals — background, purpose, legal basis citing 民法典)

### 第一条 项目内容及要求
- 项目名称
- 开发内容 (scope summary + reference to attached requirements doc)
- 开发平台/语言 (tech stack)
- 预计交付时间 (delivery timeline in working days + absolute date blank)

### 第二条 合同金额及支付方式

#### Pricing Table
- Number each feature/module with clear description
- Include sub-items with technical detail (DB, API, UI, etc.)
- Show individual prices per module
- Add subtotal and total rows
- Include note: "分解价格为参考，项目仍然为整体预算价格，不能据此删减"
- If features have mixed status (done/not started), add note explaining

#### Third-Party Service Cost Evaluation
**ALWAYS include this section.** Research and list all third-party services the project depends on:

Template for each service:
```
| Service | Free Tier | Small Scale (cost/mo) | Medium Scale (cost/mo) |
```

Common services to evaluate:
- **Hosting/PaaS:** Vercel, Railway, Fly.io, AWS, etc.
- **Database:** Supabase, PlanetScale, Neon, Firebase, etc.
- **Auth:** Supabase Auth, Clerk, Auth0, etc.
- **Storage:** Supabase Storage, Cloudflare R2, S3, etc.
- **Mobile builds:** EAS, Fastlane + CI, etc.
- **App Store:** Apple Developer ($99/yr), Google Play ($25 one-time)
- **Monitoring:** Sentry, LogRocket, Datadog, etc.
- **Domain:** Annual cost for project domain
- **Push notifications:** Expo Push, OneSignal, FCM, etc.
- **CDN/Edge:** Cloudflare, Vercel Edge, etc.
- **Email:** Resend, SendGrid, Postmark, etc.
- **Search:** Meilisearch Cloud, Algolia, Typesense, etc.

Add summary table with monthly/annual estimates at two scales.
Add note: prices are estimates, 甲方 pays directly to service providers, not included in contract price.

#### Payment Structure
Standard splits (choose based on project size):
- **Small project (< ¥30K):** 50/50 (signing + delivery)
- **Medium project (¥30K-80K):** 30/30/20/20 (signing + mid1 + mid2 + final)
- **Large project (> ¥80K):** 20/30/30/10/10 (signing + 3 milestones + warranty retention)

Payment triggers tied to milestone acceptance.
Include 乙方 bank account details.

#### Maintenance/Ops Fees
- If first contract: include annual maintenance fee (¥X/year after free period)
- If upgrade contract: reference existing maintenance terms from prior contract

### 第三条 双方权利义务

#### 甲方责任 (Client Obligations):
- Pay on time
- Provide requirements, test support, acceptance sign-off
- Provide necessary accounts/credentials (App Store, domains, API keys)
- Provide materials for regulatory compliance

#### 乙方责任 (Developer Obligations):
- Deliver on time and to quality standards
- Provide technical documentation and user guides
- Free maintenance period (standard: 12 months)
- Handle App Store review issues during maintenance
- Confidentiality of client data

### 第四条 知识产权归属
- All IP transfers to 甲方 upon full payment
- 乙方 guarantees originality, no infringement
- List open-source components used and their licenses
- 乙方 retains rights to general tools/methodologies (non-restrictive)
- App Store accounts and publishing rights belong to 甲方
- 乙方 may showcase as portfolio with written permission (no source code disclosure)

### 第五条 项目里程碑与验收

#### Milestone Table
```
| Phase | Duration | Deliverables | Acceptance Criteria |
```

Guidelines:
- 1-2 week phases for projects under 3 months
- Each milestone has specific, testable acceptance criteria
- First milestone: infrastructure + core feature (demo-able)
- Last milestone: App Store submission + launch

#### Acceptance Rules:
- Test environment + test report at each milestone
- Rejection → fix within 10-15 working days
- 甲方 must accept within 7-10 working days (silence = acceptance)
- Final acceptance = successful App Store/production launch

### 第六条 维护与运维
- Free maintenance period: 12 months (standard)
- Response times:
  - 紧急 (critical — crash/unusable): 4hr response, 24hr fix
  - 一般 (normal — feature bug/UI): 24hr response, 72hr fix
  - 建议 (suggestion): next version iteration
- iOS/Android version compatibility during maintenance
- Renewal pricing after free period (annual fee + labor)

### 第七条 违约责任
- Breach → compensation for damages
- Developer delay > 15 working days → 0.5%/day penalty, capped at 15%
- Client-caused delay → no developer liability, client bears costs
- Client cancellation → paid amounts non-refundable, unpaid settled by completion %
- Material breach → termination + damages

### 第八条 保密条款
- Mutual NDA for business secrets, technical secrets, user data
- Duration: 2 years after contract termination
- No use of client user data for unrelated purposes

### 第九条 争议解决
- Friendly negotiation first
- Litigation at 甲方所在地 court (client's jurisdiction)
- Alternative: CIETAC arbitration for larger contracts

### 第十条 其他条款
- Two copies, one per party, equal legal effect
- Effective upon signing and stamping (盖章)
- If upgrade contract: reference as supplement to prior contract
- Supplementary agreements have equal legal effect
- Attachments list (requirements doc, etc.)

### Signature Block
```
甲方（盖章）：
代表签字：
签署日期：  年  月  日

乙方（盖章）：[合同专用章]
代表签字：
签署日期：  年  月  日
```

## Formatting Rules

1. **Language:** Chinese (Simplified) throughout. Technical terms in English where industry-standard (e.g., RLS, PostGIS, API)
2. **Currency:** RMB (¥) for contract amounts. USD ($) for third-party services (with note about exchange rate)
3. **Numbers:** Use Chinese uppercase for total amount (e.g., 肆万伍仟整)
4. **Dates:** Use blanks for signing dates (\_\_ 年 \_\_ 月 \_\_ 日)
5. **Separators:** Use `------------------------------------------------------------------------` between sections
6. **Tables:** Pandoc-compatible pipe tables or grid tables
7. **Legal references:** Cite 民法典 (Civil Code of PRC) in recitals

## Chinese Uppercase Number Reference
| Digit | 大写 |
|-------|------|
| 0 | 零 |
| 1 | 壹 |
| 2 | 贰 |
| 3 | 叁 |
| 4 | 肆 |
| 5 | 伍 |
| 6 | 陆 |
| 7 | 柒 |
| 8 | 捌 |
| 9 | 玖 |
| 10 | 拾 |
| 100 | 佰 |
| 1000 | 仟 |
| 10000 | 万 |

## Output Format

1. Generate `.md` file with the contract
2. Convert to `.docx` via pandoc: `pandoc input.md -o output.docx`
3. If a reference `.docx` exists, use `--reference-doc` for styling

## Quality Checklist

Before delivering, verify:
- [ ] All features from requirements are listed in pricing table
- [ ] Pricing subtotals and totals are mathematically correct
- [ ] Chinese uppercase amount matches numeric amount
- [ ] Payment percentages sum to 100%
- [ ] Payment amounts match total × percentage
- [ ] Milestones cover all features with no orphans
- [ ] Acceptance criteria are specific and testable
- [ ] Third-party services section is complete
- [ ] 乙方 bank account details are included
- [ ] Both signature blocks are present
- [ ] Attachment list references requirements doc
- [ ] No tabs in any table (spaces only)

## Common Pitfalls to Avoid

1. **Vague acceptance criteria** — "功能正常" is not enough. Specify: "可发布租房帖子并完整展示全部字段，房型筛选可用"
2. **No penalty cap** — Always cap delay penalties (standard: 15% of contract value)
3. **Missing change order process** — If scope changes, reference supplementary agreement mechanism
4. **No fapiao/invoice terms** — Consider adding if client needs formal tax invoices
5. **Unclear IP during development** — IP belongs to developer until full payment, then transfers
6. **Missing source code delivery** — Specify that source code + docs are delivered upon payment
7. **No force majeure** — Consider adding for larger contracts
8. **Maintenance period ambiguity** — Clearly state start date (delivery acceptance) and duration
