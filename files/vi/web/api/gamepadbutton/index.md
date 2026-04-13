---
title: GamepadButton
slug: Web/API/GamepadButton
page-type: web-api-interface
browser-compat: api.GamepadButton
---

{{APIRef("Gamepad API")}}

Giao diện **`GamepadButton`** xác định một nút riêng lẻ của tay cầm chơi game hoặc bộ điều khiển khác, cho phép truy cập vào trạng thái hiện tại của các loại nút khác nhau có trên thiết bị điều khiển.

Đối tượng `GamepadButton` được trả về bằng cách truy vấn bất kỳ giá trị nào của mảng được trả về bởi thuộc tính `buttons` của giao diện {{domxref("Gamepad")}}.

## Thuộc tính phiên bản

- {{domxref("GamepadButton.pressed")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết nút hiện đang được nhấn (`true`) hay không nhấn (`false`).
- {{domxref("GamepadButton.touched")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết nút hiện đang được chạm (`true`) hay không chạm (`false`).
- {{domxref("GamepadButton.value")}} {{ReadOnlyInline}}
  - : Giá trị double dùng để biểu diễn trạng thái hiện tại của các nút analog, chẳng hạn như các nút kích hoạt trên nhiều tay cầm hiện đại. Các giá trị được chuẩn hóa trong phạm vi 0.0 đến 1.0, với 0.0 đại diện cho nút không được nhấn, và 1.0 đại diện cho nút được nhấn hoàn toàn.

## Ví dụ

Các giá trị nút trong ví dụ sau được lưu trữ dưới dạng mảng các đối tượng `GamepadButton`. Ví dụ đơn giản này kiểm tra xem {{domxref("GamepadButton.value")}} của nút có lớn hơn `0` không, hoặc thuộc tính {{domxref("GamepadButton.pressed")}} có cho biết nút đã được nhấn không.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng Gamepad API](/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API)
