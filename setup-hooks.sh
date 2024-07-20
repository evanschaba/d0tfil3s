#!/bin/sh

HOOKS_DIR="$(pwd)/.git/hooks"
HOOK_FILE="$HOOKS_DIR/post-checkout"

cat << 'EOF' > "$HOOK_FILE"
#!/bin/sh

THEMES_DIR="$(pwd)/.config/alacritty/themes/themes"
REPO_URL="https://github.com/alacritty/alacritty-theme.git"

if [ ! -d "$THEMES_DIR" ]; then
  mkdir -p "$THEMES_DIR"
  git clone "$REPO_URL" "$THEMES_DIR"
fi
EOF

chmod +x "$HOOK_FILE"
echo "Git hook has been set up."

