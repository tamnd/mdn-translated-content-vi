#!/bin/zsh

set -euo pipefail

REPO_DIR="/Users/apple/github/tamnd/mdn-translated-content-vi"
STATE_DIR="$REPO_DIR/.codex-automation/web-api"
LOCK_DIR="$STATE_DIR/lock"
LOG_DIR="$STATE_DIR/logs"
PROMPT_FILE="$REPO_DIR/scripts/web-api-cron-prompt.md"
LAST_MESSAGE_FILE="$STATE_DIR/last-message.txt"
RUN_LOG="$LOG_DIR/$(date +%Y%m%d-%H%M%S).log"

mkdir -p "$STATE_DIR" "$LOG_DIR"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') another web-api automation run is already active" >>"$STATE_DIR/runner.log"
  exit 0
fi

cleanup() {
  rmdir "$LOCK_DIR" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

cd "$REPO_DIR"

source_count=$(find files/en-us/web/api -name index.md | wc -l | tr -d ' ')
translated_count=0
if [ -d files/vi/web/api ]; then
  translated_count=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
fi

{
  echo "=== $(date '+%Y-%m-%d %H:%M:%S') start ==="
  echo "source_count=$source_count"
  echo "translated_count_before=$translated_count"
  git status --short --branch
} >>"$RUN_LOG"

codex exec \
  --cd "$REPO_DIR" \
  --dangerously-bypass-approvals-and-sandbox \
  --model gpt-5.4 \
  --output-last-message "$LAST_MESSAGE_FILE" \
  "$(cat "$PROMPT_FILE")" >>"$RUN_LOG" 2>&1

translated_after=0
if [ -d files/vi/web/api ]; then
  translated_after=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
fi

{
  echo "translated_count_after=$translated_after"
  echo "=== $(date '+%Y-%m-%d %H:%M:%S') end ==="
  echo
} >>"$RUN_LOG"
