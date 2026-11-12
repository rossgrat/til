#!/usr/bin/env bash
# Auto-generate README.md from TIL directory structure.

set -euo pipefail

TIL_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
README="$TIL_ROOT/README.md"

cat > "$README" <<'EOF'
# Today I Learned

Short notes, examples, and references, organized by topic.
EOF

# Entries by category
for dir in "$TIL_ROOT"/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  [[ "$name" == .* || "$name" == "scripts" ]] && continue
  files=("$dir"*.md)
  # Skip if glob didn't match anything
  [ -e "${files[0]}" ] || continue

  echo "" >> "$README"
  echo "## ${name}" >> "$README"
  echo "" >> "$README"

  for f in "${files[@]}"; do
    # Try to extract the first H1 as the title
    title=$(grep -m1 '^# ' "$f" 2>/dev/null | sed 's/^# //' || true)
    if [ -z "$title" ]; then
      # Fall back to filename with dashes replaced by spaces
      title="$(basename "$f" .md | tr '-' ' ')"
    fi
    relpath="${f#"$TIL_ROOT"/}"
    echo "- [${title}](${relpath})" >> "$README"
  done
done

echo "README.md updated"
