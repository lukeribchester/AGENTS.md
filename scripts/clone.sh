#!/usr/bin/env bash
set -euo pipefail

repo_url="git@github.com:lukeribchester/AGENTS.md.git"
git_dir="$HOME/AGENTS.md"
default_work_tree="$HOME/.codex"

printf "Work tree [%s]: " "$default_work_tree" > /dev/tty
IFS= read -r work_tree < /dev/tty
work_tree="${work_tree:-$default_work_tree}"

case "$work_tree" in
  "~") work_tree="$HOME" ;;
  "~/"*) work_tree="$HOME/${work_tree#~/}" ;;
esac

# Refuse to overwrite existing files or repositories.
if [ -e "$work_tree/AGENTS.md" ]; then
  echo "Refusing to overwrite existing file: $work_tree/AGENTS.md"
  exit 1
fi

if [ -e "$git_dir" ]; then
  echo "Refusing to overwrite existing Git directory: $git_dir"
  exit 1
fi

mkdir -p "$work_tree"

git clone --bare "$repo_url" "$git_dir"

git_cmd=(git --git-dir="$git_dir" --work-tree="$work_tree")

# Restrict checkout to AGENTS.md.
"${git_cmd[@]}" config core.sparseCheckout true
"${git_cmd[@]}" config --local status.showUntrackedFiles no
"${git_cmd[@]}" config --local pull.rebase true

cat > "$git_dir/info/sparse-checkout" <<'EOF'
/AGENTS.md
EOF

"${git_cmd[@]}" checkout

echo "Installed: $work_tree/AGENTS.md"
