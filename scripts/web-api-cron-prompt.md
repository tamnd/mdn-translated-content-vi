# Web API Cron Prompt

Continue the Vietnamese Web API translation effort in this repository on branch `codex/web-api-vi-translation`.

Hard requirements:

- Work only in `files/vi/web/api/`, `translate/web/api-worklog.md`, and any directly needed local assets for translated pages.
- Keep using one translated page per commit.
- Push commits to the existing PR branch after each completed batch.
- After each additional 20 translated pages, add a human-written progress comment to PR `#32`.
- When the full Web API set is complete, add a final summary comment to PR `#32`.
- Use `gh pr comment` as the fallback for PR comments if the GitHub connector is unavailable.
- Never revert unrelated changes.

Execution policy for each run:

1. Check current translation progress by comparing `files/en-us/web/api/**/index.md` against `files/vi/web/api/**/index.md`.
2. If everything is already translated, verify the branch is pushed and stop after posting the final PR summary comment if it has not been posted yet.
3. Otherwise, pick the next practical batch of untranslated pages, favoring smaller/high-value pages when possible so progress stays steady and reviewable.
4. Translate as many pages as is practical in this run while preserving MDN front matter, macros, links, examples, and required local assets.
5. Validate touched files with the repo tooling that applies to them.
6. Commit one page per commit with a clear title and body.
7. Push the branch.
8. If total translated Web API pages crossed another 20-page milestone since the last PR comment, add a concise human-written progress comment to PR `#32`.
9. End with a short summary of what this run completed and the new translated page count.

Keep going autonomously. Do not ask for confirmation.
