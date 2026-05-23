# Auditoría del ecosistema de skills

Resultado de revisar las 192 skills del pool universal `~/.agents/skills/` (fuera de las 10 propias de este repo). Para cada una se evaluó relevancia para un stack web/AI-agents (React/Next/Tailwind/Vercel, Node/Python/FastAPI, Anthropic SDK/MCP/LangChain, diseño UI/UX) sin acceso a NVIDIA GPUs ni clusters SLURM.

**Sumario**: 45 KEEP (23%) · 1 DUPLICATE · 4 LOW-VALUE · 142 OUT-OF-SCOPE (74%).

## ✅ Las 45 que valen la pena instalar

### Frontend (17)
- `nextjs-app-router-patterns`
- `vercel-composition-patterns`
- `vercel-react-best-practices`
- `tailwind-design-system`
- `transitions-dev`
- `web-design-guidelines`
- `native-data-fetching`
- `monorepo-management`
- `turborepo`
- `webapp-testing`
- `gsap-core`, `gsap-react`, `gsap-scrolltrigger`, `gsap-timeline`, `gsap-plugins`, `gsap-utils`, `gsap-performance`

### Backend (7)
- `fastapi-templates`
- `nodejs-backend-patterns`
- `async-python-patterns`
- `python-performance-optimization`
- `prisma-expert`
- `supabase`
- `supabase-postgres-best-practices`

### AI agents / SDKs (3)
- `ai-sdk` — Vercel AI SDK
- `langchain-architecture` — LangChain 1.x + LangGraph
- `mcp-builder` — construir MCP servers

### Testing / calidad (4)
- `test-driven-development`
- `python-testing-patterns`
- `systematic-debugging`
- `verification-before-completion`

### Dev process (7)
- `writing-plans`
- `executing-plans`
- `using-git-worktrees`
- `dispatching-parallel-agents`
- `find-skills`
- `skill-evolution`
- `session-memory`

### Diseño / marketing (3)
- `ui-ux-pro-max-skill`
- `seo-audit`
- `copywriting`

### Documentación / arquitectura (2)
- `architecture-decision-records`
- `api-design-principles`

### Cross-cutting (2)
- `typescript-advanced-types`
- `building-native-ui`

## ⚠️ 5 problemáticas

| Skill | Problema |
|---|---|
| `frontend-design` | Duplica las skills de este repo (`taste-skill`, `gpt-tasteskill`, etc.) |
| `create-issue` | Hardcoded a `NVIDIA-NeMo/Megatron-LM` repo |
| `expo-deployment` | Solo aplica si hacés mobile apps con Expo |
| `gsap-frameworks` | Cubre Vue/Svelte (usar `gsap-react` en su lugar) |
| `vercel-react-native-skills` | Solo aplica para React Native |

## ❌ 142 OUT-OF-SCOPE (infra NVIDIA mayormente)

Agrupadas por familia:

| Familia | Cantidad |
|---|---:|
| Megatron-LM/Bridge + `perf-*` training | ~30 |
| NemoClaw (user + maintainer) | 23 |
| NeMo-RL / NeMo-Gym / Evaluator | 14 |
| TensorRT-LLM / AutoDeploy | 13 |
| VSS / DeepStream / video analytics | 12 |
| Maintainer/CI workflows NVIDIA | 10 |
| cuOpt (optimización numérica GPU) | 9 |
| cuTile / kernel writing GPU | 8 |
| Hardware/cluster (SLURM/Brev/GB200) | 8 |
| Otros NVIDIA específicos | ~15 |

Solo instalalas si te ves trabajando con infra NVIDIA (entrenamiento de modelos grandes, inferencia con TensorRT-LLM, kernels CUDA).

## Fuentes de las skills auditadas

Según el `.skill-lock.json` del pool:

- `nvidia/skills` — 143 skills
- `wshobson/agents` — 12 skills
- `obra/superpowers` — 7 skills
- `vercel-labs/agent-skills` — 4 skills
- `expo/skills` — 3 skills
- `anthropics/skills` — 2 skills
- `supabase/agent-skills` — 2 skills
- Otros — varios singletons (vercel/ai, vercel/turborepo, Jakubantalik/transitions.dev, etc.)
