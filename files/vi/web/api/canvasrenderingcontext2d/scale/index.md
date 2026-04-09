---
title: "CanvasRenderingContext2D: phương thức tỉ lệ ()"
short-title: tỉ lệ()
slug: Web/API/CanvasRenderingContext2D/scale
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.scale
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.scale()`** của API Canvas 2D thêm phép chuyển đổi tỷ lệ cho các đơn vị canvas theo chiều ngang và/hoặc chiều dọc.

Theo mặc định, một đơn vị trên khung vẽ chính xác là một pixel. Một phép biến đổi tỷ lệ sẽ sửa đổi hành vi này. Ví dụ: hệ số tỷ lệ 0,5 dẫn đến kích thước đơn vị là 0,5 pixel; do đó hình dạng được vẽ ở một nửa kích thước bình thường. Tương tự, hệ số tỷ lệ là 2,0 sẽ tăng kích thước đơn vị sao cho một đơn vị trở thành hai pixel; do đó hình dạng được vẽ ở kích thước gấp đôi bình thường.

## Cú pháp

```js-nolint
scale(x, y)
```

### Tham số

- `x`
  - : Hệ số tỷ lệ theo hướng ngang. Giá trị âm lật các pixel trên
    trục dọc. Giá trị`1`dẫn đến không có tỷ lệ theo chiều ngang.
- `y`
  - : Hệ số tỷ lệ theo hướng thẳng đứng. Giá trị âm lật các pixel trên
    trục ngang. Giá trị`1`dẫn đến không có tỷ lệ dọc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Chia tỷ lệ một hình dạng

Ví dụ này vẽ một hình chữ nhật có tỷ lệ. Sau đó, một hình chữ nhật không có tỷ lệ sẽ được vẽ để so sánh.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Hình chữ nhật có chiều rộng được chỉ định là 8 và chiều cao là 20. Ma trận biến đổi chia tỷ lệ cho nó là 9x theo chiều ngang và 3x theo chiều dọc. Do đó, kích thước cuối cùng của nó là chiều rộng 72 và chiều cao 60.

Lưu ý rằng vị trí của nó trên khung vẽ cũng thay đổi. Vì góc được chỉ định của nó là (10, 10\), góc được hiển thị của nó sẽ trở thành (90, 30).

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Scaled rectangle
ctx.scale(9, 3);
ctx.fillStyle = "red";
ctx.fillRect(10, 10, 8, 20);

// Reset current transformation matrix to the identity matrix
ctx.setTransform(1, 0, 0, 1, 0, 0);

// Non-scaled rectangle
ctx.fillStyle = "gray";
ctx.fillRect(10, 10, 8, 20);
```

#### Kết quả

Hình chữ nhật được chia tỷ lệ có màu đỏ và hình chữ nhật không được chia tỷ lệ có màu xám.

{{ EmbedLiveSample('Scaling_a_shape', 700, 180) }}

### Lật đồ vật theo chiều ngang hoặc chiều dọc

Bạn có thể sử dụng`scale(-1, 1)`để lật ngữ cảnh theo chiều ngang và`scale(1, -1)`để lật ngữ cảnh theo chiều dọc. Trong ví dụ này, dòng chữ "Xin chào thế giới!" được lật ngang.

Lưu ý rằng lệnh gọi tới{{domxref("CanvasRenderingContext2D.fillText()", "fillText()")}}chỉ định tọa độ x âm. Điều này nhằm điều chỉnh hệ số tỷ lệ âm:`-280 * -1`trở thành`280`và văn bản được vẽ sang trái từ điểm đó.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.scale(-1, 1);
ctx.font = "48px serif";
ctx.fillText("Hello world!", -280, 90);
ctx.setTransform(1, 0, 0, 1, 0, 0);
```

#### Kết quả

{{ EmbedLiveSample('Flipping_things_horizontally_or_vertically', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
