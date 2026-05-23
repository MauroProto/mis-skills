#!/usr/bin/env bash
# Globaliza skills entre 5 agentes SIN mover ni borrar nada.
#
# Modelo:
#   - Skills "agent-specific" (Claude customs, Cursor own, Codex own) se quedan
#     como real dirs en SU agente. Nada se mueve.
#   - ~/.agents/skills/ es el HUB: para cada skill agent-specific, hay un
#     symlink ahí que apunta al real dir en el agente original.
#   - Cada agente recibe symlinks a TODAS las skills del hub
#     (incluidas las que vienen de otros agentes).
#
# Idempotente: re-corré cuando quieras.

set -uo pipefail

POOL="$HOME/.agents/skills"

added_pool=0
skipped_pool=0
collision_pool=0

echo "════════════════════════════════════════════════════════════"
echo "  SYNC SKILLS  (modo no-destructivo)"
echo "════════════════════════════════════════════════════════════"

# ─── Helper: agregar symlink al pool apuntando a un real dir externo ─
# Args: $1=nombre_skill  $2=ruta_relativa_desde_pool_al_real_dir
add_to_pool() {
  local name="$1"
  local relpath="$2"
  local target="$POOL/$name"
  if [[ -L "$target" ]]; then
    local cur
    cur=$(readlink "$target")
    if [[ "$cur" == "$relpath" ]]; then
      ((skipped_pool++))
      return 0
    else
      echo "  ⚠ pool/$name ya es symlink a OTRO destino ($cur) — preservo"
      ((collision_pool++))
      return 0
    fi
  fi
  if [[ -e "$target" ]]; then
    # Ya hay un real dir con ese nombre en el pool — no tocamos
    ((collision_pool++))
    return 0
  fi
  ln -s "$relpath" "$target"
  echo "  ✔ pool/$name → $relpath"
  ((added_pool++))
}

echo ""
echo "▶ Fase 1: Exponer skills agent-specific en el pool (vía symlinks)"

# 1a. Skills custom de Claude (10) — viven en ~/.claude/skills/ como real dirs
echo ""
echo "  ── Claude user customs (~/.claude/skills/) ──"
for s in brutalist-skill frontendwebsiteimageskill gpt-tasteskill images-taste-skill \
         minimalist-skill output-skill redesign-skill soft-skill stitch-skill taste-skill; do
  src="$HOME/.claude/skills/$s"
  if [[ -d "$src" && ! -L "$src" ]]; then
    add_to_pool "$s" "../../.claude/skills/$s"
  fi
done

# 1b. Skills propias de Cursor (14) — viven en ~/.cursor/skills-cursor/
echo ""
echo "  ── Cursor own (~/.cursor/skills-cursor/) ──"
if [[ -d "$HOME/.cursor/skills-cursor" ]]; then
  for d in "$HOME/.cursor/skills-cursor"/*/; do
    [[ -d "$d" ]] || continue
    s=$(basename "$d")
    add_to_pool "$s" "../../.cursor/skills-cursor/$s"
  done
fi

# 1c. Skills propias de Codex (6) — viven en ~/.codex/skills/
echo ""
echo "  ── Codex own (~/.codex/skills/) ──"
if [[ -d "$HOME/.codex/skills" ]]; then
  for d in "$HOME/.codex/skills"/*/; do
    [[ -d "$d" ]] || continue
    s=$(basename "$d")
    [[ "$s" == ".system" ]] && continue
    # Solo agregar si es un real dir (no symlink) — los que ya son symlinks
    # ya apuntan al pool
    if [[ ! -L "$HOME/.codex/skills/$s" ]]; then
      add_to_pool "$s" "../../.codex/skills/$s"
    fi
  done
fi

# 1d. Skills de plugins habilitados de Claude (compat bash 3.2 — sin arrays asociativos)
echo ""
echo "  ── Claude plugins habilitados ──"
PLUGIN_DIRS=(
  "$HOME/.claude/plugins/cache/obsidian-skills/obsidian/1.0.1/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/superpowers/5.1.0/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/frontend-design/e30768372b41/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/claude-md-management/1.0.0/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/vercel/1.0.0/skills"
  "$HOME/.claude/plugins/cache/claude-code-warp/warp/2.0.0/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/code-review/1.0.0/skills"
  "$HOME/.claude/plugins/cache/claude-plugins-official/ralph-loop/1.0.0/skills"
)

for pdir in "${PLUGIN_DIRS[@]}"; do
  if [[ ! -d "$pdir" ]]; then
    continue
  fi
  for d in "$pdir"/*/; do
    [[ -d "$d" ]] || continue
    s=$(basename "$d")
    relpath=$(python3 -c "import os; print(os.path.relpath('$d', '$POOL'))")
    add_to_pool "$s" "$relpath"
  done
done

echo ""
echo "  Pool: agregadas:$added_pool ya-presentes:$skipped_pool colisiones:$collision_pool"

# ─── Fase 2: Sincronizar todas las carpetas de agentes con el pool ──
echo ""
echo "▶ Fase 2: Crear symlinks faltantes en cada agente apuntando al pool"

# (agent_dir, ruta_relativa_desde_agent_dir_al_pool)
AGENTS=(
  "$HOME/.claude/skills|../../.agents/skills"
  "$HOME/.continue/skills|../../.agents/skills"
  "$HOME/.cursor/skills|../../.agents/skills"
  "$HOME/.gemini/antigravity/skills|../../../.agents/skills"
  "$HOME/.codex/skills|../../.agents/skills"
)

# Lista de items en el pool (real dirs + symlinks salientes) — compat bash 3.2
POOL_ITEMS=()
while IFS= read -r line; do
  POOL_ITEMS+=("$line")
done < <(find "$POOL" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) -exec basename {} \; | sort)
echo "  Pool tiene ${#POOL_ITEMS[@]} skills (real dirs + symlinks hacia agentes)"

for entry in "${AGENTS[@]}"; do
  agent_dir="${entry%|*}"
  rel="${entry#*|}"
  if [[ ! -d "$agent_dir" ]]; then
    echo "  ⊘ $agent_dir no existe — skip"
    continue
  fi
  agent_name=$(basename "$(dirname "$agent_dir")")
  created=0
  ok=0
  preserved=0
  for s in "${POOL_ITEMS[@]}"; do
    target="$agent_dir/$s"
    if [[ -L "$target" ]]; then
      ((ok++))
    elif [[ -e "$target" ]]; then
      # Real dir/file con mismo nombre — PRESERVAR (skill propia del agente)
      ((preserved++))
    else
      ln -s "$rel/$s" "$target" && ((created++))
    fi
  done
  printf "  ✔ [%-12s] creados:%-3d existentes:%-3d preservados:%-3d (total ahora: %s)\n" \
    "$agent_name" "$created" "$ok" "$preserved" "$(find "$agent_dir" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | wc -l | tr -d ' ')"
done

# ─── Resumen final ───────────────────────────────────────────
echo ""
echo "════════════════════════════════════════════════════════════"
echo "  RESUMEN FINAL"
echo "════════════════════════════════════════════════════════════"
echo ""
printf "  %-40s %s\n" "Pool ($POOL):" "$(find "$POOL" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | wc -l | tr -d ' ') items"
echo ""
for entry in "${AGENTS[@]}"; do
  agent_dir="${entry%|*}"
  if [[ -d "$agent_dir" ]]; then
    n=$(find "$agent_dir" -mindepth 1 -maxdepth 1 \( -type d -o -type l \) | wc -l | tr -d ' ')
    name=$(basename "$(dirname "$agent_dir")")
    printf "  %-40s %s skills\n" "$agent_dir" "$n"
  fi
done
echo ""
echo "✔ Listo. Re-corré este script cada vez que agregues skills nuevas."
