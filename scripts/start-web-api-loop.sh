#!/bin/zsh

set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

REPO_DIR="/Users/apple/github/tamnd/mdn-translated-content-vi"
STATE_DIR="$REPO_DIR/.codex-automation/web-api"
PID_FILE="$STATE_DIR/loop.pid"
RUNNER_LOG="$STATE_DIR/runner.log"
LOOP_SCRIPT="$REPO_DIR/scripts/run-web-api-loop.sh"

mkdir -p "$STATE_DIR"

if [ -f "$PID_FILE" ]; then
  pid=$(cat "$PID_FILE")
  if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') loop already running pid=$pid" >>"$RUNNER_LOG"
    exit 0
  fi
fi

nohup "$LOOP_SCRIPT" >>"$RUNNER_LOG" 2>&1 </dev/null &
echo "$(date '+%Y-%m-%d %H:%M:%S') loop started pid=$!" >>"$RUNNER_LOG"
