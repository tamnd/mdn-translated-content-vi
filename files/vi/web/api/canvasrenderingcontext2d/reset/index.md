---
title: "CanvasRenderingContext2D: phương thức reset()"
short-title: cài lại()
slug: Web/API/CanvasRenderingContext2D/reset
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.reset
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.reset()`** của API Canvas 2D đặt lại ngữ cảnh hiển thị về trạng thái mặc định, cho phép nó được sử dụng lại để vẽ nội dung khác mà không cần phải đặt lại rõ ràng tất cả các thuộc tính.

Việc đặt lại sẽ xóa bộ đệm sao lưu, ngăn xếp trạng thái vẽ, mọi đường dẫn và kiểu đã xác định. Điều này bao gồm ma trận [transformation](/en-US/docs/Web/API/CanvasRenderingContext2D#transformations) hiện tại, thuộc tính [compositing](/en-US/docs/Web/API/CanvasRenderingContext2D#compositing), vùng cắt, danh sách gạch ngang,[line styles](/en-US/docs/Web/API/CanvasRenderingContext2D#line_styles),[text styles](/en-US/docs/Web/API/CanvasRenderingContext2D#text_styles),[shadows](/en-US/docs/Web/API/CanvasRenderingContext2D#shadows),[image smoothing](/en-US/docs/Web/API/CanvasRenderingContext2D#image_smoothing),[filters](/en-US/docs/Web/API/CanvasRenderingContext2D#filters), v.v.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy cách chúng ta có thể sử dụng `reset()` để xóa hoàn toàn bối cảnh trước khi vẽ lại.

Đầu tiên chúng ta xác định một nút và một khung vẽ.

```css
#toggle-reset {
  display: block;
}
```

```html
<button id="toggle-reset">Toggle</button>
<canvas id="my-house" width="500" height="200"></canvas>
```

Đầu tiên, mã sẽ nhận được bối cảnh `2d` cho canvas. Sau đó, nó xác định các hàm có thể sử dụng ngữ cảnh để vẽ hình chữ nhật và hình tròn tương ứng.

```js
// Get the 2d context
const canvas = document.getElementById("my-house");
const ctx = canvas.getContext("2d");

function drawRect() {
  // Set line width
  ctx.lineWidth = 10;

  // Stroke rect outline
  ctx.strokeRect(50, 50, 150, 100);

  // Create filled text
  ctx.font = "50px serif";
  ctx.fillText("Rect!", 70, 110);
}

function drawCircle() {
  // Set line width
  ctx.lineWidth = 5;

  // Stroke out circle
  ctx.beginPath();
  ctx.arc(300, 100, 50, 0, 2 * Math.PI);
  ctx.stroke();

  // Create filled text
  ctx.font = "25px sans-serif";
  ctx.fillText("Circle!", 265, 100);
}
```

Sau đó chúng ta vẽ hình chữ nhật bằng chức năng của nó. Nút chuyển đổi vẽ hình tròn và hình chữ nhật. Lưu ý cách gọi `reset()` trước khi vẽ để xóa ngữ cảnh.

```js
drawRect();

// Toggle between circle and rectangle using button
let toggle = true;
const myButton = document.getElementById("toggle-reset");

myButton.addEventListener("click", () => {
  ctx.reset(); // Clear the context!
  if (toggle) {
    drawCircle();
  } else {
    drawRect();
  }
  toggle = !toggle;
});
```

Kết quả trông như thế này:

{{EmbedLiveSample("Examples", 500, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
