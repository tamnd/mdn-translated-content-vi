---
title: "CanvasRenderingContext2D: phương thức fillRect()"
short-title: điềnRect()
slug: Web/API/CanvasRenderingContext2D/fillRect
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.fillRect
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.fillRect()`** của API Canvas 2D vẽ một hình chữ nhật được tô màu theo {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hiện tại.

Phương thức này vẽ trực tiếp vào khung vẽ mà không sửa đổi đường dẫn hiện tại, do đó, mọi lệnh gọi {{domxref("CanvasRenderingContext2D.fill()", "fill()")}} hoặc {{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}} tiếp theo sẽ không ảnh hưởng đến nó.

## Cú pháp

```js-nolint
fillRect(x, y, width, height)
```

Phương thức `fillRect()`vẽ một hình chữ nhật được tô màu có điểm bắt đầu là`(x, y)`và có kích thước được chỉ định bởi`width`và`height`. Kiểu điền được xác định bởi thuộc tính`fillStyle` hiện tại.

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

### Một hình chữ nhật đầy đơn giản

Ví dụ này vẽ một hình chữ nhật màu xanh lá cây bằng cách sử dụng phương thức `fillRect()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Góc trên bên trái của hình chữ nhật nằm ở (20, 10). Nó có chiều rộng 150 và chiều cao 100\.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.fillStyle = "green";
ctx.fillRect(20, 10, 150, 100);
```

#### Kết quả

{{ EmbedLiveSample('A_simple_filled_rectangle', 700, 180) }}

### Lấp đầy toàn bộ khung vẽ

Đoạn mã này lấp đầy toàn bộ khung vẽ bằng một hình chữ nhật. Điều này thường hữu ích để tạo nền, trên đó có thể vẽ những thứ khác. Để đạt được điều này, kích thước của hình chữ nhật được đặt bằng các thuộc tính `width`và`height` của phần tử {{HtmlElement("canvas")}}.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.fillRect(0, 0, canvas.width, canvas.height);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.fillStyle")}}
- {{domxref("CanvasRenderingContext2D.clearRect()")}}
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
