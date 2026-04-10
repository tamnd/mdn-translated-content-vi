---
title: "Gamepad: thuộc tính id"
short-title: id
slug: Web/API/Gamepad/id
page-type: web-api-instance-property
browser-compat: api.Gamepad.id
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.id`** của giao diện {{domxref("Gamepad")}} trả về một chuỗi chứa một số thông tin về bộ điều khiển.

Cú pháp chính xác không được đặc tả chặt chẽ, nhưng trong Firefox nó sẽ chứa ba phần thông tin được ngăn cách bằng dấu gạch ngang (`-`):

- Hai chuỗi thập lục phân 4 chữ số chứa USB vendor ID và product ID của bộ điều khiển
- Tên của bộ điều khiển do trình điều khiển cung cấp.

Ví dụ, một bộ điều khiển PS2 trả về **810-3-USB Gamepad**.

Thông tin này nhằm giúp bạn tìm ra cách ánh xạ cho các điều khiển trên thiết bị cũng như hiển thị phản hồi hữu ích cho người dùng.

## Giá trị

Một giá trị chuỗi nguyên thủy.

## Ví dụ

```js
window.addEventListener("gamepadconnected", () => {
  const gp = navigator.getGamepads()[0];
  gamepadInfo.textContent = `Gamepad connected at index ${gp.index}: ${gp.id}.`;
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
