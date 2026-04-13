---
title: "GamepadHapticActuator: type property"
short-title: type
slug: Web/API/GamepadHapticActuator/type
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.GamepadHapticActuator.type
---

{{APIRef("Gamepad API")}}{{deprecated_header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("GamepadHapticActuator")}} trả về giá trị được liệt kê đại diện cho loại phần cứng xúc giác.

Thuộc tính này đã lỗi thời: hãy sử dụng {{domxref("GamepadHapticActuator.effects")}} để phát hiện hỗ trợ hiệu ứng.

## Giá trị

Giá trị được liệt kê đại diện cho loại phần cứng xúc giác. Các loại hiện có sẵn là:

- `"vibration"`
  - : Phần cứng rung đơn giản, tạo ra hiệu ứng rung.
- `"dual-rumble"`
  - : Bộ điều khiển có động cơ rung ở mỗi tay cầm. Mỗi động cơ có thể được rung độc lập để tạo hiệu ứng rung vị trí.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

// Logs "vibration" or "dual-rumble"
console.log(gamepad.hapticActuators[0].type);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
