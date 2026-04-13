---
title: "CanvasPattern: phương thức setTransform()"
short-title: setTransform()
slug: Web/API/CanvasPattern/setTransform
page-type: web-api-instance-method
browser-compat: api.CanvasPattern.setTransform
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`CanvasPattern.setTransform()`** dùng một đối tượng {{domxref("DOMMatrix")}} làm ma trận biến đổi của mẫu và áp dụng nó lên mẫu.

## Cú pháp

```js-nolint
setTransform(matrix)
```

### Tham số

- `matrix`
  - : Một {{domxref("DOMMatrix")}} dùng làm ma trận biến đổi của pattern.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dùng phương thức `setTransform`

Đây là một đoạn mã mẫu dùng phương thức `setTransform` để tạo một {{domxref("CanvasPattern")}} với phép biến đổi mẫu được chỉ định từ một {{domxref("DOMMatrix")}}. Mẫu sẽ được áp dụng nếu bạn đặt nó làm {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hiện tại và sẽ được vẽ lên canvas khi dùng phương thức {{domxref("CanvasRenderingContext2D.fillRect", "fillRect()")}}, chẳng hạn.

```html live-sample___canvas
<canvas id="canvas"></canvas>
```

```js live-sample___canvas
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const matrix = new DOMMatrix([1, 0.2, 0.8, 1, 0, 0]);

const img = new Image();
img.src = "canvas_create_pattern.png";

img.onload = () => {
  const pattern = ctx.createPattern(img, "repeat");
  pattern.setTransform(matrix.rotate(-45).scale(1.5));
  ctx.fillStyle = pattern;
  ctx.fillRect(0, 0, 400, 400);
};
```

{{EmbedLiveSample('canvas', , 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này: {{domxref("CanvasPattern")}}
- {{domxref("DOMMatrix")}}
