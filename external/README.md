# external/ — Skills de terceros

Este directorio contiene **129 agent skills** de otros autores, curadas de los topics más relevantes de [skills.sh](https://skills.sh) (design, nextjs, react, databases) y de los repos de autores reconocidos del ecosistema. **Todo el contenido bajo `external/` es propiedad intelectual de sus autores originales**, copiado aquí solo como conveniencia de instalación bajo las licencias permisivas correspondientes.

## Atribución y licencias

| Carpeta | Repo original | Skills | Licencia | Autor |
|---|---|---:|---|---|
| `anthropics-skills/` | [anthropics/skills](https://github.com/anthropics/skills) | 17 | MIT | Anthropic |
| `aparente-tufte-viz/` | [gist aparente/e48c353…](https://gist.github.com/aparente/e48c353755958621b3c0004593105a90) | 1 | sin LICENSE explícita (gist público) | aparente |
| `arvindrk-extract-design-system/` | [arvindrk/extract-design-system](https://github.com/arvindrk/extract-design-system) | 1 | MIT | Arvind RK |
| `coreyhaines31-marketingskills/` | [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | 2 | MIT | Corey Haines |
| `emilkowalski-skill/` | [emilkowalski/skill](https://github.com/emilkowalski/skill) | 1 | sin LICENSE explícita | Emil Kowalski |
| `expo-skills/` | [expo/skills](https://github.com/expo/skills) | 15 | MIT | Expo |
| `jakubantalik-transitions-dev/` | [Jakubantalik/transitions.dev](https://github.com/Jakubantalik/transitions.dev) | 1 | sin LICENSE explícita | Jakub Antalik |
| `leonxlnx-taste-skill/` | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | 4 | MIT | Leonxlnx |
| `mattbx-shadcn-skills/` | [mattbx/shadcn-skills](https://github.com/mattbx/shadcn-skills) | 2 | MIT | Matt Bx |
| `mattpocock-skills/` | [mattpocock/skills](https://github.com/mattpocock/skills) | 28 | MIT | Matt Pocock |
| `neondatabase-agent-skills/` | [neondatabase/agent-skills](https://github.com/neondatabase/agent-skills) | 4 | MIT | Neon Database |
| `nextlevelbuilder-ui-ux-pro-max/` | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | 7 | MIT | Next Level Builder |
| `obra-superpowers/` | [obra/superpowers](https://github.com/obra/superpowers) | 14 | MIT | obra |
| `pbakaus-impeccable/` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | 1 | Apache-2.0 | Paul Bakaus |
| `shadcn-ui-ui/` | [shadcn-ui/ui](https://github.com/shadcn-ui/ui) | 1 | MIT | shadcn |
| `sickn33-antigravity-awesome-skills/` | [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) | 1 | MIT | sickn33 |
| `supabase-agent-skills/` | [supabase/agent-skills](https://github.com/supabase/agent-skills) | 2 | MIT | Supabase |
| `tursodatabase-agent-skills/` | [tursodatabase/agent-skills](https://github.com/tursodatabase/agent-skills) | 1 | MIT | Turso |
| `vercel-ai/` | [vercel/ai](https://github.com/vercel/ai) | 1 | Apache-2.0 | Vercel |
| `vercel-labs-agent-skills/` | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | 8 | sin LICENSE explícita | Vercel Labs |
| `vercel-labs-next-skills/` | [vercel-labs/next-skills](https://github.com/vercel-labs/next-skills) | 3 | sin LICENSE explícita | Vercel Labs |
| `vercel-labs-skills/` | [vercel-labs/skills](https://github.com/vercel-labs/skills) | 1 | sin LICENSE explícita | Vercel Labs |
| `vercel-turborepo/` | [vercel/turborepo](https://github.com/vercel/turborepo) | 1 | MIT | Vercel |
| `wshobson-agents/` | [wshobson/agents](https://github.com/wshobson/agents) | 12 | MIT | wshobson |

**Total:** 129 skills, mayoritariamente bajo licencia MIT (permisiva — permite redistribución con atribución), unas pocas Apache-2.0 (también permisiva), y algunas sin LICENSE explícita pero públicas en GitHub.

## Sobre los repos sin LICENSE explícita

Algunos repos (`Jakubantalik/transitions.dev`, `vercel-labs/agent-skills`, `vercel-labs/skills`) no tienen archivo LICENSE detectable. Su contenido está disponible públicamente en GitHub y este directorio sirve como **mirror de conveniencia con atribución completa al autor original**. Si sos el autor de alguno de estos repos y querés que tu contenido sea retirado o que se aclare la licencia, abrí un issue en este repo.

## Lo que NO se redistribuye

- Skills de NVIDIA (143 skills del repo `nvidia/skills`) — instalalas directo desde su fuente
- Skills de plugins de Claude Code (`superpowers@claude-plugins-official`, `obsidian@obsidian-skills`, `vercel@claude-plugins-official`, etc.) — se gestionan vía el sistema de plugins de Claude Code

## Catálogo por tema

### Frontend / React / Next.js
- `shadcn-ui-ui/shadcn/` — Skill oficial de shadcn-ui
- `mattbx-shadcn-skills/{shadcn-component-discovery, shadcn-component-review}/`
- `vercel-labs-agent-skills/{vercel-react-best-practices, vercel-composition-patterns, web-design-guidelines, ...}`
- `wshobson-agents/{nextjs-app-router-patterns, tailwind-design-system, typescript-advanced-types}/`
- `anthropics-skills/{frontend-design, canvas-design, theme-factory, web-artifacts-builder, brand-guidelines}/`

### Backend / APIs
- `wshobson-agents/{fastapi-templates, nodejs-backend-patterns, async-python-patterns, api-design-principles, architecture-decision-records}/`
- `anthropics-skills/{claude-api, mcp-builder}/`

### Databases
- `supabase-agent-skills/{supabase, supabase-postgres-best-practices}/`
- `neondatabase-agent-skills/{neon-postgres, neon-postgres-branches, neon-postgres-egress-optimizer, claimable-postgres}/`
- `tursodatabase-agent-skills/turso-db/`
- `sickn33-antigravity-awesome-skills/prisma-expert/`

### Mobile / Expo / React Native
- `expo-skills/` — 15 skills (expo-dev-client, expo-deployment, expo-api-routes, eas-update-insights, expo-ui-swift-ui, etc.)
- `vercel-labs-agent-skills/vercel-react-native-skills/`

### Dev process / workflow
- `obra-superpowers/{brainstorming, writing-plans, executing-plans, test-driven-development, systematic-debugging, using-git-worktrees, dispatching-parallel-agents, ...}/` — 14 skills
- `mattpocock-skills/engineering/{improve-codebase-architecture, grill-with-docs, zoom-out, prototype, to-issues, to-prd, tdd, ...}/`
- `mattpocock-skills/productivity/{handoff, grill-me, write-a-skill, ...}/`

### Design / UI taste (terceros, distintos de las propias)
- `leonxlnx-taste-skill/{image-to-code-skill, brandkit, imagegen-frontend-web, imagegen-frontend-mobile}/`
- `jakubantalik-transitions-dev/transitions-dev/`

### Office / Documents
- `anthropics-skills/{pdf, docx, xlsx, pptx}/` — procesamiento de archivos office
- `anthropics-skills/doc-coauthoring/`

### Marketing / SEO
- `coreyhaines31-marketingskills/{copywriting, seo-audit}/`

### AI SDKs / Agent infra
- `vercel-ai/ai-sdk/`
- `vercel-labs-skills/find-skills/`
- `anthropics-skills/{skill-creator, claude-api, mcp-builder}/`

### Monorepo / Build tools
- `vercel-turborepo/turborepo/`
- `wshobson-agents/monorepo-management/`

## Cómo se instalan

El `install.sh` del repo principal recorre tanto `skills/` como `external/` y crea symlinks en `~/.agents/skills/` apuntando a cada `SKILL.md` (vía su directorio padre). Después corre `sync-skills.sh` para que los 5 agentes (Claude Code, Codex, Cursor, Continue, Antigravity) las vean todas.

```bash
~/mis-skills/install.sh
```

## Actualizar las skills externas

Como las skills externas son **copias de los repos originales**, conviene actualizarlas periódicamente. Cuando los autores upstream publiquen mejoras:

```bash
cd ~/mis-skills
# pull del repo principal trae las actualizaciones que yo (Mauro) integre
git pull
# después re-correr install.sh para refrescar symlinks si cambian rutas
./install.sh
```

Si querés contribuir trayendo updates de un repo upstream, hacé un PR.
