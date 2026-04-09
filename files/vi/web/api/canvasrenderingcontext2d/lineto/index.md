---
title: "CanvasRenderingContext2D: phương thức lineTo()"
short-title: dòngTo()
slug: Web/API/CanvasRenderingContext2D/lineTo
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.lineTo
---

{{APIRef("Canvas API")}}

Phương thức {{domxref("CanvasRenderingContext2D")}}**`lineTo()`**, một phần của Canvas 2D API, thêm một đường thẳng vào đường dẫn phụ hiện tại bằng cách kết nối điểm cuối cùng của đường dẫn phụ với tọa độ`(x, y)` đã chỉ định.

Giống như các phương thức khác sửa đổi đường dẫn hiện tại, phương thức này không trực tiếp hiển thị bất kỳ thứ gì. Để vẽ đường dẫn lên canvas, bạn có thể sử dụng các phương thức {{domxref("CanvasRenderingContext2D.fill", "fill()")}} hoặc {{domxref("CanvasRenderingContext2D.stroke", "stroke()")}}.

## Cú pháp

```js-nolint
lineTo(x, y)
```

### Tham số

- `x`
- : Tọa độ trục x của điểm cuối của đường.
- `y`
- : Tọa độ trục y của điểm cuối của đường.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Vẽ một đường thẳng

Ví dụ này vẽ một đường thẳng bằng phương pháp `lineTo()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Dòng bắt đầu ở (30, 50) và kết thúc ở (150, 100).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath(); // Start a new path
ctx.moveTo(30, 50); // Move the pen to (30, 50)
ctx.lineTo(150, 100); // Draw a line to (150, 100)
ctx.stroke(); // Render the path
```

#### Kết quả

{{ EmbedLiveSample('Drawing_a_straight_line', 700, 180) }}

### Vẽ các đường kết nối

Mỗi lệnh gọi `lineTo()`(và các phương thức tương tự) sẽ tự động thêm vào đường dẫn phụ hiện tại, điều đó có nghĩa là tất cả các dòng sẽ được vuốt hoặc điền vào cùng nhau. Ví dụ này vẽ một chữ cái 'M' bằng một đường liền kề.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.moveTo(90, 130);
ctx.lineTo(95, 25);
ctx.lineTo(150, 80);
ctx.lineTo(205, 25);
ctx.lineTo(210, 130);
ctx.lineWidth = 15;
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Drawing_connected_lines', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.moveTo()")}}
- {{domxref("CanvasRenderingContext2D.stroke()")}}
