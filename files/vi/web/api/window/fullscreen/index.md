---
title: "Window: thuộc tính fullScreen"
short-title: fullScreen
slug: Web/API/Window/fullScreen
page-type: web-api-instance-property
status:
  - non-standard
browser-compat: api.Window.fullScreen
---

{{APIRef}}{{Non-standard_Header}}

The **`fullScreen`** property of the `Window`
interface indicates whether the window is displayed in full screen mode or not.

## Giá trị

A boolean value with `true` meaning that the window is in full-screen mode and `false` meaning it isn't.

## Ghi chú

- Switching between regular window and full screen will fire the "resize" event on the
  corresponding window.

## Ví dụ

```js
if (window.fullScreen) {
  // it's fullscreen!
} else {
  // not fullscreen!
}
```

## Tính tương thích trên trình duyệt

{{Compat}}
