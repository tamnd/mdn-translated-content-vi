---
title: "Gamepad: thuộc tính connected"
short-title: connected
slug: Web/API/Gamepad/connected
page-type: web-api-instance-property
browser-compat: api.Gamepad.connected
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.connected`** của giao diện {{domxref("Gamepad")}} trả về một giá trị boolean cho biết gamepad còn đang được kết nối với hệ thống hay không.

Nếu gamepad đang được kết nối, giá trị là `true`; nếu không, giá trị là `false`.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const gp = navigator.getGamepads()[0];
console.log(gp.connected);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
