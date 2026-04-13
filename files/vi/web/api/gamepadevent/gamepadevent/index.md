---
title: "GamepadEvent: GamepadEvent() constructor"
short-title: GamepadEvent()
slug: Web/API/GamepadEvent/GamepadEvent
page-type: web-api-constructor
browser-compat: api.GamepadEvent.GamepadEvent
---

{{APIRef("Gamepad API")}}{{SecureContext_Header}}

Hàm khởi tạo **`GamepadEvent()`** tạo đối tượng {{domxref("GamepadEvent")}} mới.

## Cú pháp

```js-nolint
new GamepadEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và các trình duyệt đặt nó thành `gamepadconnected` hoặc `gamepaddisconnected`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `gamepad`
      - : Đối tượng {{domxref("Gamepad")}} mô tả gamepad liên quan đến sự kiện.

### Giá trị trả về

Đối tượng {{domxref("GamepadEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
