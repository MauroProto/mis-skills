#!/usr/bin/env bash
# install.sh — Instala las skills del repo en ~/.agents/skills/ via symlinks.
# Después corre el sync para que los 5 agentes (Claude, Codex, Cursor, Continue,
# Antigravity) las vean. Idempotente y no-destructivo.

set -uo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POOL="$HOME/.agents/skills"

echo "════════════════════════════════════════════════════════════"
echo "  mis-skills — instalación"
echo "  Repo:  $REPO_DIR"
echo "  Pool:  $POOL"
echo "════════════════════════════════════════════════════════════"

# Asegurar que el pool existe
mkdir -p "$POOL"

# ─── Fase 1: Symlinkear cada skill del repo al pool ─────────
echo ""
echo "▶ Fase 1: Symlinks del repo al pool"

added=0
already=0
collision=0

# Encontrar todos los directorios que contengan SKILL.md
# Recorre BOTH skills/ (propias) y external/ (de terceros)
while IFS= read -r skill_md; do
  skill_dir=$(dirname "$skill_md")
  name=$(basename "$skill_dir")
  target="$POOL/$name"

  if [[ -L "$target" ]]; then
    current=$(readlink "$target")
    if [[ "$current" == "$skill_dir" ]]; then
      ((already++))
    else
      ((collision++))
    fi
  elif [[ -e "$target" ]]; then
    ((collision++))
  else
    ln -s "$skill_dir" "$target"
    ((added++))
  fi
done < <(find "$REPO_DIR/skills" "$REPO_DIR/external" -name SKILL.md 2>/dev/null)

echo ""
echo "  Resumen Fase 1: agregadas:$added existentes:$already colisiones:$collision"

# ─── Fase 2: Correr el sync general para los 5 agentes ──────
echo ""
echo "▶ Fase 2: Sincronizar carpetas de agentes vía scripts/sync-skills.sh"
if [[ -x "$REPO_DIR/scripts/sync-skills.sh" ]]; then
  "$REPO_DIR/scripts/sync-skills.sh"
else
  echo "  ⊘ scripts/sync-skills.sh no encontrado o no ejecutable — skip"
  echo "    Podés correrlo manualmente: bash $REPO_DIR/scripts/sync-skills.sh"
fi

echo ""
echo "════════════════════════════════════════════════════════════"
echo "  ✔ Instalación completa"
echo ""
echo "  Próximos pasos:"
echo "    • Re-corré install.sh cada vez que actualices el repo"
echo "    • Editá cualquier SKILL.md en $REPO_DIR/skills/ — los cambios"
echo "      se reflejan en todos los agentes automáticamente (symlinks)"
echo "════════════════════════════════════════════════════════════"
