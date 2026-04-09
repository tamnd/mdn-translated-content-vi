---
title: "CanvasRenderingContext2D: phương thức StrokeRect()"
short-title: đột quỵRect()
slug: Web/API/CanvasRenderingContext2D/strokeRect
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.strokeRect
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.strokeRect()`** của API Canvas 2D vẽ một hình chữ nhật được viền (viền) theo{{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}hiện tại và các cài đặt ngữ cảnh khác.

Phương thức này vẽ trực tiếp vào khung vẽ mà không sửa đổi đường dẫn hiện tại, do đó, mọi lệnh gọi{{domxref("CanvasRenderingContext2D.fill()", "fill()")}}hoặc{{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}}tiếp theo sẽ không ảnh hưởng đến nó.

## Cú pháp

```js-nolint
strokeRect(x, y, width, height)
```

Phương thức`strokeRect()`vẽ một hình chữ nhật có nét có điểm bắt đầu là`(x, y)`và có kích thước được chỉ định bởi`width`và`height`.

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

### Một hình chữ nhật có nét vẽ đơn giản

Ví dụ này vẽ một hình chữ nhật có đường viền màu xanh lá cây bằng phương pháp`strokeRect()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Góc trên bên trái của hình chữ nhật nằm ở (20, 10). Nó có chiều rộng là 160 và chiều cao là 100\.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.strokeStyle = "green";
ctx.strokeRect(20, 10, 160, 100);
```

#### Kết quả

{{ EmbedLiveSample('A_simple_stroked_rectangle', 700, 180) }}

### Áp dụng các cài đặt ngữ cảnh khác nhau

Ví dụ này vẽ một hình chữ nhật có bóng đổ và các đường viền dày, vát cạnh.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.shadowColor = "#dd5533";
ctx.shadowBlur = 20;
ctx.lineJoin = "bevel";
ctx.lineWidth = 15;
ctx.strokeStyle = "#3388ff";
ctx.strokeRect(30, 30, 160, 90);
```

#### Kết quả

{{ EmbedLiveSample('Applying_various_context_settings', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.strokeStyle")}}
- {{domxref("CanvasRenderingContext2D.clearRect()")}}
- {{domxref("CanvasRenderingContext2D.fillRect()")}}
