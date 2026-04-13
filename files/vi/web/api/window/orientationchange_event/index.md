---
title: "Window: sự kiện orientationchange"
short-title: orientationchange
slug: Web/API/Window/orientationchange_event
page-type: web-api-event
status:
  - deprecated
browser-compat: api.Window.orientationchange_event
---

{{APIRef}}{{Deprecated_Header}}

The `orientationchange` event is fired when the orientation of the device has changed.

This event is not cancelable and does not bubble.

This event is deprecated. Listen for the {{domxref("ScreenOrientation.change_event", "change")}} event of the {{domxref("ScreenOrientation")}} interface instead.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("orientationchange", (event) => { })

onorientationchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

You can use the `orientationchange` event in an {{domxref("EventTarget/addEventListener", "addEventListener")}} method:

```js
window.addEventListener("orientationchange", (event) => {
  console.log(
    `the orientation of the device is now ${event.target.screen.orientation.angle}`,
  );
});
```

Or use the `onorientationchange` event handler property:

```js
window.onorientationchange = (event) => {
  console.log(
    `the orientation of the device is now ${event.target.screen.orientation.angle}`,
  );
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
