---
title: "CanvasRenderingContext2D: phương thức xoay ()"
short-title: quay()
slug: Web/API/CanvasRenderingContext2D/rotate
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.rotate
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.rotate()`** của API Canvas 2D thêm phép xoay vào ma trận chuyển đổi.

## Cú pháp

```js-nolint
rotate(angle)
```

![Rectangular coordinate system with the rotation of the abscissa axis by the alpha angle](canvas_grid_rotate.png)

### Tham số

- `angle`
  - : Góc quay, theo chiều kim đồng hồ tính bằng radian. Bạn có thể sử dụng
    `degree * Math.PI / 180`để tính radian từ độ.

Điểm trung tâm xoay luôn là gốc canvas. Để thay đổi điểm trung tâm, bạn sẽ cần di chuyển canvas bằng phương thức{{domxref("CanvasRenderingContext2D.translate", "translate()")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xoay một hình dạng

Ví dụ này xoay một hình chữ nhật 45°. Lưu ý rằng tâm xoay là góc trên cùng bên trái của khung vẽ chứ không phải là vị trí tương ứng với bất kỳ hình dạng nào.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Point of transform origin
ctx.arc(0, 0, 5, 0, 2 * Math.PI);
ctx.fillStyle = "blue";
ctx.fill();

// Non-rotated rectangle
ctx.fillStyle = "gray";
ctx.fillRect(100, 0, 80, 20);

// Rotated rectangle
ctx.rotate((45 * Math.PI) / 180);
ctx.fillStyle = "red";
ctx.fillRect(100, 0, 80, 20);

// Reset transformation matrix to the identity matrix
ctx.setTransform(1, 0, 0, 1, 0, 0);
```

#### Kết quả

Tâm quay có màu xanh lam. Hình chữ nhật không xoay có màu xám và hình chữ nhật xoay có màu đỏ.

{{ EmbedLiveSample('Rotating_a_shape', 700, 180) }}

### Xoay một hình xung quanh tâm của nó

Ví dụ này xoay một hình xung quanh điểm trung tâm của nó. Để thực hiện việc này, các bước sau được áp dụng cho ma trận:

1. Đầu tiên,{{domxref("CanvasRenderingContext2D.translate()", "translate()")}}di chuyển
   gốc của ma trận tới tâm của hình.
2. `rotate()`xoay ma trận theo số lượng mong muốn.
3. Cuối cùng,`translate()`di chuyển điểm gốc của ma trận trở lại điểm bắt đầu
   điểm. Điều này được thực hiện bằng cách áp dụng các giá trị tọa độ tâm của hình theo hướng âm.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Hình này là một hình chữ nhật có các góc ở (80, 60), chiều rộng 140, chiều cao 30. Tâm ngang của nó là (80 + 140/2) hoặc 150. Tâm dọc của nó là (60 + 30/2\) hoặc 75. Do đó, tâm nằm ở (150, 75).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Non-rotated rectangle
ctx.fillStyle = "gray";
ctx.fillRect(80, 60, 140, 30);

// Matrix transformation
ctx.translate(150, 75);
ctx.rotate(Math.PI / 2);
ctx.translate(-150, -75);

// Rotated rectangle
ctx.fillStyle = "red";
ctx.fillRect(80, 60, 140, 30);
```

#### Kết quả

Hình chữ nhật không xoay có màu xám và hình chữ nhật xoay có màu đỏ.

{{ EmbedLiveSample('Rotating_a_shape_around_its_center', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
