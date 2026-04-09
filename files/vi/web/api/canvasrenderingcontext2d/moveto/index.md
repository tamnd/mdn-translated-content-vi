---
title: "CanvasRenderingContext2D: phương thức moveTo()"
short-title: di chuyển tới()
slug: Web/API/CanvasRenderingContext2D/moveTo
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.moveTo
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.moveTo()`** của API Canvas 2D bắt đầu một đường dẫn phụ mới tại điểm được chỉ định bởi tọa độ`(x, y)` đã cho.

## Cú pháp

```js-nolint
moveTo(x, y)
```

### Tham số

- `x`
- : Tọa độ trục x (ngang) của điểm.
- `y`
- : Tọa độ trục y (dọc) của điểm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Tạo nhiều đường dẫn phụ

Ví dụ này sử dụng `moveTo()`để tạo hai đường dẫn phụ trong một đường dẫn duy nhất. Sau đó, cả hai đường dẫn phụ đều được hiển thị bằng một lệnh gọi`stroke()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Dòng đầu tiên bắt đầu ở (50, 50) và kết thúc ở (200, 50). Dòng thứ hai bắt đầu ở (50, 90\) và kết thúc ở (280, 120).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.moveTo(50, 50); // Begin first sub-path
ctx.lineTo(200, 50);
ctx.moveTo(50, 90); // Begin second sub-path
ctx.lineTo(280, 120);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Creating_multiple_sub-paths', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.lineTo()")}}
- {{domxref("CanvasRenderingContext2D.stroke()")}}
