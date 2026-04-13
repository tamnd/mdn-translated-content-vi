---
title: "GamepadHapticActuator: reset() method"
short-title: reset()
slug: Web/API/GamepadHapticActuator/reset
page-type: web-api-instance-method
browser-compat: api.GamepadHapticActuator.reset
---

{{APIRef("Gamepad API")}}

Phương thức **`reset()`** của giao diện {{domxref("GamepadHapticActuator")}} dừng phần cứng phát hiệu ứng rung đang hoạt động.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Promise được giải quyết với `"complete"` nếu hiệu ứng được đặt lại thành công, hoặc `"preempted"` nếu hiệu ứng bị dừng hoặc thay thế bởi hiệu ứng khác.

Promise có thể bị từ chối với các loại ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Promise bị từ chối với `InvalidStateError` nếu tài liệu hiện tại không hoạt động hoặc bị ẩn.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

setTimeout(() => {
  gamepad.vibrationActuator.reset();
}, 150);

gamepad.vibrationActuator
  .playEffect("dual-rumble", {
    startDelay: 0,
    duration: 200,
    weakMagnitude: 1.0,
    strongMagnitude: 1.0,
  })
  .then((result) => console.log(result));
// Should log "preempted" because reset() will run before the effect ends
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
