---
title: "Window: thuộc tính frames"
short-title: frames
slug: Web/API/Window/frames
page-type: web-api-instance-property
browser-compat: api.Window.frames
---

{{APIRef("DOM")}}

Returns the window itself, which is an array-like object, listing the direct sub-frames
of the current window.

## Giá trị

A list of frame objects. It is similar to an
array in that it has a `length` property and its items can be accessed
using the `[i]` notation.

- `frames === window` evaluates to true.
- Each item in the `window.frames` pseudo-array represents the {{domxref("Window")}}
  object corresponding to the given {{HTMLElement("frame")}}'s or
  {{HTMLElement("iframe")}}'s content, not the `frame` or `iframe` DOM element (i.e.,
  `window.frames[0]` is the same thing as
  `document.getElementsByTagName("iframe")[0].contentWindow`).
- For more details about the returned value, refer to this [thread on mozilla.dev.platform](https://groups.google.com/g/mozilla.dev.platform/c/VijG80aFnU8).

## Ví dụ

```js
const frames = window.frames; // or const frames = window.parent.frames;
for (let i = 0; i < frames.length; i++) {
  // do something with each subframe as frames[i]
  frames[i].document.body.style.background = "red";
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
