---
title: "Gamepad: thuộc tính axes"
short-title: axes
slug: Web/API/Gamepad/axes
page-type: web-api-instance-property
browser-compat: api.Gamepad.axes
---

{{APIRef("Gamepad API")}}

Thuộc tính **`Gamepad.axes`** của giao diện {{domxref("Gamepad")}} trả về một mảng biểu diễn các điều khiển có trục trên thiết bị (ví dụ: cần analog).

Mỗi mục trong mảng là một giá trị số thực trong phạm vi -1.0 – 1.0, biểu thị vị trí trục từ giá trị thấp nhất (-1.0) đến giá trị cao nhất (1.0).

## Giá trị

Một mảng số.

## Ví dụ

```js
function gameLoop() {
  const [gp] = navigator.getGamepads();

  let a = 0;
  let b = 0;
  if (gp.axes[0] !== 0) {
    b -= gp.axes[0];
  } else if (gp.axes[1] !== 0) {
    a += gp.axes[1];
  } else if (gp.axes[2] !== 0) {
    b += gp.axes[2];
  } else if (gp.axes[3] !== 0) {
    a -= gp.axes[3];
  }

  ball.style.left = `${a * 2}px`;
  ball.style.top = `${b * 2}px`;

  const start = requestAnimationFrame(gameLoop);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

[Using the Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
