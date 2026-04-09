#!/bin/zsh

set -euo pipefail

REPO_DIR="/Users/apple/github/tamnd/mdn-translated-content-vi"
STATE_DIR="$REPO_DIR/.codex-automation/web-api-supervisor"
PID_FILE="$STATE_DIR/supervisor.pid"

if [ ! -f "$PID_FILE" ]; then
  echo "no supervisor pid file"
  exit 0
fi

pid=$(cat "$PID_FILE")
if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
  kill "$pid"
  echo "stopped pid=$pid"
else
  echo "supervisor not running"
fi
