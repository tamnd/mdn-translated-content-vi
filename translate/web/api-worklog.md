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

Translate the `Attr` interface and its core instance properties in one compact DOM batch.

Planned pages:

1. `Web/API/Attr`
2. `Web/API/Attr/localName`
3. `Web/API/Attr/name`
4. `Web/API/Attr/namespaceURI`
5. `Web/API/Attr/ownerElement`
6. `Web/API/Attr/prefix`
7. `Web/API/Attr/specified`
8. `Web/API/Attr/value`

## Batch 8

Continue with a compact `Accelerometer` sensor batch that keeps the interface and its coordinate properties together for consistent terminology.

Planned pages:

1. `Web/API/Accelerometer`
2. `Web/API/Accelerometer/Accelerometer`
3. `Web/API/Accelerometer/x`
4. `Web/API/Accelerometer/y`
5. `Web/API/Accelerometer/z`

## Batch 10

Translate the AES parameter dictionaries as one small Web Crypto batch so the shared terminology stays consistent across encryption parameter pages.

Planned pages:

1. `Web/API/AesCbcParams`
2. `Web/API/AesCtrParams`
3. `Web/API/AesDerivedKeyParams`
4. `Web/API/AesGcmParams`
5. `Web/API/AesKeyGenParams`

## Batch 11

Translate the `AmbientLightSensor` interface, constructor, and illuminance property together so the sensor terminology stays consistent across the compact batch.

Planned pages:

1. `Web/API/AmbientLightSensor`
2. `Web/API/AmbientLightSensor/AmbientLightSensor`
3. `Web/API/AmbientLightSensor/illuminance`

## Batch 21

Translate the `AnimationEffect` interface and its core timing methods together so the timing terminology stays consistent across the Web Animations API batch.

Planned pages:

1. `Web/API/AnimationEffect`
2. `Web/API/AnimationEffect/getComputedTiming`
3. `Web/API/AnimationEffect/getTiming`
4. `Web/API/AnimationEffect/updateTiming`

## Batch 7

Continue with the `AbsoluteOrientationSensor` pair to cover the interface and constructor together as a compact sensor batch.

Planned pages:

1. `Web/API/AbsoluteOrientationSensor`
2. `Web/API/AbsoluteOrientationSensor/AbsoluteOrientationSensor`

## Batch 9

Translate the `ANGLE_instanced_arrays` WebGL extension and its related methods together so the terminology stays aligned across the extension API.

Planned pages:

1. `Web/API/ANGLE_instanced_arrays`
2. `Web/API/ANGLE_instanced_arrays/drawArraysInstancedANGLE`
3. `Web/API/ANGLE_instanced_arrays/drawElementsInstancedANGLE`
4. `Web/API/ANGLE_instanced_arrays/vertexAttribDivisorANGLE`

## Batch 12

Translate the `AnalyserNode` Web Audio family together so the interface, constructor, methods, and tuning properties stay consistent across one batch.

Planned pages:

1. `Web/API/AnalyserNode`
2. `Web/API/AnalyserNode/AnalyserNode`
3. `Web/API/AnalyserNode/fftSize`
4. `Web/API/AnalyserNode/frequencyBinCount`
5. `Web/API/AnalyserNode/getByteFrequencyData`
6. `Web/API/AnalyserNode/getByteTimeDomainData`
7. `Web/API/AnalyserNode/getFloatFrequencyData`
8. `Web/API/AnalyserNode/getFloatTimeDomainData`
9. `Web/API/AnalyserNode/maxDecibels`
10. `Web/API/AnalyserNode/minDecibels`
11. `Web/API/AnalyserNode/smoothingTimeConstant`

## Batch 17

Translate the `AnimationPlaybackEvent` and `AnimationTimeline` family together so the animation timing terminology stays aligned across the interface and properties.

Planned pages:

1. `Web/API/AnimationPlaybackEvent`
2. `Web/API/AnimationPlaybackEvent/AnimationPlaybackEvent`
3. `Web/API/AnimationPlaybackEvent/currentTime`
4. `Web/API/AnimationPlaybackEvent/timelineTime`
5. `Web/API/AnimationTimeline`
6. `Web/API/AnimationTimeline/currentTime`
7. `Web/API/AnimationTimeline/duration`

## Batch 22

Translate the `AnimationEvent` family together so the interface, constructor, and instance properties keep their animation terminology aligned in one compact batch.

Planned pages:

1. `Web/API/AnimationEvent`
2. `Web/API/AnimationEvent/AnimationEvent`
3. `Web/API/AnimationEvent/animationName`
4. `Web/API/AnimationEvent/elapsedTime`
5. `Web/API/AnimationEvent/pseudoElement`

## Batch 23

Translate the `Animation` interface and its related constructor, properties, methods, and events together so the Web Animations terminology remains aligned across the family.

Planned pages:

1. `Web/API/Animation`
2. `Web/API/Animation/Animation`
3. `Web/API/Animation/cancel`
4. `Web/API/Animation/cancel_event`
5. `Web/API/Animation/commitStyles`
6. `Web/API/Animation/currentTime`
7. `Web/API/Animation/effect`
8. `Web/API/Animation/finish`
9. `Web/API/Animation/finish_event`
10. `Web/API/Animation/finished`

## Batch 24

Translate the `AudioDestinationNode` family together so the Web Audio destination interface and its channel-count property stay aligned in one compact batch.

Planned pages:

1. `Web/API/AudioDestinationNode`
2. `Web/API/AudioDestinationNode/maxChannelCount`

## Batch 25

Checked the `AudioDecoder` family against the English source. The Vietnamese pages for this family are already present and aligned, so no page-level changes were needed in this batch.

Reviewed pages:

1. `Web/API/AudioDecoder`
2. `Web/API/AudioDecoder/AudioDecoder`
3. `Web/API/AudioDecoder/close`
4. `Web/API/AudioDecoder/configure`
5. `Web/API/AudioDecoder/decode`
6. `Web/API/AudioDecoder/decodeQueueSize`
7. `Web/API/AudioDecoder/dequeue_event`
8. `Web/API/AudioDecoder/flush`
9. `Web/API/AudioDecoder/isConfigSupported_static`
10. `Web/API/AudioDecoder/reset`
11. `Web/API/AudioDecoder/state`

## Batch 26

Rechecked the `AudioDecoder` family against the English source after the previous verification. The Vietnamese pages remain aligned, and no page-level edits were necessary.

## Batch 32

Checked the `AudioParam` family against the English source. The Vietnamese pages for this family are already present and aligned, so no page-level changes were needed in this batch.

Reviewed pages:

1. `Web/API/AudioParam`
2. `Web/API/AudioParam/value`
3. `Web/API/AudioParam/setValueAtTime`
4. `Web/API/AudioParam/linearRampToValueAtTime`
5. `Web/API/AudioParam/exponentialRampToValueAtTime`
6. `Web/API/AudioParam/setTargetAtTime`
7. `Web/API/AudioParam/setValueCurveAtTime`
8. `Web/API/AudioParam/cancelScheduledValues`
9. `Web/API/AudioParam/cancelAndHoldAtTime`
10. `Web/API/AudioParam/defaultValue`
11. `Web/API/AudioParam/maxValue`
12. `Web/API/AudioParam/minValue`

## Batch 27

Checked the `AudioListener` family against the English source. The Vietnamese pages for this family are already present and aligned, so no page-level changes were needed in this batch.

Reviewed pages:

1. `Web/API/AudioListener`
2. `Web/API/AudioListener/setOrientation`
3. `Web/API/AudioListener/setPosition`
4. `Web/API/AudioListener/forwardX`
5. `Web/API/AudioListener/forwardY`
6. `Web/API/AudioListener/forwardZ`
7. `Web/API/AudioListener/positionX`
8. `Web/API/AudioListener/positionY`
9. `Web/API/AudioListener/positionZ`
10. `Web/API/AudioListener/upX`
11. `Web/API/AudioListener/upY`
12. `Web/API/AudioListener/upZ`

## Batch 28

Checked the `AudioProcessingEvent` family against the English source. The Vietnamese pages for this family are already present and aligned, so no page-level changes were needed in this batch.

Reviewed pages:

1. `Web/API/AudioProcessingEvent`
2. `Web/API/AudioProcessingEvent/AudioProcessingEvent`
3. `Web/API/AudioProcessingEvent/inputBuffer`
4. `Web/API/AudioProcessingEvent/outputBuffer`
5. `Web/API/AudioProcessingEvent/playbackTime`

## Batch 31

Checked the `AudioScheduledSourceNode` family against the English source. The Vietnamese pages for this family are already present and aligned, so no page-level changes were needed in this batch.

Reviewed pages:

1. `Web/API/AudioScheduledSourceNode`
2. `Web/API/AudioScheduledSourceNode/start`
3. `Web/API/AudioScheduledSourceNode/stop`
4. `Web/API/AudioScheduledSourceNode/ended_event`
