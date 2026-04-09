---
title: "CanvasRenderingContext2D: phương thức closePath()"
short-title: closePath()
slug: Web/API/CanvasRenderingContext2D/closePath
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.closePath
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.closePath()`** của API Canvas 2D cố gắng thêm một đường thẳng từ điểm hiện tại tới
điểm bắt đầu của đường dẫn con hiện tại. Nếu hình đã được đóng hoặc chỉ có một
điểm, chức năng này không làm gì cả.

Phương pháp này không vẽ trực tiếp bất cứ thứ gì lên canvas. Bạn có thể kết xuất đường dẫn bằng cách sử dụng
{{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}} hoặc
Phương pháp {{domxref("CanvasRenderingContext2D.fill()", "fill()")}}.

## Cú pháp

```js-nolint
closePath()
```

### Tham số

Không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đóng một hình tam giác

Ví dụ này tạo hai cạnh (chéo) đầu tiên của một tam giác bằng cách sử dụng
Phương pháp `lineTo()`. Sau đó, đáy của tam giác được tạo bằng
Phương pháp `closePath()`, tự động kết nối đầu tiên và cuối cùng của hình dạng
điểm.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Các góc của tam giác lần lượt là (20, 140), (120, 10) và (220, 140).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.moveTo(20, 140); // Move pen to bottom-left corner
ctx.lineTo(120, 10); // Line to top corner
ctx.lineTo(220, 140); // Line to bottom-right corner
ctx.closePath(); // Line to bottom-left corner
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Closing_a_triangle', 700, 180) }}

### Chỉ đóng một đường dẫn con

Ví dụ này vẽ một khuôn mặt cười bao gồm ba đường dẫn con bị ngắt kết nối.

> [!LƯU Ý]
> Mặc dù `closePath()` được gọi sau khi tất cả các cung đã được
> được tạo, chỉ cung cuối cùng (đường dẫn con) được đóng lại.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Hai cung đầu tiên tạo ra đôi mắt của khuôn mặt. Vòng cung cuối cùng tạo ra cái miệng.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.arc(240, 20, 40, 0, Math.PI);
ctx.moveTo(100, 20);
ctx.arc(60, 20, 40, 0, Math.PI);
ctx.moveTo(215, 80);
ctx.arc(150, 80, 65, 0, Math.PI);
ctx.closePath();
ctx.lineWidth = 6;
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Closing_just_one_sub-path', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.beginPath()")}}
