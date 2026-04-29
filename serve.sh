#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

JEKYLL_PID=""

start_jekyll() {
  bundle exec jekyll serve --port 4000 --incremental &
  JEKYLL_PID=$!
}

cleanup() {
  # Second ^C during the 2-second window: exit immediately, no rebuild.
  trap 'echo ""; echo "→ Exiting."; exit 0' INT

  if [ -n "$JEKYLL_PID" ]; then
    kill "$JEKYLL_PID" 2>/dev/null || true
    wait "$JEKYLL_PID" 2>/dev/null || true
    JEKYLL_PID=""
  fi

  echo ""
  echo "→ Server stopped. Press ^C again within 2 s to exit instead."
  sleep 2

  trap cleanup INT
  echo "→ Cleaning _site..."
  rm -rf _site
  echo "→ Rebuilding and restarting..."
  start_jekyll
  wait "$JEKYLL_PID" || true
}

trap cleanup INT

echo "→ Serving at http://localhost:4000 (incremental build, livereload)"
echo "   ^C — clean rebuild + restart  |  ^C^C — exit"
echo ""
start_jekyll
wait "$JEKYLL_PID" || true
