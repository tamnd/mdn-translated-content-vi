---
title: "GamepadButton: pressed property"
short-title: pressed
slug: Web/API/GamepadButton/pressed
page-type: web-api-instance-property
browser-compat: api.GamepadButton.pressed
---

{{APIRef("Gamepad API")}}{{SecureContext_Header}}

Thuộc tính **`GamepadButton.pressed`** của giao diện
{{domxref("GamepadButton")}} trả về giá trị `boolean` cho biết
nút hiện đang được nhấn (`true`) hay không nhấn (`false`).

## Ví dụ

```js
let gp = navigator.getGamepads()[0]; // Get the first gamepad object

if (gp.buttons[0].pressed) {
  // respond to button being pressed
}
```

## Giá trị

Giá trị boolean.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
