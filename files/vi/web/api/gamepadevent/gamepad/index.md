---
title: "GamepadEvent: gamepad property"
short-title: gamepad
slug: Web/API/GamepadEvent/gamepad
page-type: web-api-instance-property
browser-compat: api.GamepadEvent.gamepad
---

{{APIRef("Gamepad API")}}{{SecureContext_Header}}

Thuộc tính **`GamepadEvent.gamepad`** của **giao diện {{domxref("GamepadEvent")}}** trả về đối tượng {{domxref("Gamepad")}}, cung cấp quyền truy cập vào dữ liệu gamepad liên quan cho các sự kiện {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}} được kích hoạt.

## Giá trị

Đối tượng {{domxref("Gamepad")}}.

## Ví dụ

Thuộc tính `gamepad` được gọi trên sự kiện {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} được kích hoạt.

```js
window.addEventListener("gamepadconnected", (e) => {
  console.log(
    "Gamepad connected at index %d: %s. %d buttons, %d axes.",
    e.gamepad.index,
    e.gamepad.id,
    e.gamepad.buttons.length,
    e.gamepad.axes.length,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
