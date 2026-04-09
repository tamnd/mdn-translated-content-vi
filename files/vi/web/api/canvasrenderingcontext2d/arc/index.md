---
title: "CanvasRenderingContext2D: phương thức arc()"
short-title: arc()
slug: Web/API/CanvasRenderingContext2D/arc
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.arc
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.arc()`** của [Canvas 2D API](/en-US/docs/Web/API/CanvasRenderingContext2D) thêm một cung tròn vào đường dẫn con hiện tại.

## Cú pháp

```js-nolint
arc(x, y, radius, startAngle, endAngle)
arc(x, y, radius, startAngle, endAngle, counterclockwise)
```

Phương pháp `arc()`tạo cung tròn có tâm tại`(x, y)`
có bán kính `radius`. Đường dẫn bắt đầu tại`startAngle`, kết thúc
tại `endAngle` và di chuyển theo hướng cho bởi
`counterclockwise` (mặc định theo chiều kim đồng hồ).

### Tham số

- `x`
- : Tọa độ ngang của tâm cung tròn.
- `y`
- : Tọa độ dọc của tâm cung tròn.
- `radius`
- : Bán kính của cung tròn. Phải là số dương.
- `startAngle`
- : Góc tại đó cung bắt đầu tính bằng radian, được đo từ trục x dương.
- `endAngle`
- : Góc tại đó cung kết thúc tính bằng radian, được đo từ trục x dương.
- `counterclockwise` {{optional_inline}}
- : Một giá trị boolean tùy chọn. Nếu `true`, vẽ cung
  ngược chiều kim đồng hồ giữa góc đầu và góc cuối. Mặc định là `false`
  (theo chiều kim đồng hồ).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Vẽ một vòng tròn đầy đủ

Ví dụ này vẽ một vòng tròn hoàn chỉnh bằng phương thức `arc()`.

#### HTML

```html
<canvas></canvas>
```

#### JavaScript

Cung có tọa độ x là 100, tọa độ y là 75 và bán kính là 50.
tạo một vòng tròn đầy đủ, cung bắt đầu ở góc 0 radian (0°), và
kết thúc ở một góc 2π radian (360°).

```js
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.arc(100, 75, 50, 0, 2 * Math.PI);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Drawing_a_full_circle', 700, 180) }}

### Các hình dạng khác nhau được thể hiện

Ví dụ này vẽ nhiều hình dạng khác nhau để thể hiện những gì có thể làm được với `arc()`.

```html hidden
<canvas width="150" height="200"></canvas>
```

```js
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

// Draw shapes
for (let i = 0; i <= 3; i++) {
  for (let j = 0; j <= 2; j++) {
    ctx.beginPath();
    let x = 25 + j * 50; // x coordinate
    let y = 25 + i * 50; // y coordinate
    let radius = 20; // Arc radius
    let startAngle = 0; // Starting point on circle
    let endAngle = Math.PI + (Math.PI * j) / 2; // End point on circle
    let counterclockwise = i % 2 === 1; // Draw counterclockwise

    ctx.arc(x, y, radius, startAngle, endAngle, counterclockwise);

    if (i > 1) {
      ctx.fill();
    } else {
      ctx.stroke();
    }
  }
}
```

#### Kết quả

{{EmbedLiveSample('Different_shapes_demonstrated', "", "210")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- Dùng {{domxref("CanvasRenderingContext2D.ellipse()")}} vẽ cung tròn elip.
