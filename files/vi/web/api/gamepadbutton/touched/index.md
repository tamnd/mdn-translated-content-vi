---
title: "GamepadButton: touched property"
short-title: touched
slug: Web/API/GamepadButton/touched
page-type: web-api-instance-property
browser-compat: api.GamepadButton.touched
---

{{APIRef("Gamepad API")}}{{SecureContext_Header}}

Thuộc tính **`touched`** của giao diện
{{domxref("GamepadButton")}} trả về giá trị `boolean` cho biết
nút có khả năng phát hiện chạm đang được chạm (`true`) hay không được chạm (`false`).

Nếu nút không có khả năng phát hiện chạm nhưng có thể trả về giá trị analog, thuộc tính sẽ là `true` nếu giá trị lớn hơn `0`, và `false` nếu không. Nếu nút không có khả năng phát hiện chạm và chỉ có thể báo cáo giá trị số, thì nó phải phản ánh thuộc tính {{domxref("GamepadButton.pressed")}}.

## Giá trị

Một {{jsxref("Boolean")}}. True nếu đang được chạm.

## Ví dụ

```js
let gp = navigator.getGamepads()[0]; // Get the first gamepad object

if (gp.buttons[0].touched) {
  // respond to button being touched
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
