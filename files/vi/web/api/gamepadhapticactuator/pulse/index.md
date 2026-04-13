---
title: "GamepadHapticActuator: pulse() method"
short-title: pulse()
slug: Web/API/GamepadHapticActuator/pulse
page-type: web-api-instance-method
browser-compat: api.GamepadHapticActuator.pulse
---

{{APIRef("Gamepad API")}}

Phương thức **`pulse()`** của giao diện {{domxref("GamepadHapticActuator")}} khiến phần cứng xung tại cường độ nhất định trong khoảng thời gian xác định.

## Cú pháp

```js-nolint
pulse(value, duration)
```

### Tham số

- `value`
  - : Một số double đại diện cho cường độ của xung. Điều này có thể thay đổi tùy thuộc vào loại phần cứng, nhưng thường nhận giá trị từ 0.0 (không có cường độ) đến 1.0 (cường độ đầy đủ).
- `duration`
  - : Một số double đại diện cho thời gian của xung, tính bằng mili giây.

> [!NOTE]
> Các lệnh gọi lặp lại đến `pulse()` sẽ ghi đè lên các lệnh gọi trước đó nếu chúng vẫn đang diễn ra.

### Giá trị trả về

Promise được giải quyết với giá trị `true` khi xung hoàn thành thành công.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

gamepad.hapticActuators[0].pulse(1.0, 200);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
