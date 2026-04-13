---
title: GamepadEvent
slug: Web/API/GamepadEvent
page-type: web-api-interface
browser-compat: api.GamepadEvent
---

{{APIRef("Gamepad API")}}

Giao diện GamepadEvent của Gamepad API chứa các tham chiếu đến các gamepad được kết nối với hệ thống, đây là những gì các sự kiện gamepad {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} và {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}} được kích hoạt để phản hồi.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("GamepadEvent.GamepadEvent","GamepadEvent()")}}
  - : Trả về đối tượng `GamepadEvent` mới.

## Thuộc tính phiên bản

- {{ domxref("GamepadEvent.gamepad") }} {{ReadOnlyInline}}
  - : Trả về đối tượng {{ domxref("Gamepad") }}, cung cấp quyền truy cập vào dữ liệu gamepad liên quan cho sự kiện được kích hoạt.

## Ví dụ

Thuộc tính gamepad được gọi trên sự kiện {{domxref("Window.gamepadconnected_event", "gamepadconnected")}} được kích hoạt.

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

Và trên sự kiện {{domxref("Window.gamepaddisconnected_event", "gamepaddisconnected")}}.

```js
window.addEventListener("gamepaddisconnected", (e) => {
  console.log(
    "Gamepad disconnected from index %d: %s",
    e.gamepad.index,
    e.gamepad.id,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
