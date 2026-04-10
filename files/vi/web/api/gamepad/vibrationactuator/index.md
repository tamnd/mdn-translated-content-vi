---
title: "Gamepad: thuộc tính vibrationActuator"
short-title: vibrationActuator
slug: Web/API/Gamepad/vibrationActuator
page-type: web-api-instance-property
browser-compat: api.Gamepad.vibrationActuator
---

{{APIRef("Gamepad")}}

Thuộc tính chỉ đọc **`vibrationActuator`** của giao diện {{domxref("Gamepad")}} trả về một đối tượng {{domxref("GamepadHapticActuator")}}, biểu diễn phần cứng phản hồi xúc giác có sẵn trên bộ điều khiển.

> [!NOTE]
> Mức hỗ trợ thuộc tính này có thể khác nhau tùy theo từng tổ hợp nền tảng và bộ điều khiển. Ngay cả khi bộ điều khiển hỗ trợ phản hồi xúc giác, nền tảng vẫn có thể không hỗ trợ nó.

## Giá trị

Một đối tượng {{domxref("GamepadHapticActuator")}}.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

gamepad.vibrationActuator.playEffect("dual-rumble", {
  startDelay: 0,
  duration: 200,
  weakMagnitude: 1.0,
  strongMagnitude: 1.0,
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
