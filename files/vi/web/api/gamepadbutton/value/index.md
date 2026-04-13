---
title: "GamepadButton: value property"
short-title: value
slug: Web/API/GamepadButton/value
page-type: web-api-instance-property
browser-compat: api.GamepadButton.value
---

{{APIRef("Gamepad API")}}{{SecureContext_Header}}

Thuộc tính **`GamepadButton.value`** của giao diện
{{domxref("GamepadButton")}} trả về giá trị double dùng để biểu diễn
trạng thái hiện tại của các nút analog trên nhiều tay cầm hiện đại, chẳng hạn như các nút kích hoạt.

Các giá trị được chuẩn hóa trong phạm vi `0.0` đến `1.0`, với
`0.0` đại diện cho nút không được nhấn, và 1.0 đại diện cho
nút được nhấn hoàn toàn.

## Ví dụ

```js
let gp = navigator.getGamepads()[0];

if (gp.buttons[0].value > 0) {
  // respond to analog button being pressed in
}
```

## Giá trị

Một double.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
