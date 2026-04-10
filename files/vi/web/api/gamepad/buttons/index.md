---
title: "Gamepad: thuộc tính buttons"
short-title: buttons
slug: Web/API/Gamepad/buttons
page-type: web-api-instance-property
browser-compat: api.Gamepad.buttons
---

{{APIRef("Gamepad API")}}

Thuộc tính **`buttons`** của giao diện {{domxref("Gamepad")}} trả về một mảng các đối tượng {{domxref("GamepadButton")}} biểu diễn các nút bấm có trên thiết bị.

Mỗi mục trong mảng là `0` nếu nút chưa được nhấn, và là giá trị khác `0` (thường là `1.0`) nếu nút đang được nhấn.

## Giá trị

Một mảng các đối tượng {{domxref("GamepadButton")}}.

## Ví dụ

Tùy theo loại nút, chúng ta cần truy cập thuộc tính {{domxref("GamepadButton.value")}} hoặc {{domxref("GamepadButton.pressed")}}. Ví dụ này hỗ trợ cả hai:

```js
function gameLoop() {
  const gp = navigator.getGamepads()[0];

  if (gp.buttons[0].value > 0 || gp.buttons[0].pressed) {
    b--;
  } else if (gp.buttons[1].value > 0 || gp.buttons[1].pressed) {
    a++;
  } else if (gp.buttons[2].value > 0 || gp.buttons[2].pressed) {
    b++;
  } else if (gp.buttons[3].value > 0 || gp.buttons[3].pressed) {
    a--;
  }

  ball.style.left = `${a * 2}px`; // ball is a UI widget
  ball.style.top = `${b * 2}px`;

  requestAnimationFrame(gameLoop);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
