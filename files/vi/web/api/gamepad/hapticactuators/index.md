---
title: "Gamepad: thuộc tính hapticActuators"
short-title: hapticActuators
slug: Web/API/Gamepad/hapticActuators
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Gamepad.hapticActuators
---

{{APIRef("Gamepad")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`hapticActuators`** của giao diện {{domxref("Gamepad")}} trả về một mảng chứa các đối tượng {{domxref("GamepadHapticActuator")}}, mỗi đối tượng biểu diễn phần cứng phản hồi xúc giác có sẵn trên bộ điều khiển.

## Giá trị

Một mảng chứa các đối tượng {{domxref("GamepadHapticActuator")}}.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

gamepad.hapticActuators[0].pulse(1.0, 200);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
