#!/bin/zsh

set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

REPO_DIR="/Users/apple/github/tamnd/mdn-translated-content-vi"
STATE_DIR="$REPO_DIR/.codex-automation/web-api"
LOCK_DIR="$STATE_DIR/lock"
LOG_DIR="$STATE_DIR/logs"
PROMPT_FILE="$REPO_DIR/scripts/web-api-cron-prompt.md"
LAST_MESSAGE_FILE="$STATE_DIR/last-message.txt"
RUNNER_LOG="$STATE_DIR/runner.log"
PID_FILE="$STATE_DIR/loop.pid"
SLEEP_SECONDS="${WEB_API_LOOP_SLEEP_SECONDS:-60}"

mkdir -p "$STATE_DIR" "$LOG_DIR"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') loop already active" >>"$RUNNER_LOG"
  exit 0
fi

cleanup() {
  rm -f "$PID_FILE"
  rmdir "$LOCK_DIR" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

echo "$$" >"$PID_FILE"

cd "$REPO_DIR"

while true; do
  source_count=$(find files/en-us/web/api -name index.md | wc -l | tr -d ' ')
  translated_count_before=0
  if [ -d files/vi/web/api ]; then
    translated_count_before=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
  fi

  RUN_LOG="$LOG_DIR/$(date +%Y%m%d-%H%M%S).log"

  {
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') start ==="
    echo "source_count=$source_count"
    echo "translated_count_before=$translated_count_before"
    git status --short --branch
  } >>"$RUN_LOG"

  exit_code=0
  if ! codex exec \
    --cd "$REPO_DIR" \
    --dangerously-bypass-approvals-and-sandbox \
    --model gpt-5.4 \
    --output-last-message "$LAST_MESSAGE_FILE" \
    "$(cat "$PROMPT_FILE")" >>"$RUN_LOG" 2>&1; then
    exit_code=$?
  fi

  translated_count_after=0
  if [ -d files/vi/web/api ]; then
    translated_count_after=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
  fi

  {
    echo "exit_code=$exit_code"
    echo "translated_count_after=$translated_count_after"
    echo "=== $(date '+%Y-%m-%d %H:%M:%S') end ==="
    echo
  } >>"$RUN_LOG"

  if [ "$translated_count_after" -ge "$source_count" ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') web api translation complete" >>"$RUNNER_LOG"
    break
  fi

  sleep "$SLEEP_SECONDS"
done
