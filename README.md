# mis-skills

> **10 agent skills** para diseño frontend de alta gama, dirección de imágenes con AI y disciplina de output.
> Compatibles con **Claude Code · OpenAI Codex · Cursor · Continue · Gemini Antigravity**.

```
mis-skills/
├── skills/
│   ├── design-styles/          6 skills — UI taste enforcers
│   │   ├── taste-skill/
│   │   ├── brutalist-skill/
│   │   ├── minimalist-skill/
│   │   ├── soft-skill/
│   │   ├── gpt-tasteskill/
│   │   └── redesign-skill/
│   ├── design-systems/         1 skill — Stitch DESIGN.md generator
│   │   └── stitch-skill/
│   ├── image-direction/        2 skills — AI image art direction
│   │   ├── images-taste-skill/
│   │   └── frontendwebsiteimageskill/
│   └── meta/                   1 skill — LLM output control
│       └── output-skill/
├── scripts/sync-skills.sh      cross-agent symlink syncer
├── install.sh                  one-line installer
└── docs/ECOSYSTEM-AUDIT.md     curaduría de skills del ecosistema
```

## ¿Qué es una agent skill?

Un `SKILL.md` con frontmatter YAML. El agente lo carga **automáticamente** cuando el contexto coincide con la `description`. Funcionan como expertise modular que se activa on-demand sin que tengas que escribir prompts largos cada vez.

Este repo tiene 10 skills afinadas para:
- Forzar a los LLMs a producir UI de calidad profesional
- Romper sesgos por defecto (headings de 6 líneas, grids con huecos, gradientes genéricos cyan-purple)
- Entregar código completo sin truncar con `// ... rest of code`

## Inventario detallado

### 🎨 Design styles (`skills/design-styles/`)
| Skill | Función |
|---|---|
| **taste-skill** | UI/UX engineer de referencia. Variancia configurable, motion intensity, hardware-acceleration |
| **soft-skill** | Agency-tier polish. Cinematic spatial rhythm, haptic depth, fluid motion |
| **minimalist-skill** | Editorial / document-style. Warm monochrome, bento flat, sin gradientes |
| **brutalist-skill** | Swiss typographic + military terminal. Halftones, CRT scanlines, high data density |
| **gpt-tasteskill** | Advanced GSAP motion engineer. AIDA structure, scrubbing pinning, randomización Python |
| **redesign-skill** | Audita y actualiza sitios existentes. Detecta patrones genéricos de AI y los reemplaza |

### 🖼 Image direction (`skills/image-direction/`)
| Skill | Función |
|---|---|
| **images-taste-skill** | Genera referencias visuales premium, las analiza, luego implementa el frontend matching |
| **frontendwebsiteimageskill** | Art director para hero sections y landing pages — anti-slop visual |

### 🏗 Design systems (`skills/design-systems/`)
| Skill | Función |
|---|---|
| **stitch-skill** | Genera `DESIGN.md` semánticos para Google Stitch. Incluye plantilla en el directorio |

### ⚙️ Meta (`skills/meta/`)
| Skill | Función |
|---|---|
| **output-skill** | Bloquea truncation y placeholders. Fuerza output exhaustivo y completo |

## Instalación

### Opción 1 — Una línea (recomendado)

```bash
git clone https://github.com/MauroProto/mis-skills.git ~/mis-skills && ~/mis-skills/install.sh
```

Esto:
1. Crea symlinks desde `~/.agents/skills/` apuntando a cada skill del repo
2. Sincroniza los 5 agentes (Claude Code, Codex, Cursor, Continue, Antigravity)
3. Te deja el repo como source-of-truth: editás acá, todos los agentes lo ven

### Opción 2 — Manual

```bash
git clone https://github.com/MauroProto/mis-skills.git
cd mis-skills

# Para cada skill que quieras instalar:
ln -s "$(pwd)/skills/design-styles/taste-skill" ~/.agents/skills/taste-skill

# Después, para que aparezca en todos los agentes:
./scripts/sync-skills.sh
```

## Script de sync (`scripts/sync-skills.sh`)

El script central que mantiene 5 agentes (Claude Code, Continue, Cursor, Gemini Antigravity, OpenAI Codex) viendo las mismas skills vía `~/.agents/skills/` como hub. Es **idempotente** y **no-destructivo** (solo crea symlinks faltantes, no borra nada).

Re-corrélo cada vez que agregues una skill nueva al repo o instales un plugin nuevo.

```bash
~/mis-skills/scripts/sync-skills.sh
```

## Arquitectura

```
mis-skills/
├── skills/
│   ├── design-styles/        ← UI taste enforcers
│   ├── image-direction/      ← AI image art direction
│   ├── design-systems/       ← DESIGN.md generators
│   └── meta/                 ← LLM behavior overrides
├── scripts/
│   └── sync-skills.sh        ← cross-agent symlink syncer
└── docs/
    └── ECOSYSTEM-AUDIT.md    ← qué skills del ecosistema vale la pena instalar
```

## Filosofía

Estas skills nacieron de la frustración con los outputs por defecto de los LLMs:

- **Heading de 6 líneas en containers angostos** → forzar `max-width` editorial
- **Bento grids con huecos** → math estricto de spans
- **Gradientes genéricos cyan-purple** → paletas calibradas
- **Output truncado con `// ... rest of code`** → ban explícito
- **GSAP ScrollTrigger sin pinning** → reglas obligatorias

Cada skill ataca un conjunto específico de sesgos. Combinarlas según el caso.

## Compatibilidad

| Agente | Soportado | Cómo |
|---|---|---|
| Claude Code | ✅ | Symlink → `~/.claude/skills/` o `~/.agents/skills/` |
| OpenAI Codex | ✅ | Symlink → `~/.codex/skills/` |
| Cursor | ✅ | Symlink → `~/.cursor/skills/` |
| Continue.dev | ✅ | Symlink → `~/.continue/skills/` |
| Gemini Antigravity | ✅ | Symlink → `~/.gemini/antigravity/skills/` |
| GitHub Copilot / Windsurf | ⚠️ | Leen `~/.agents/skills/` como fallback |

Todos los agentes leen el formato estándar `SKILL.md` con frontmatter YAML.

## Contribuir

PRs bienvenidos para mejorar las skills existentes o agregar nuevas. Guidelines:

- Cada skill en su propio directorio bajo la categoría correspondiente
- Debe tener `SKILL.md` con frontmatter `name:` y `description:`
- `description` debe ser específico — el agente decide cargar la skill por matching de description, no por nombre
- Bajo 30K de contenido por skill (el agente carga el archivo entero)

## Licencia

MIT — ver [LICENSE](LICENSE).
