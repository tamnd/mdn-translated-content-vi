---
title: "Window: thuộc tính viewport"
short-title: viewport
slug: Web/API/Window/viewport
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Window.viewport
---

{{APIRef("Viewport Segments API")}}{{SeeCompatTable}}

The `viewport` read-only property of the {{domxref("Window")}} interface returns a {{domxref("Viewport")}} object instance, which provides information about the current state of the device's viewport.

See the {{domxref("Viewport")}} API for all available properties.

## Giá trị

A {{domxref("Viewport")}} object instance.

## Ví dụ

### Basic `viewport` usage

```js
const currentViewport = window.viewport;
const segments = window.viewport.segments;
```

## Specifications

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Viewport.segments")}} property
- {{domxref("Viewport")}} interface
- {{domxref("VisualViewport")}} interface
- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
- [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API)
- [Viewport concepts](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts)
- [CSS viewport](/en-US/docs/Web/CSS/Guides/Viewport) module
- [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view) module
