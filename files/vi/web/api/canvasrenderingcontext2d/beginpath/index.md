---
title: "CanvasRenderingContext2D: phương thức beginPath()"
short-title: beginPath()
slug: Web/API/CanvasRenderingContext2D/beginPath
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.beginPath
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.beginPath()`** của API Canvas 2D bắt đầu một đường dẫn mới bằng cách làm trống danh sách các đường dẫn con. Gọi
phương thức này khi bạn muốn tạo một đường dẫn mới.

> [!LƯU Ý]
> Để tạo một đường dẫn con mới, tức là một đường dẫn phù hợp với đường dẫn hiện tại
> trạng thái canvas, bạn có thể sử dụng {{domxref("CanvasRenderingContext2D.moveTo()")}}.

## Cú pháp

```js-nolint
beginPath()
```

### Tham số

Không.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Tạo đường dẫn riêng biệt

Ví dụ này tạo ra hai đường dẫn, mỗi đường dẫn chứa một dòng.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Phương thức `beginPath()` được gọi trước khi bắt đầu mỗi dòng, để chúng
có thể được vẽ bằng các màu khác nhau.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// First path
ctx.beginPath();
ctx.strokeStyle = "blue";
ctx.moveTo(20, 20);
ctx.lineTo(200, 20);
ctx.stroke();

// Second path
ctx.beginPath();
ctx.strokeStyle = "green";
ctx.moveTo(20, 20);
ctx.lineTo(120, 120);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Creating_distinct_paths', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.closePath()")}}
