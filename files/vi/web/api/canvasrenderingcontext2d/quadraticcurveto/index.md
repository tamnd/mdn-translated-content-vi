---
title: "CanvasRenderingContext2D: phương thức bậc haiCurveTo()"
short-title: bậc haiCurveTo()
slug: Web/API/CanvasRenderingContext2D/quadraticCurveTo
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.quadraticCurveTo
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.quadraticCurveTo()`** của API Canvas 2D thêm [Bézier curve](/en-US/docs/Glossary/Bezier_curve) bậc hai vào đường dẫn phụ hiện tại. Nó yêu cầu hai điểm: điểm thứ nhất là điểm kiểm soát và điểm thứ hai là điểm cuối. Điểm bắt đầu là điểm mới nhất trong đường dẫn hiện tại, có thể thay đổi bằng cách sử dụng {{domxref("CanvasRenderingContext2D.moveTo", "moveTo()")}} trước khi tạo đường cong Bézier bậc hai.

## Cú pháp

```js-nolint
quadraticCurveTo(cpx, cpy, x, y)
```

### Tham số

- `cpx`
- : Tọa độ trục x của điểm điều khiển.
- `cpy`
- : Tọa độ trục y của điểm điều khiển.
- `x`
- : Tọa độ trục x của điểm cuối.
- `y`
- : Tọa độ trục y của điểm cuối.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Cách thức hoạt động của QuadraticCurveTo

Ví dụ này cho thấy cách vẽ đường cong Bézier bậc hai.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Quadratic Bézier curve
ctx.beginPath();
ctx.moveTo(50, 20);
ctx.quadraticCurveTo(230, 30, 50, 100);
ctx.stroke();

// Start and end points
ctx.fillStyle = "blue";
ctx.beginPath();
ctx.arc(50, 20, 5, 0, 2 * Math.PI); // Start point
ctx.arc(50, 100, 5, 0, 2 * Math.PI); // End point
ctx.fill();

// Control point
ctx.fillStyle = "red";
ctx.beginPath();
ctx.arc(230, 30, 5, 0, 2 * Math.PI);
ctx.fill();
```

#### Kết quả

Trong ví dụ này, điểm kiểm soát có màu đỏ và điểm bắt đầu và điểm kết thúc có màu xanh lam.

{{ EmbedLiveSample('How_quadraticCurveTo_works', 315, 165) }}

### Đường cong bậc hai đơn giản

Ví dụ này vẽ đường cong Bézier bậc hai đơn giản bằng cách sử dụng `quadraticCurveTo()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Đường cong bắt đầu tại điểm được chỉ định bởi `moveTo()`: (20, 110). Điểm kiểm soát được đặt ở (230, 150). Đường cong kết thúc tại (250, 20).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.moveTo(20, 110);
ctx.quadraticCurveTo(230, 150, 250, 20);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('A_simple_quadratic_curve', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- [Bézier curve](/en-US/docs/Glossary/Bezier_curve)
