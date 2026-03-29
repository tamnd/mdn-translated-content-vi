# MDN Web Docs - Vietnamese Translation Checklist

This directory tracks the progress of translating MDN Web Docs into Vietnamese (vi).

All source content lives in `files/en-us/`. Translated content goes into `files/vi/`.
Each `files/vi/**/.gitkeep` is a placeholder -- replace it with a real `index.md` when the page is translated.

## Upstream source

| Field | Value |
|---|---|
| Original repo | https://github.com/mdn/content |
| Fork | https://github.com/tamnd/mdn-content |
| Commit imported | `8ccdf412fafde9ee333233cc4549ab4980291ee7` |
| Commit date | 2026-03-29 21:47:06 +0530 |
| Commit message | docs: remove incorrect null remark for CanvasRenderingContext2D.canvas (#43614) |

When upstream has moved ahead and you want to pull in new English pages, rebase or merge from `tamnd/mdn-content` starting from this commit.
To see what changed since this snapshot: `git log 8ccdf412fa..HEAD` in the `tamnd/mdn-content` clone.

## Overall progress

| Section | Total pages | Translated | Status |
|---|---|---|---|
| [Web platform](./web/README.md) | 11,993 | 0 | not started |
| [Glossary](./glossary.md) | 624 | 0 | not started |
| [Learn web development](./learn.md) | 362 | 0 | not started |
| [WebAssembly](./webassembly.md) | 162 | 0 | not started |
| [Mozilla](./mozilla.md) | 952 | 0 | not started |
| [Games](./games.md) | 66 | 0 | not started |
| [MDN meta](./mdn.md) | 76 | 0 | not started |
| [Related](./related.md) | 10 | 0 | not started |
| **Total** | **14,245** | **0** | not started |

## How to contribute

1. Pick a page from one of the topic files below.
2. Copy the English source from `files/en-us/<path>/index.md`.
3. Translate and save to `files/vi/<path>/index.md` (replace the `.gitkeep`).
4. Open a pull request against `main`.

## Priority order

Start with pages that are most visited and most useful for Vietnamese learners:

1. **Learn web development** -- beginner-friendly, high impact
2. **Glossary** -- short pages, good for first-time contributors
3. **Web / HTML** -- foundational reference
4. **Web / CSS** -- foundational reference
5. **Web / JavaScript** -- most searched language reference
6. **Web / HTTP** -- useful for backend developers
7. **Web / Accessibility** -- growing demand
8. **Web / API** -- large section, do incrementally
9. Everything else

## Topic files

- [web/](./web/README.md) -- Web platform reference (HTML, CSS, JS, APIs, ...)
- [glossary.md](./glossary.md) -- MDN Glossary terms
- [learn.md](./learn.md) -- Learn web development guides
- [webassembly.md](./webassembly.md) -- WebAssembly reference
- [mozilla.md](./mozilla.md) -- Mozilla-specific docs (Firefox releases, etc.)
- [games.md](./games.md) -- Game development guides
- [mdn.md](./mdn.md) -- MDN meta pages
- [related.md](./related.md) -- Related technologies
