---
title: "GamepadHapticActuator: playEffect() method"
short-title: playEffect()
slug: Web/API/GamepadHapticActuator/playEffect
page-type: web-api-instance-method
browser-compat: api.GamepadHapticActuator.playEffect
---

{{APIRef("Gamepad API")}}

Phương thức **`playEffect()`** của giao diện {{domxref("GamepadHapticActuator")}} khiến phần cứng phát một hiệu ứng rung cụ thể.

## Cú pháp

```js-nolint
playEffect(type, params)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho hiệu ứng mong muốn. Các giá trị có thể là `"dual-rumble"` và `"trigger-rumble"`, và hiệu ứng của chúng có thể thay đổi tùy thuộc vào loại phần cứng. Xem {{domxref("GamepadHapticActuator.effects")}} để biết thêm chi tiết về các loại hiệu ứng.

- `params`
  - : Một đối tượng để mô tả hiệu ứng xúc giác mong muốn.

    Các giá trị được kỳ vọng là:
    - `duration` {{optional_inline}}
      - : Thời gian của hiệu ứng tính bằng mili giây.
        Mặc định là `0`.
    - `startDelay` {{optional_inline}}
      - : Độ trễ tính bằng mili giây trước khi hiệu ứng bắt đầu.
        Mặc định là `0`.
    - `strongMagnitude` {{optional_inline}}
      - : Cường độ rung của động cơ rung tần số thấp (mạnh), được chuẩn hóa trong khoảng từ `0.0` đến `1.0`.
        Mặc định là `0.0`.
    - `weakMagnitude` {{optional_inline}}
      - : Cường độ rung của động cơ rung tần số cao (yếu), được chuẩn hóa trong khoảng từ `0.0` đến `1.0`.
        Mặc định là `0.0`.
    - `leftTrigger` (chỉ liên quan đến hiệu ứng `"trigger-rumble"`) {{optional_inline}}
      - : Cường độ rung của cò kích dưới bên trái, được chuẩn hóa trong khoảng từ `0.0` đến `1.0`.
        Mặc định là `0.0`.
    - `rightTrigger` (chỉ liên quan đến hiệu ứng `"trigger-rumble"`) {{optional_inline}}
      - : Cường độ rung của cò kích dưới bên phải, được chuẩn hóa trong khoảng từ `0.0` đến `1.0`.
        Mặc định là `0.0`.

> [!NOTE]
> Lệnh gọi mới tới `playEffect()` sẽ ghi đè lên lệnh gọi đang diễn ra trước đó.

### Giá trị trả về

Promise được giải quyết với `"complete"` khi hiệu ứng hoàn thành thành công, hoặc `"preempted"` nếu hiệu ứng hiện tại bị dừng hoặc thay thế bởi hiệu ứng khác.

Promise có thể bị từ chối với các loại ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Tài liệu hiện tại không hoạt động hoặc bị ẩn.
- `NotSupportedError` {{domxref("DOMException")}}
  - : `type` được yêu cầu không được hỗ trợ bởi bộ truyền động của gamepad hiện tại.
- `TypeError` {{domxref("DOMException")}}
  - : `type` được yêu cầu không phải là loại hiệu ứng hợp lệ.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

gamepad.vibrationActuator
  .playEffect("dual-rumble", {
    startDelay: 0,
    duration: 200,
    weakMagnitude: 1.0,
    strongMagnitude: 1.0,
  })
  .then((result) => console.log(result));
// Should log "complete" if effect successfully runs
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
