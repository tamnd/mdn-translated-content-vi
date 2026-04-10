---
title: "Window: sự kiện gamepadconnected"
short-title: gamepadconnected
slug: Web/API/Window/gamepadconnected_event
page-type: web-api-event
browser-compat: api.Window.gamepadconnected_event
---

{{APIRef}}

The `gamepadconnected` event is fired when the browser detects that a gamepad has been connected or the first time a button/axis of the gamepad is used.

The event will not fire if disallowed by the document's {{httpheader('Permissions-Policy/gamepad','gamepad')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

This event is not cancelable and does not bubble.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("gamepadconnected", (event) => { })

ongamepadconnected = (event) => { }
```

## Ví dụ

To be informed when a gamepad is connected, you can add a handler to the window using {{domxref("EventTarget.addEventListener", "addEventListener()")}}, like this:

```js
window.addEventListener("gamepadconnected", (event) => {
  // All buttons and axes values can be accessed through
  const gamepad = event.gamepad;
});
```

Alternatively, you can use the `window.ongamepadconnected` event handler property to establish a handler for the `gamepadconnected` event:

```js
window.ongamepadconnected = (event) => {
  // All buttons and axes values can be accessed through
  const gamepad = event.gamepad;
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [gamepaddisconnected](/en-US/docs/Web/API/Window/gamepaddisconnected_event)
- [Using Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
