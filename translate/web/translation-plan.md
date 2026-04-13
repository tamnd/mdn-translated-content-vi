# Web API Translation Master Plan

## Overview

- **Total Pages**: 7,944 Web API pages
- **Source**: `files/en-us/web/api/`
- **Target**: `files/vi/web/api/`
- **PR**: https://github.com/tamnd/mdn-translated-content-vi/pull/32
- **Branch**: `codex/web-api-vi-translation`

## Current Status

- **Already Translated**: 1,067 pages (as of current check)
- **Remaining**: 6,877 pages
- **Completion**: ~13.4%
- **Completed Families**: Node, EventTarget, Event, DocumentFragment, NodeList, HTMLCollection, Path2D, CanvasGradient, CanvasPattern, ShadowRoot, MutationObserver, History API, and various Audio/Abort/Sensor batches
- **Progress**: Steady advancement through multiple API families

## Translation Strategy

### Batch Size

- **8-20 pages per batch** (related API families grouped together)
- **One commit per batch** (clear commit messages listing pages)
- **Push after each batch** to PR branch
- **PR comment every 40 pages** with progress update

### Quality Standards

1. Preserve MDN front matter (title, slug, page-type, sidebar)
2. Keep macros intact: `{{DOMxRef}}`, `{{HTMLElement}}`, etc.
3. Translate content only, keep code examples verbatim
4. Maintain links, tables, and structure

5. Use consistent terminology from `translate/vi-terms.md`
6. Run linting: `npm run lint:md` and `npm run fix:md`

### Workflow Per Batch

1. Pick next batch from checklist (`translate/web/api.md`)
2. Read English source files
3. Translate to Vietnamese maintaining structure
4. Commit with clear message
5. Push to branch
6. Update worklog (`translate/web/api-worklog.md`)
7. Check off completed items in checklist

8. Every 40 pages: add PR comment

## Phase Breakdown

### Phase 1: DOM Core (Priority: CRITICAL)

**Pages**: ~400 | **Batches**: ~25

#### Batch 1.1: Document Interface (147 pages)

- `api/document` (main page)
- Document properties, methods, events
- Includes: body, head, title, images, links, forms, etc.

#### Batch 1.2: Element Interface (215 pages)

- `api/element` (main page)
- Element methods: querySelector, querySelectorAll, getElementsBy\*, etc.
- Attributes, properties, dataset
- DOM manipulation methods

#### Batch 1.3: HTMLElement Interface (57 pages)

- `api/htmlelement` (main page)
- Common properties: innerHTML, outerHTML, className, style, etc.
- Event handlers: onclick, onmouseover, etc.

- Accessibility properties

#### Batch 1.4: Window Interface (158 pages)

- `api/window` (main page)
- Window methods: open, close, alert, confirm, prompt, etc.
- Window properties: document, location, navigator, screen, etc.
- Events: load, resize, scroll, etc.

### Phase 2: Fetch/XHR/Networking (Priority: HIGH)

**Pages**: ~150 | **Batches**: ~10

#### Batch 2.1: Fetch API (50 pages)

- Request, Response, Headers interfaces
- Fetch method variations
- Body mixin methods

#### Batch 2.2: XMLHttpRequest (30 pages)

- XMLHttpRequest interface and methods

- XMLHttpRequestEventTarget
- Events and properties

#### Batch 2.3: WebSocket & Related (70 pages)

- WebSocket, WebSocketStream
- WebTransport
- EventSource
- BroadcastChannel

### Phase 3: Storage APIs (Priority: HIGH)

**Pages**: ~200 | **Batches**: ~15

#### Batch 3.1: Web Storage API (10 pages)

- Storage interface methods

- StorageEvent

#### Batch 3.2: IndexedDB API (90 pages)

- IDBDatabase, IDBObjectStore, IDBTransaction
- IDBIndex, IDBKeyRange, IDBCursor, IDBRequest

- IDBFactory

#### Batch 3.3: Cache API (14 pages)

- CacheStorage, Cache interfaces

#### Batch 3.4: File System API (20 pages)

- FileSystemHandle, FileSystemFileHandle, FileSystemDirectoryHandle

#### Batch 3.5: StorageManager (5 pages)

### Phase 4: HTML Element Interfaces (Priority: HIGH)

**Pages**: ~600 | **Batches**: ~30

#### Batch 4.1: HTMLInputElement (65 pages)

- All input types, properties, methods, events

#### Batch 4.2: HTMLMediaElement (72 pages)

- Media playback, tracks, controls
- Video-specific properties

#### Batch 4.3: HTMLFormElement (22 pages)

- Form methods, elements, validation

#### Batch 4.4: HTMLCanvasElement (14 pages)

- Canvas methods and properties

#### Batch 4.5: HTMLImageElement (29 pages)

- Image loading, decoding, sizes

#### Batch 4.6-4.30: Other HTML\* Elements (~398 pages)

- HTMLVideoElement, HTMLSelectElement, HTMLTextAreaElement

- HTMLAnchorElement, HTMLScriptElement, HTMLLinkElement
- HTMLIFrameElement, HTMLTableElement, HTMLButtonElement
- And all remaining HTML element interfaces

### Phase 5: Canvas/2D Graphics (Priority: HIGH)

**Pages**: ~100 | **Batches**: ~8

#### Batch 5.1: Canvas API (15 pages)

- Main canvas interface

#### Batch 5.2: CanvasRenderingContext2D (74 pages)

- Drawing methods, state, transformations
- Text, images, compositing, filters

#### Batch 5.3: ImageData, Path2D (10 pages)

- Already partially done

#### Batch 5.4: OffscreenCanvas (9 pages)

### Phase 6: Workers & Scheduling

**Pages**: ~150 | **Batches**: ~10

#### Batch 6.1: Web Workers API (5 pages)

- Worker interface

#### Batch 6.2: WorkerGlobalScope (34 pages)

- Worker location, navigator, console

#### Batch 6.3: Service Worker API (70 pages)

- ServiceWorker, ServiceWorkerContainer
- ServiceWorkerRegistration, ServiceWorkerGlobalScope

#### Batch 6.4: SharedWorker, DedicatedWorker (13 pages)

#### Batch 6.5: Scheduler API (4 pages)

### Phase 7: Stream APIs

**Pages**: ~50 | **Batches**: ~5

#### Batch 7.1: Streams API Overview (5 pages)

#### Batch 7.2: ReadableStream (9 pages)

- ReadableStreamDefaultReader

#### Batch 7.3: WritableStream (6 pages)

- WritableStreamDefaultWriter

#### Batch 7.4: TransformStream (4 pages)

#### Batch 7.5: Remaining stream interfaces

### Phase 8: Events & Input APIs

**Pages**: ~200 | **Batches**: ~12

#### Batch 8.1: KeyboardEvent (16 pages)

#### Batch 8.2: MouseEvent (29 pages)

#### Batch 8.3: PointerEvent (17 pages)

#### Batch 8.4: TouchEvent (9 pages)

#### Batch 8.5: InputEvent, CompositionEvent (12 pages)

#### Batch 8.6: WheelEvent, FocusEvent, DragEvent (12 pages)

#### Batch 8.7: Clipboard API & Events (10 pages)

### Phase 9: Navigation & History

**Pages**: ~50 | **Batches**: ~4

#### Batch 9.1: Navigation API (19 pages)

- Navigation, NavigateEvent, NavigationHistoryEntry

#### Batch 9.2: History API (2 pages) - Already done

### Phase 10: Notifications & Push

**Pages**: ~50 | **Batches**: ~4

#### Batch 10.1: Notification API (28 pages)

#### Batch 10.2: Push API (20 pages)

- PushManager, PushSubscription, PushMessageData

### Phase 11: Observer APIs

**Pages**: ~40 | **Batches**: ~3

#### Batch 11.1: IntersectionObserver (23 pages)

#### Batch 11.2: ResizeObserver (12 pages)

#### Batch 11.3: MutationObserver (5 pages) - Already done

### Phase 12: Media & Audio/Video

**Pages**: ~300 | **Batches**: ~20

#### Batch 12.1: Web Audio API (40 pages)

- AudioContext, BaseAudioContext
- AudioNode family

#### Batch 12.2: MediaDevices & MediaStream (20 pages)

#### Batch 12.3: MediaRecorder (20 pages)

#### Batch 12.4: Media Source Extensions (40 pages)

- MediaSource, SourceBuffer

#### Batch 12.5: Remaining audio/video interfaces

### Phase 13: WebRTC

**Pages**: ~150 | **Batches**: ~10

#### Batch 13.1: RTCPeerConnection (49 pages)

#### Batch 13.2: RTCDataChannel (22 pages)

#### Batch 13.3: RTCIceCandidate (17 pages)

#### Batch 13.4: RTCRtpSender, RTCRtpReceiver (21 pages)

#### Batch 13.5: Remaining WebRTC interfaces

### Phase 14: CSSOM

**Pages**: ~50 | **Batches**: ~4

#### Batch 14.1: CSS Object Model (7 pages)

#### Batch 14.2: CSSStyleDeclaration (11 pages)

#### Batch 14.3: CSSStyleSheet, CSSRule (16 pages)

#### Batch 14.4: CSS interface and remaining interfaces

### Phase 15: Performance APIs

**Pages**: ~100 | **Batches**: ~8

#### Batch 15.1: Performance API (9 pages)

#### Batch 15.2: Performance, PerformanceEntry (26 pages)

#### Batch 15.3: PerformanceResourceTiming (26 pages)

#### Batch 15.4: PerformanceObserver (6 pages)

#### Batch 15.5: Remaining performance interfaces

### Phase 16: Geolocation & Sensors

**Pages**: ~50 | **Batches**: ~4

#### Batch 16.1: Geolocation API (6 pages)

#### Batch 16.2: Sensor APIs (16 pages)

- Accelerometer, Gyroscope, Magnetometer, AmbientLightSensor

#### Batch 16.3: Remaining sensor interfaces

### Phase 17: WebGL/WebGPU

**Pages**: ~300 | **Batches**: ~20

#### Batch 17.1: WebGL API (34 pages)

#### Batch 17.2: WebGLRenderingContext (118 pages)

#### Batch 17.3: WebGL2RenderingContext (74 pages)

#### Batch 17.4: WebGPU API (4 pages)

#### Batch 17.5: GPU family interfaces

### Phase 18: Web Components

**Pages**: ~100 | **Batches**: ~6

#### Batch 18.1: Web Components Overview (4 pages)

#### Batch 18.2: CustomElementRegistry (8 pages)

#### Batch 18.3: ShadowRoot (21 pages) - Already done

#### Batch 18.4: ElementInternals (64 pages)

### Phase 19: Cryptography

**Pages**: ~30 | **Batches**: ~3

#### Batch 19.1: Web Crypto API Overview (2 pages)

#### Batch 19.2: SubtleCrypto (13 pages)

#### Batch 19.3: Crypto, CryptoKey interfaces

### Phase 20: Payment APIs

**Pages**: ~30 | **Batches**: ~3

#### Batch 20.1: Payment Request API (4 pages)

#### Batch 20.2: PaymentRequest (14 pages)

#### Batch 20.3: PaymentResponse (13 pages)

### Phase 21: Miscellaneous APIs

**Pages**: ~300 | **Batches**: ~20

#### Batch 21.1: Navigator (76 pages)

#### Batch 21.2: Screen, Console APIs (38 pages)

#### Batch 21.3: Encoding API (13 pages)

#### Batch 21.4: FormData, URL APIs (26 pages)

#### Batch 21.5: Credential Management, Gamepad APIs (17 pages)

#### Batch 21.6: Various small APIs (vibration, battery, network, etc.)

#### Batch 21.7: Web Speech API (27 pages)

#### Batch 21.8: Web MIDI, USB, Serial, HID APIs (15 pages)

#### Batch 21.9: WebXR, WebVR APIs (20 pages)

#### Batch 21.10: Web Animations API (30 pages)

#### Batch 21.11: Remaining APIs (Reporting, FedCM, Bluetooth, NFC, Trusted Types, etc.)

## Automation & Tooling

### Scripts Available

1. **Cron Prompt**: `scripts/web-api-cron-prompt.md` - Automated translation workflow
2. **Front-matter Linter**: `scripts/front-matter_linter.js`
3. **Terms Glossary**: `translate/vi-terms.md` - 290+ term mappings

### Validation Commands

```bash
# Lint markdown
npm run lint:md

# Fix markdown issues
npm run fix:md

# Lint front-matter
npm run lint:fm

# Fix front-matter
npm run fix:fm

# Build check
npm run build
```

### Git Workflow

```bash
# Check status
git status --short

# Add translated files
git add files/vi/web/api/<path>/


# Commit batch
git commit -m "translate: Web/API/<batch-name> (N pages)" -m "Pages translated:
- Web/API/...
- Web/API/..."


# Push to PR branch
git push origin codex/web-api-vi-translation
```

## PR Comment Strategy

### Every 40 Pages

Add human-readable progress comment:

    ## Progress Update #N

    **Pages translated in this batch**: 40
    **Total Web API pages translated**: XXX/7,944
    **Completion**: X.X%

**Recently completed**:

- [API Family Name] (N pages)

**Next up**: [Next API Family]
```

### Final Comment (at 100%)

```markdown
## Web API Translation Complete! 🎉

**Total pages translated**: 7,944
**Completion**: 100%

**Summary by Category**:

- DOM Core: XXX pages
- Fetch/Networking: XXX pages
- Storage: XXX pages
- HTML Elements: XXX pages
- Canvas/Graphics: XXX pages
- Workers: XXX pages
- Streams: XXX pages
- Events/Input: XXX pages
- Media/Audio/Video: XXX pages
- WebRTC: XXX pages
- CSSOM: XXX pages
- Performance: XXX pages
- Sensors: XXX pages
- WebGL/WebGPU: XXX pages
- Web Components: XXX pages
- Cryptography: XXX pages
- Payment: XXX pages
- Miscellaneous: XXX pages

All pages have been translated, linted, and validated.
Ready for review and merge!
```

## Estimated Timeline

- **Batches**: ~200 batches total
- **Pages per day**: Variable (depends on complexity)
- **Target**: Complete systematically with quality

## Success Metrics

- [ ] All 7,944 pages translated
- [ ] All pages pass linting (`npm run lint:md`)
- [ ] All front-matter valid (`npm run lint:fm`)
- [ ] Build succeeds (`npm run build`)
- [ ] PR comment updates every 40 pages
- [ ] Worklog updated after each batch
- [ ] Checklist updated continuously

## Next Immediate Steps

1. Start with **Phase 1: DOM Core**
2. Begin with **Batch 1.1: Document Interface**
3. Set up parallel agents for faster throughput
4. Establish translation patterns for consistency
