---
title: "CanvasRenderingContext2D: phương thức clearRect()"
short-title: clearRect()
slug: Web/API/CanvasRenderingContext2D/clearRect
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.clearRect
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.clearRect()`** của API Canvas 2D sẽ xóa các pixel trong vùng hình chữ nhật bằng cách đặt chúng thành
màu đen trong suốt.

> [!LƯU Ý]
> Cần lưu ý rằng `clearRect()` có thể gây ra các sự cố ngoài ý muốn
> tác dụng phụ nếu bạn không phải là [using paths properly](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_shapes#drawing_paths). Đảm bảo gọi
> {{domxref("CanvasRenderingContext2D.beginPath", "beginPath()")}} trước khi bắt đầu
> rút vật phẩm mới sau khi gọi `clearRect()`.

## Cú pháp

```js-nolint
clearRect(x, y, width, height)
```

Phương pháp `clearRect()` đặt các pixel trong vùng hình chữ nhật thành
minh bạch. Góc trên bên trái của hình chữ nhật nằm ở
`(x, y)`và kích thước của nó được chỉ định bởi`width` và
`height`.

### Tham số

- `x`
- : Tọa độ trục x của điểm bắt đầu hình chữ nhật.
- `y`
- : Tọa độ trục y của điểm bắt đầu hình chữ nhật.
- `width`
- : Chiều rộng của hình chữ nhật. Giá trị dương ở bên phải và âm ở bên trái.
- `height`
- : Chiều cao của hình chữ nhật. Giá trị dương giảm, giá trị âm tăng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa toàn bộ canvas

Đoạn mã này sẽ xóa toàn bộ khung vẽ. Điều này thường được yêu cầu khi bắt đầu
mỗi khung hình trong một hình ảnh động. Kích thước của vùng bị xóa được đặt bằng
{{HtmlElement("canvas")}} của phần tử `width`và`height`
thuộc tính.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.clearRect(0, 0, canvas.width, canvas.height);
```

### Xóa một phần canvas

Ví dụ này vẽ một hình tam giác màu xanh lam trên nền màu vàng. các
Phương pháp `clearRect()` sau đó sẽ xóa một phần canvas.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Vùng đã xóa có dạng hình chữ nhật, với góc trên bên trái là (10, 10). các
khu vực trống có chiều rộng 120 và chiều cao 100.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Draw yellow background
ctx.beginPath();
ctx.fillStyle = "#ffff66";
ctx.fillRect(0, 0, canvas.width, canvas.height);

// Draw blue triangle
ctx.beginPath();
ctx.fillStyle = "blue";
ctx.moveTo(20, 20);
ctx.lineTo(180, 20);
ctx.lineTo(130, 130);
ctx.closePath();
ctx.fill();

// Clear part of the canvas
ctx.clearRect(10, 10, 120, 100);
```

#### Kết quả

{{EmbedLiveSample('Erasing_part_of_a_canvas', 700, 180)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.fillRect()")}}
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
