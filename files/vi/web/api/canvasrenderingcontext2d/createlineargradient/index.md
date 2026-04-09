---
title: "CanvasRenderingContext2D: phương thức createLinearGradient()"
short-title: createLinearGradient()
slug: Web/API/CanvasRenderingContext2D/createLinearGradient
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.createLinearGradient
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.createLinearGradient()`** của API Canvas 2D tạo một dải màu dọc theo đường nối hai điểm đã cho
tọa độ.

! [The gradient transitions colors along the gradient line, starting at point x0, y0 and going to x1, y1, even if those points extend the gradient line beyond the edges of the element on which the gradient is drawn.](mdn-canvas-lineargradient.png)

Phương thức này trả về {{domxref("CanvasGradient")}} tuyến tính. Để áp dụng cho một hình dạng,
gradient trước tiên phải được gán cho
{{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hoặc
Thuộc tính {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}.

> [!LƯU Ý]
> Tọa độ gradient có tính toàn cục, tức là liên quan đến tọa độ hiện tại
> không gian tọa độ. Khi áp dụng cho một hình dạng, tọa độ KHÔNG liên quan đến
> tọa độ của hình dạng.

## Cú pháp

```js-nolint
createLinearGradient(x0, y0, x1, y1)
```

Phương thức `createLinearGradient()` được chỉ định bởi bốn tham số xác định
điểm đầu và điểm cuối của đường gradient.

### Tham số

- `x0`
- : Tọa độ trục x của điểm bắt đầu.
- `y0`
- : Tọa độ trục y của điểm bắt đầu.
- `x1`
- : Tọa độ trục x của điểm cuối.
- `y1`
- : Tọa độ trục y của điểm cuối.

### Giá trị trả về

{{domxref("CanvasGradient")}} tuyến tính được khởi tạo với dòng được chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
- : Được ném khi các giá trị không hữu hạn được truyền dưới dạng tham số.

## Ví dụ

### Tô hình chữ nhật bằng gradient tuyến tính

Ví dụ này khởi tạo một gradient tuyến tính bằng cách sử dụng
Phương pháp `createLinearGradient()`. Ba điểm dừng màu giữa gradient
điểm bắt đầu và điểm kết thúc sau đó được tạo ra. Cuối cùng, gradient được gán cho canvas
bối cảnh và được hiển thị thành một hình chữ nhật đầy.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create a linear gradient
// The start gradient point is at x=20, y=0
// The end gradient point is at x=220, y=0
const gradient = ctx.createLinearGradient(20, 0, 220, 0);

// Add three color stops
gradient.addColorStop(0, "green");
gradient.addColorStop(0.5, "cyan");
gradient.addColorStop(1, "green");

// Set the fill style and draw a rectangle
ctx.fillStyle = gradient;
ctx.fillRect(20, 20, 200, 100);
```

#### Kết quả

{{ EmbedLiveSample('Filling_a_rectangle_with_a_linear_gradient', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
- {{domxref("CanvasRenderingContext2D.createConicGradient()")}}
