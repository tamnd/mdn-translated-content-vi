#!/bin/zsh

set -euo pipefail

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

REPO_DIR="/Users/apple/github/tamnd/mdn-translated-content-vi"
BASE_BRANCH="codex/web-api-vi-translation"
PR_NUMBER="32"
MAX_WORKERS="${WEB_API_MAX_WORKERS:-4}"
POLL_SECONDS="${WEB_API_SUPERVISOR_POLL_SECONDS:-20}"

STATE_DIR="$REPO_DIR/.codex-automation/web-api-supervisor"
WORKTREE_DIR="$STATE_DIR/worktrees"
LOG_DIR="$STATE_DIR/logs"
LOCK_DIR="$STATE_DIR/lock"
PID_FILE="$STATE_DIR/supervisor.pid"
RUNNER_LOG="$STATE_DIR/runner.log"
LAST_MILESTONE_FILE="$STATE_DIR/last-milestone.txt"

mkdir -p "$STATE_DIR" "$WORKTREE_DIR" "$LOG_DIR"

if ! mkdir "$LOCK_DIR" 2>/dev/null; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') supervisor already active" >>"$RUNNER_LOG"
  exit 0
fi

cleanup() {
  rm -f "$PID_FILE"
  rmdir "$LOCK_DIR" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

echo "$$" >"$PID_FILE"

cd "$REPO_DIR"

current_count=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
if [ ! -f "$LAST_MILESTONE_FILE" ]; then
  echo "$current_count" >"$LAST_MILESTONE_FILE"
fi

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $*" >>"$RUNNER_LOG"
}

list_untranslated_pages() {
  comm -23 \
    <(find files/en-us/web/api -name index.md | sed 's#^files/en-us/##; s#/index.md$##' | sort) \
    <(find files/vi/web/api -name index.md | sed 's#^files/vi/##; s#/index.md$##' | sort)
}

list_in_progress_families() {
  for meta in "$STATE_DIR"/worker-*.meta; do
    [ -f "$meta" ] || continue
    awk -F= '$1=="family"{print $2}' "$meta"
  done
}

next_family() {
  local in_progress
  in_progress="$(list_in_progress_families | tr '\n' ' ')"

  list_untranslated_pages | awk -F/ '{print $1"/"$2"/"$3}' | awk '!seen[$0]++' | while read -r family; do
    if [[ " $in_progress " == *" $family "* ]]; then
      continue
    fi
    echo "$family"
    return 0
  done
  return 1
}

family_pages() {
  local family="$1"
  list_untranslated_pages | awk -v family="$family" 'index($0, family"/")==1 || $0 == family'
}

write_meta() {
  local slot="$1"
  local file="$STATE_DIR/worker-$slot.meta"
  shift
  : >"$file"
  while [ "$#" -gt 0 ]; do
    printf '%s\n' "$1" >>"$file"
    shift
  done
}

read_meta_value() {
  local file="$1"
  local key="$2"
  awk -F= -v key="$key" '$1==key{print substr($0, index($0, "=")+1)}' "$file"
}

cleanup_worker() {
  local slot="$1"
  local meta="$STATE_DIR/worker-$slot.meta"
  [ -f "$meta" ] || return 0

  local branch worktree
  branch="$(read_meta_value "$meta" branch)"
  worktree="$(read_meta_value "$meta" worktree)"

  if [ -n "$worktree" ] && [ -d "$worktree" ]; then
    git -C "$REPO_DIR" worktree remove --force "$worktree" >/dev/null 2>&1 || true
  fi
  if [ -n "$branch" ]; then
    git -C "$REPO_DIR" branch -D "$branch" >/dev/null 2>&1 || true
  fi

  rm -f "$meta" "$STATE_DIR/worker-$slot.exit"
}

post_milestone_comment_if_needed() {
  local translated_count next_milestone last_milestone
  translated_count=$(find files/vi/web/api -name index.md | wc -l | tr -d ' ')
  last_milestone=$(cat "$LAST_MILESTONE_FILE")
  next_milestone=$(( ((last_milestone / 40) + 1) * 40 ))

  if [ "$translated_count" -lt "$next_milestone" ]; then
    return 0
  fi

  gh pr comment "$PR_NUMBER" --body $'Web API translation milestone update.\n\nThe Vietnamese Web API set has now reached '"$translated_count"$' translated pages.\n\nThis latest stretch continued in larger disjoint batches so related interface families can be reviewed together while keeping validation targeted and the branch moving steadily.\n\nI am continuing directly with the next untranslated page families in parallel.' >/dev/null
  echo "$translated_count" >"$LAST_MILESTONE_FILE"
  log "posted PR milestone comment at count=$translated_count"
}

merge_worker_result() {
  local slot="$1"
  local meta="$STATE_DIR/worker-$slot.meta"
  local exit_file="$STATE_DIR/worker-$slot.exit"
  [ -f "$meta" ] || return 0
  [ -f "$exit_file" ] || return 0

  local branch family base_sha exit_code
  branch="$(read_meta_value "$meta" branch)"
  family="$(read_meta_value "$meta" family)"
  base_sha="$(read_meta_value "$meta" base_sha)"
  exit_code="$(cat "$exit_file")"

  if [ "$exit_code" != "0" ]; then
    log "worker=$slot family=$family failed exit_code=$exit_code"
    cleanup_worker "$slot"
    return 0
  fi

  local commits
  commits="$(git -C "$REPO_DIR" rev-list --reverse "$base_sha..$branch")"
  if [ -z "$commits" ]; then
    log "worker=$slot family=$family finished with no commits"
    cleanup_worker "$slot"
    return 0
  fi

  local commit
  for commit in $commits; do
    git -C "$REPO_DIR" cherry-pick "$commit" >/dev/null
  done

  git -C "$REPO_DIR" push origin "$BASE_BRANCH" >/dev/null
  log "worker=$slot family=$family merged commits=$(echo "$commits" | tr '\n' ' ')"
  post_milestone_comment_if_needed
  cleanup_worker "$slot"
}

launch_worker() {
  local slot="$1"
  local family="$2"
  local base_sha branch worktree prompt_file log_file exit_file pages_file pages

  base_sha="$(git -C "$REPO_DIR" rev-parse "$BASE_BRANCH")"
  branch="web-api-auto-$slot-$(date +%s)"
  worktree="$WORKTREE_DIR/worker-$slot"
  prompt_file="$STATE_DIR/worker-$slot-prompt.md"
  log_file="$LOG_DIR/worker-$slot-$(date +%Y%m%d-%H%M%S).log"
  exit_file="$STATE_DIR/worker-$slot.exit"
  pages_file="$STATE_DIR/worker-$slot-pages.txt"

  rm -rf "$worktree"
  git -C "$REPO_DIR" worktree add -B "$branch" "$worktree" "$BASE_BRANCH" >/dev/null

  family_pages "$family" >"$pages_file"
  pages="$(sed 's/^/- `&`/' "$pages_file")"

  cat >"$prompt_file" <<EOF
# Web API Batch Prompt

Work only in this git worktree on branch \`$branch\`.

Hard requirements:

- Translate only the exact pages listed below under \`files/vi/web/api/\`.
- Do not edit unrelated files.
- Do not push.
- Make one batch commit for this family.
- Preserve MDN front matter, macros, links, examples, tables, and local assets when needed.
- Run targeted validation on touched files.

Assigned family: \`$family\`

Assigned pages:
$pages

Execution policy:

1. Translate all assigned pages from \`files/en-us/web/api/\` into Vietnamese.
2. Do not touch \`translate/web/api-worklog.md\`; the supervisor handles progress tracking centrally to avoid merge conflicts.
3. Validate the touched page files with targeted repo tooling.
4. Commit once with a clear title and body listing the translated pages.
5. End with a concise summary including the commit SHA.
EOF

  write_meta "$slot" \
    "slot=$slot" \
    "family=$family" \
    "branch=$branch" \
    "worktree=$worktree" \
    "base_sha=$base_sha" \
    "prompt_file=$prompt_file" \
    "log_file=$log_file"

  (
    cd "$worktree"
    codex exec \
      --cd "$worktree" \
      --dangerously-bypass-approvals-and-sandbox \
      --model gpt-5.4 \
      --output-last-message "$STATE_DIR/worker-$slot-last-message.txt" \
      "$(cat "$prompt_file")" >>"$log_file" 2>&1
    echo $? >"$exit_file"
  ) &

  log "worker=$slot family=$family started branch=$branch"
}

all_workers_idle() {
  local slot
  for slot in $(seq 1 "$MAX_WORKERS"); do
    if [ -f "$STATE_DIR/worker-$slot.meta" ]; then
      return 1
    fi
  done
  return 0
}

log "supervisor started base_branch=$BASE_BRANCH max_workers=$MAX_WORKERS"

while true; do
  git -C "$REPO_DIR" fetch origin "$BASE_BRANCH" >/dev/null 2>&1 || true

  local_slot=""
  for local_slot in $(seq 1 "$MAX_WORKERS"); do
    merge_worker_result "$local_slot"
  done

  if ! list_untranslated_pages | grep -q .; then
    if all_workers_idle; then
      log "all web api pages translated"
      break
    fi
  fi

  for local_slot in $(seq 1 "$MAX_WORKERS"); do
    if [ -f "$STATE_DIR/worker-$local_slot.meta" ]; then
      continue
    fi

    family="$(next_family || true)"
    if [ -z "${family:-}" ]; then
      break
    fi

    launch_worker "$local_slot" "$family"
    sleep 2
  done

  sleep "$POLL_SECONDS"
done
