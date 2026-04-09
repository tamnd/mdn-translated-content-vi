# Web API Translation Worklog

Source tree: `files/en-us/web/api/`

Target tree: `files/vi/web/api/`

Total source pages reviewed on 2026-04-09: `7,944`

Reference checklist: [api.md](./api.md)

## Review Summary

- `translate/web/api.md` defines Web API as the largest remaining section.
- The first five blocks marked high priority are:
  - DOM Core
  - Fetch / XHR / Networking
  - Storage
  - HTML Elements (DOM interfaces)
  - Canvas / 2D Graphics
- The source tree currently contains `7,944` English `index.md` pages under `files/en-us/web/api/`.
- The Vietnamese target tree for Web API did not exist at the start of this batch.

## Batch 1

Initial milestone: translate 20 smaller pages to establish conventions, page-by-page commits, and PR progress reporting.

Planned pages:

1. `Web/API/HTMLCollection`
2. `Web/API/HTMLCollection/length`
3. `Web/API/HTMLCollection/item`
4. `Web/API/HTMLCollection/namedItem`
5. `Web/API/NodeList`
6. `Web/API/NodeList/length`
7. `Web/API/NodeList/item`
8. `Web/API/NodeList/entries`
9. `Web/API/NodeList/keys`
10. `Web/API/NodeList/values`
11. `Web/API/NodeList/forEach`
12. `Web/API/Path2D`
13. `Web/API/Path2D/Path2D`
14. `Web/API/Path2D/addPath`
15. `Web/API/CanvasGradient`
16. `Web/API/CanvasGradient/addColorStop`
17. `Web/API/CanvasPattern`
18. `Web/API/CanvasPattern/setTransform`
19. `Web/API/Fetch_API`
20. `Web/API/Web_Storage_API`

## Commit Rule

- One translated page per commit.
- Push each commit to the same PR branch.
- After about 20 translated pages, add a human-written PR comment summarizing completed work.
- Repeat until the Web API section is complete, then add a final full summary comment.

## Batch 2

Continue with a compact Abort API batch to keep momentum high with small, reviewable DOM pages.

Planned pages:

1. `Web/API/AbortController`
2. `Web/API/AbortController/abort`
3. `Web/API/AbortController/AbortController`
4. `Web/API/AbortController/signal`
5. `Web/API/AbortSignal`
6. `Web/API/AbortSignal/aborted`
7. `Web/API/AbortSignal/reason`

## Batch 3

Expand the `AbortSignal` coverage with the interface's linked event and methods.

Planned pages:

1. `Web/API/AbortSignal/abort_event`
2. `Web/API/AbortSignal/abort_static`
3. `Web/API/AbortSignal/any_static`
4. `Web/API/AbortSignal/throwIfAborted`
5. `Web/API/AbortSignal/timeout_static`

## Batch 4

Use another 8-page small-page batch to reach the 40-page milestone with compact DOM and overview content.

Planned pages:

1. `Web/API`
2. `Web/API/HTMLDocument`
3. `Web/API/DOMStringMap`
4. `Web/API/DOMStringList`
5. `Web/API/DOMStringList/contains`
6. `Web/API/DOMStringList/item`
7. `Web/API/DOMStringList/length`
8. `Web/API/Screen_Orientation_API`

## Batch 5

Continue with a compact `AbstractRange` DOM batch that adds one interface page, its five read-only properties, and the required local diagrams.

Planned pages:

1. `Web/API/AbstractRange`
2. `Web/API/AbstractRange/collapsed`
3. `Web/API/AbstractRange/endContainer`
4. `Web/API/AbstractRange/endOffset`
5. `Web/API/AbstractRange/startContainer`
6. `Web/API/AbstractRange/startOffset`

## Batch 6

Continue with a compact `Accelerometer` sensor batch that keeps the interface and its coordinate properties together for consistent terminology.

Planned pages:

1. `Web/API/Accelerometer`
2. `Web/API/Accelerometer/Accelerometer`
3. `Web/API/Accelerometer/x`
4. `Web/API/Accelerometer/y`
5. `Web/API/Accelerometer/z`

## Batch 7

Continue with the `AbsoluteOrientationSensor` pair to cover the interface and constructor together as a compact sensor batch.

Planned pages:

1. `Web/API/AbsoluteOrientationSensor`
2. `Web/API/AbsoluteOrientationSensor/AbsoluteOrientationSensor`
