---
title: "CanvasRenderingContext2D: phương thức ellipse()"
short-title: hình elip()
slug: Web/API/CanvasRenderingContext2D/ellipse
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.ellipse
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.ellipse()`** của API Canvas 2D thêm một vòng cung hình elip vào đường dẫn phụ hiện tại.

## Cú pháp

```js-nolint
ellipse(x, y, radiusX, radiusY, rotation, startAngle, endAngle)
ellipse(x, y, radiusX, radiusY, rotation, startAngle, endAngle, counterclockwise)
```

Phương thức `ellipse()`tạo một cung hình elip có tâm tại`(x, y)`với bán kính`radiusX`và`radiusY`. Đường dẫn bắt đầu tại`startAngle`và kết thúc tại`endAngle`và di chuyển theo hướng được cung cấp bởi`counterclockwise`(mặc định theo chiều kim đồng hồ).

### Tham số

- `x`
- : Tọa độ trục x (ngang) của tâm hình elip.
- `y`
- : Tọa độ trục y (dọc) của tâm hình elip.
- `radiusX`
- : Bán kính trục lớn của hình elip. Phải không âm.
- `radiusY`
- : Bán kính trục nhỏ của elip. Phải không âm.
- `rotation`
- : Góc quay của hình elip, tính bằng radian.
- `startAngle`
- : [eccentric angle](https://en.wikipedia.org/wiki/Angular_eccentricity) nơi hình elip bắt đầu, được đo theo chiều kim đồng hồ từ trục x dương
  và biểu thị bằng radian.
- `endAngle`
- : [eccentric angle](https://en.wikipedia.org/wiki/Angular_eccentricity) tại đó hình elip kết thúc, được đo theo chiều kim đồng hồ từ trục x dương và
  được biểu thị bằng radian.
- `counterclockwise`{{optional_inline}}
- : Một giá trị boolean tùy chọn, nếu `true`, sẽ vẽ hình elip
  ngược chiều kim đồng hồ (ngược chiều kim đồng hồ). Giá trị mặc định là `false`(theo chiều kim đồng hồ).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Vẽ một hình elip đầy đủ

Ví dụ này vẽ một hình elip ở một góc π/4 radian (45°). Để tạo một hình elip đầy đủ, cung bắt đầu ở góc 0 radian (0°) và kết thúc ở góc 2π radian (360°).

#### HTML

```html
<canvas id="canvas" width="200" height="200"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Draw the ellipse
ctx.beginPath();
ctx.ellipse(100, 100, 50, 75, Math.PI / 4, 0, 2 * Math.PI);
ctx.stroke();

// Draw the ellipse's line of reflection
ctx.beginPath();
ctx.setLineDash([5, 5]);
ctx.moveTo(0, 200);
ctx.lineTo(200, 0);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Drawing_a_full_ellipse', 700, 250) }}

### Các cung hình elip khác nhau

Ví dụ này tạo ra ba đường dẫn hình elip với các thuộc tính khác nhau.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.fillStyle = "red";
ctx.beginPath();
ctx.ellipse(60, 75, 50, 30, Math.PI * 0.25, 0, Math.PI * 1.5);
ctx.fill();

ctx.fillStyle = "blue";
ctx.beginPath();
ctx.ellipse(150, 75, 50, 30, Math.PI * 0.25, 0, Math.PI);
ctx.fill();

ctx.fillStyle = "green";
ctx.beginPath();
ctx.ellipse(240, 75, 50, 30, Math.PI * 0.25, 0, Math.PI, true);
ctx.fill();
```

#### Kết quả

{{ EmbedLiveSample('Various_elliptical_arcs', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- Sử dụng {{domxref("CanvasRenderingContext2D.arc()")}} để vẽ cung tròn
