---
title: GamepadHapticActuator
slug: Web/API/GamepadHapticActuator
page-type: web-api-interface
browser-compat: api.GamepadHapticActuator
---

{{APIRef("Gamepad API")}}

Giao diện **`GamepadHapticActuator`** của [Gamepad API](/en-US/docs/Web/API/Gamepad_API) đại diện cho phần cứng trong bộ điều khiển được thiết kế để cung cấp phản hồi xúc giác cho người dùng (nếu có), thường nhất là phần cứng rung.

Giao diện này có thể truy cập thông qua thuộc tính {{domxref("Gamepad.hapticActuators")}}.

## Thuộc tính phiên bản

- {{domxref("GamepadHapticActuator.effects")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về mảng các giá trị được liệt kê đại diện cho các hiệu ứng xúc giác khác nhau mà bộ truyền động hỗ trợ.
- {{domxref("GamepadHapticActuator.type")}} {{deprecated_inline}} {{ReadOnlyInline}} {{non-standard_inline}}
  - : Trả về giá trị được liệt kê đại diện cho loại phần cứng xúc giác. Thuộc tính này đã lỗi thời: hãy sử dụng `GamepadHapticActuator.effects` để phát hiện hỗ trợ hiệu ứng.

## Phương thức phiên bản

- {{domxref("GamepadHapticActuator.playEffect()")}} {{ReadOnlyInline}}
  - : Khiến phần cứng phát một hiệu ứng rung cụ thể.
- {{domxref("GamepadHapticActuator.pulse()")}} {{ReadOnlyInline}}
  - : Khiến phần cứng xung tại cường độ nhất định trong khoảng thời gian xác định.
- {{domxref("GamepadHapticActuator.reset()")}} {{ReadOnlyInline}}
  - : Dừng phần cứng phát hiệu ứng rung đang hoạt động.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

gamepad.hapticActuators[0].pulse(1.0, 200);

gamepad.vibrationActuator.playEffect("dual-rumble", {
  startDelay: 0,
  duration: 200,
  weakMagnitude: 1.0,
  strongMagnitude: 1.0,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
