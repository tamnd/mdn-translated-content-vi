# Web API Cron Prompt

Continue the Vietnamese Web API translation effort in this repository on branch `codex/web-api-vi-translation`.

Hard requirements:

- Work only in `files/vi/web/api/`, `translate/web/api-worklog.md`, and any directly needed local assets for translated pages.
- Maintain translation quality: preserve MDN front matter, macros, links, examples, tables, and required local assets.
- Optimize for throughput by translating related pages in batches of about 8-20 pages when practical.
- Prefer one commit per related batch, not one commit per page.
- Push commits to the existing PR branch after each completed batch.
- After each additional 40 translated pages, add a human-written progress comment to PR `#32`.
- When the full Web API set is complete, add a final summary comment to PR `#32`.
- Use `gh pr comment` as the fallback for PR comments if the GitHub connector is unavailable.
- Never revert unrelated changes.
- Favor parallel work when available, but keep write ownership disjoint so translated pages do not conflict.

Execution policy for each run:

1. Check current translation progress by comparing `files/en-us/web/api/**/index.md` against `files/vi/web/api/**/index.md`.
2. If everything is already translated, verify the branch is pushed and stop after posting the final PR summary comment if it has not been posted yet.
3. Otherwise, pick the next practical related batch of untranslated pages, favoring compact page families that can be translated consistently and quickly.
4. If parallel sub-agents are available, split the batch into non-overlapping page groups and work them concurrently. Do not assign overlapping paths to different workers.
5. Translate as many pages as is practical in this run while preserving MDN structure and terminology consistency.
6. Validate touched files with the repo tooling that applies to them, preferably once per batch.
7. Commit each related batch with a clear title and body that lists the pages included.
8. Push the branch.
9. If total translated Web API pages crossed another 40-page milestone since the last PR comment, add a concise human-written progress comment to PR `#32`.
10. End with a short summary of what this run completed and the new translated page count.

Keep going autonomously. Do not ask for confirmation.
