---
title: "GamepadHapticActuator: effects property"
short-title: effects
slug: Web/API/GamepadHapticActuator/effects
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.GamepadHapticActuator.effects
---

{{APIRef("Gamepad API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`effects`** của giao diện {{domxref("GamepadHapticActuator")}} trả về mảng các giá trị được liệt kê đại diện cho các hiệu ứng xúc giác khác nhau mà bộ truyền động hỗ trợ.

## Giá trị

Một mảng đại diện cho các hiệu ứng xúc giác được hỗ trợ. Các giá trị có thể bao gồm:

- `"dual-rumble"`
  - : Hiệu ứng rung vị trí được tạo ra bởi hai động cơ rung trong mỗi tay cầm của bộ điều khiển, có thể được rung độc lập.
- `"trigger-rumble"`
  - : Hiệu ứng rung cục bộ trên bề mặt các nút kích hoạt của bộ điều khiển được tạo ra bởi động cơ rung nằm trong mỗi nút. Các nút này thường ở dạng cò lò xo.

> [!NOTE]
> Nếu một hiệu ứng không được liệt kê mặc dù được biết là được phần cứng hỗ trợ, có thể trình duyệt không hỗ trợ phát hiệu ứng loại đó.

## Ví dụ

```js
const gamepad = navigator.getGamepads()[0];

// Logs "dual-rumble" or "trigger-rumble"
console.log(gamepad.hapticActuators[0].effects[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
