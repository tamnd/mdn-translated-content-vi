---
title: "Gamepad: thuộc tính index"
short-title: index
slug: Web/API/Gamepad/index
page-type: web-api-instance-property
browser-compat: api.Gamepad.index
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.index`** của giao diện {{domxref("Gamepad")}} trả về một số nguyên được tự động tăng để duy nhất cho từng thiết bị hiện đang được kết nối với hệ thống.

Thuộc tính này có thể dùng để phân biệt nhiều bộ điều khiển; một gamepad bị ngắt kết nối rồi kết nối lại sẽ giữ nguyên chỉ số cũ.

## Giá trị

Một {{jsxref("number")}}.

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
