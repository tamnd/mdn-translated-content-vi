---
title: "CanvasRenderingContext2D: phương thức bezierCurveTo()"
short-title: bezierCurveTo()
slug: Web/API/CanvasRenderingContext2D/bezierCurveTo
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.bezierCurveTo
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.bezierCurveTo()`** của API Canvas 2D thêm [Bézier curve](/en-US/docs/Glossary/Bezier_curve) khối vào hiện tại
đường dẫn con. Nó yêu cầu ba điểm: hai điểm đầu tiên là điểm kiểm soát và điểm thứ ba
là điểm cuối. Điểm bắt đầu là điểm mới nhất trong đường dẫn hiện tại, có thể
được thay đổi bằng cách sử dụng {{domxref("CanvasRenderingContext2D.moveTo", "moveTo()")}} trước
tạo đường cong Bézier.

## Cú pháp

```js-nolint
bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y)
```

### Tham số

- `cp1x`
- : Tọa độ trục x của điểm điều khiển đầu tiên.
- `cp1y`
- : Tọa độ trục y của điểm điều khiển đầu tiên.
- `cp2x`
- : Tọa độ trục x của điểm điều khiển thứ hai.
- `cp2y`
- : Tọa độ trục y của điểm điều khiển thứ hai.
- `x`
- : Tọa độ trục x của điểm cuối.
- `y`
- : Tọa độ trục y của điểm cuối.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Cách hoạt động của bezierCurveTo

Ví dụ này cho thấy cách vẽ đường cong Bézier bậc ba.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
// Define canvas and context
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Define the points as {x, y}
let start = { x: 50, y: 20 };
let cp1 = { x: 230, y: 30 };
let cp2 = { x: 150, y: 80 };
let end = { x: 250, y: 100 };

// Cubic Bézier curve
ctx.beginPath();
ctx.moveTo(start.x, start.y);
ctx.bezierCurveTo(cp1.x, cp1.y, cp2.x, cp2.y, end.x, end.y);
ctx.stroke();

// Start and end points
ctx.fillStyle = "blue";
ctx.beginPath();
ctx.arc(start.x, start.y, 5, 0, 2 * Math.PI); // Start point
ctx.arc(end.x, end.y, 5, 0, 2 * Math.PI); // End point
ctx.fill();

// Control points
ctx.fillStyle = "red";
ctx.beginPath();
ctx.arc(cp1.x, cp1.y, 5, 0, 2 * Math.PI); // Control point one
ctx.arc(cp2.x, cp2.y, 5, 0, 2 * Math.PI); // Control point two
ctx.fill();
```

#### Kết quả

Trong ví dụ này, các điểm kiểm soát có màu đỏ và
điểm bắt đầu và kết thúc có màu xanh.

{{ EmbedLiveSample('How_bezierCurveTo_works', 315, 165) }}

### Đường cong Bézier đơn giản

Ví dụ này vẽ đường cong Bézier đơn giản bằng `bezierCurveTo()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Đường cong bắt đầu tại điểm được chỉ định bởi `moveTo()`: (30, 30). đầu tiên
điểm kiểm soát được đặt tại (120, 160) và điểm thứ hai tại (180, 10). Đường cong kết thúc tại
(220, 140).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.moveTo(30, 30);
ctx.bezierCurveTo(120, 160, 180, 10, 220, 140);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('A_simple_Bézier_curve', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- [Bézier curve](/en-US/docs/Glossary/Bezier_curve)
