---
title: "CanvasRenderingContext2D: phương thức resetTransform()"
short-title: resetTransform()
slug: Web/API/CanvasRenderingContext2D/resetTransform
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.resetTransform
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.resetTransform()`** của API Canvas 2D đặt lại phép biến đổi hiện tại thành ma trận nhận dạng.

## Cú pháp

```js-nolint
resetTransform()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đặt lại ma trận

Ví dụ này vẽ một hình chữ nhật xoay sau khi sửa đổi ma trận và sau đó đặt lại ma trận bằng phương thức`resetTransform()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Phương thức{{domxref("CanvasRenderingContext2D.rotate()", "rotate()")}}xoay ma trận biến đổi 45°. Phương thức{{domxref("CanvasRenderingContext2D.fillRect()", "fillRect()")}}vẽ một hình chữ nhật được tô màu, được điều chỉnh theo ma trận đó.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Draw a rotated rectangle
ctx.rotate((45 * Math.PI) / 180);
ctx.fillRect(60, 0, 100, 30);

// Reset transformation matrix to the identity matrix
ctx.resetTransform();
```

#### Kết quả

{{ EmbedLiveSample('Resetting_the_matrix', 700, 180) }}

### Tiếp tục với ma trận chính quy

Bất cứ khi nào bạn vẽ xong các hình dạng đã biến đổi, bạn nên gọi`resetTransform()`trước khi hiển thị bất kỳ thứ gì khác. Trong ví dụ này, hai hình đầu tiên được vẽ bằng phép biến đổi nghiêng và hai hình cuối được vẽ bằng phép biến đổi đồng nhất (thông thường).

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Skewed rectangles
ctx.transform(1, 0, 1.7, 1, 0, 0);
ctx.fillStyle = "gray";
ctx.fillRect(40, 40, 50, 20);
ctx.fillRect(40, 90, 50, 20);

// Non-skewed rectangles
ctx.resetTransform();
ctx.fillStyle = "red";
ctx.fillRect(40, 40, 50, 20);
ctx.fillRect(40, 90, 50, 20);
```

#### Kết quả

Các hình chữ nhật nghiêng có màu xám và các hình chữ nhật không nghiêng có màu đỏ.

{{ EmbedLiveSample('Continuing_with_a_regular_matrix', 700, 180) }}

## Polyfill

Bạn cũng có thể sử dụng phương thức{{domxref("CanvasRenderingContext2D.setTransform()", "setTransform()")}}để đặt lại phép biến đổi hiện tại thành ma trận nhận dạng, như sau:

```js
ctx.setTransform(1, 0, 0, 1, 0, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
