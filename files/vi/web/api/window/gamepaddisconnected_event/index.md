---
title: "Window: sự kiện gamepaddisconnected"
short-title: gamepaddisconnected
slug: Web/API/Window/gamepaddisconnected_event
page-type: web-api-event
browser-compat: api.Window.gamepaddisconnected_event
---

{{APIRef}}

The `gamepaddisconnected` event is fired when the browser detects that a gamepad has been disconnected.

The event will not fire if disallowed by the document's {{httpheader('Permissions-Policy/gamepad','gamepad')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

This event is not cancelable and does not bubble.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("gamepaddisconnected", (event) => { })

ongamepaddisconnected = (event) => { }
```

## Ví dụ

To be informed when a gamepad is disconnected, you can add a handler to the window using {{domxref("EventTarget.addEventListener", "addEventListener()")}}, like this:

```js
window.addEventListener("gamepaddisconnected", (event) => {
  console.log("Lost connection with the gamepad.");
});
```

Alternatively, you can use the `window.ongamepaddisconnected` event handler property to establish a handler for the `gamepaddisconnected` event:

```js
window.ongamepaddisconnected = (event) => {
  console.log("Lost connection with the gamepad.");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [gamepadconnected](/en-US/docs/Web/API/Window/gamepadconnected_event)
- [Using Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
