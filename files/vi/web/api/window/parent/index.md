---
title: "Window: thuộc tính parent"
short-title: parent
slug: Web/API/Window/parent
page-type: web-api-instance-property
browser-compat: api.Window.parent
---

{{APIRef}}

The **`Window.parent`** property is a reference to the parent
of the current window or subframe.

If a window does not have a parent, its `parent` property is a reference to
itself.

When a window is loaded in an {{htmlelement("iframe")}}, {{htmlelement("object")}}, or
{{htmlelement("frame")}}, its parent is the window with the element embedding the
window.

## Giá trị

A `Window` or {{htmlelement("iframe")}} object.

## Ví dụ

```js
if (window.parent !== window.top) {
  // We're deeper than one down
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("window.frameElement")}} returns the specific element (such as
  `<iframe>`) the `window` is embedded into.
- {{domxref("window.top")}} returns a reference to the top-level window.
