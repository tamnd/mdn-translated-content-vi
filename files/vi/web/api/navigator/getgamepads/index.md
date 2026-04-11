---
title: "Navigator: phương thức getGamepads()"
short-title: getGamepads()
slug: Web/API/Navigator/getGamepads
page-type: web-api-instance-method
browser-compat: api.Navigator.getGamepads
---

{{APIRef("Gamepad API")}}

Phương thức **`Navigator.getGamepads()`** trả về một mảng gồm
Các đối tượng {{domxref("Gamepad")}}, một đối tượng cho mỗi gamepad được kết nối với thiết bị.

Các phần tử trong mảng có thể là `null` nếu gamepad ngắt kết nối trong khi
phiên, để các gamepad còn lại giữ nguyên chỉ mục.

## Cú pháp

```js-nolint
getGamepads()
```

### Thông số

Không có.

### Giá trị trả về

{{jsxref("Array")}} của đối tượng {{domxref("Gamepad")}}, cuối cùng sẽ trống.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Việc sử dụng tính năng này đã bị [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) chặn.

## Ví dụ

```js
window.addEventListener("gamepadconnected", (e) => {
  const gp = navigator.getGamepads()[e.gamepad.index];
  console.log(
    `Gamepad connected at index ${gp.index}: ${gp.id} with ${gp.buttons.length} buttons, ${gp.axes.length} axes.`,
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
