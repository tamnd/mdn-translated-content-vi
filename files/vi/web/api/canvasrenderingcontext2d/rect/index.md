---
title: "CanvasRenderingContext2D: phương thức trực tràng()"
short-title: trực tràng()
slug: Web/API/CanvasRenderingContext2D/rect
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.rect
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.rect()`** của API Canvas 2D thêm hình chữ nhật vào đường dẫn hiện tại.

Giống như các phương thức khác sửa đổi đường dẫn hiện tại, phương thức này không trực tiếp hiển thị bất kỳ thứ gì. Để vẽ hình chữ nhật lên canvas, bạn có thể sử dụng các phương thức {{domxref("CanvasRenderingContext2D.fill", "fill()")}} hoặc {{domxref("CanvasRenderingContext2D.stroke", "stroke()")}}.

> [!LƯU Ý]
> Để vừa tạo và hiển thị hình chữ nhật trong một bước, hãy sử dụng
> {{domxref("CanvasRenderingContext2D.fillRect", "fillRect()")}} hoặc
> các phương thức {{domxref("CanvasRenderingContext2D.strokeRect", "strokeRect()")}}.

## Cú pháp

```js-nolint
rect(x, y, width, height)
```

Phương thức `rect()`tạo một đường dẫn hình chữ nhật có điểm bắt đầu là`(x, y)`và có kích thước được chỉ định bởi`width`và`height`.

### Tham số

- `x`
- : Tọa độ trục x của điểm bắt đầu của hình chữ nhật.
- `y`
- : Tọa độ trục y của điểm bắt đầu của hình chữ nhật.
- `width`
- : Chiều rộng của hình chữ nhật. Giá trị dương ở bên phải và âm ở bên trái.
- `height`
- : Chiều cao của hình chữ nhật. Giá trị dương giảm, giá trị âm tăng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Vẽ hình chữ nhật

Ví dụ này tạo một đường dẫn hình chữ nhật bằng phương thức `rect()`. Đường dẫn sau đó được hiển thị bằng phương thức`fill()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Góc của hình chữ nhật nằm ở (10, 20). Nó có chiều rộng 150 và chiều cao 100\.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.beginPath(); // Start a new path
ctx.rect(10, 20, 150, 100); // Add a rectangle to the current path
ctx.fill(); // Render the path
```

#### Kết quả

{{ EmbedLiveSample('Drawing_a_rectangle', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.fillRect")}}
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
- {{domxref("CanvasRenderingContext2D.fill()")}}
- {{domxref("CanvasRenderingContext2D.stroke()")}}
