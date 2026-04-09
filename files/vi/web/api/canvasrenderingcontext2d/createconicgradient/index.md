---
title: "CanvasRenderingContext2D: phương thức createConicGradient()"
short-title: createConicGradient()
slug: Web/API/CanvasRenderingContext2D/createConicGradient
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.createConicGradient
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.createConicGradient()`** của API Canvas 2D tạo dải màu xung quanh một điểm có tọa độ nhất định.

Phương thức này trả về một hình nón {{domxref("CanvasGradient")}}. Để áp dụng cho một hình dạng, trước tiên gradient phải được gán cho thuộc tính {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hoặc {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}.

> [!LƯU Ý]
> Tọa độ gradient có tính toàn cục, tức là liên quan đến không gian tọa độ hiện tại. Khi áp dụng cho một hình dạng, tọa độ KHÔNG liên quan đến tọa độ của hình dạng đó.

## Cú pháp

```js-nolint
createConicGradient(startAngle, x, y)
```

### Tham số

- `startAngle`
- : Góc bắt đầu chuyển màu, tính bằng radian. Góc bắt đầu từ một đường thẳng nằm ngang ngay từ tâm và tiến hành theo chiều kim đồng hồ.
- `x`
- : Tọa độ trục x của tâm của gradient.
- `y`
- : Tọa độ trục y của tâm của gradient.

### Giá trị trả về

Hình nón {{domxref("CanvasGradient")}}.

## Ví dụ

### Tô hình chữ nhật bằng gradient hình nón

Ví dụ này khởi tạo một gradient hình nón bằng phương thức `createConicGradient()`. Sau đó, năm điểm dừng màu nằm giữa tọa độ trung tâm sẽ được tạo. Cuối cùng, gradient được gán cho bối cảnh canvas và được hiển thị thành hình chữ nhật được tô đầy.

#### HTML

```html
<canvas id="canvas" width="240" height="240"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create a conic gradient
// The start angle is 0
// The center position is 100, 100
const gradient = ctx.createConicGradient(0, 100, 100);

// Add five color stops
gradient.addColorStop(0, "red");
gradient.addColorStop(0.25, "orange");
gradient.addColorStop(0.5, "yellow");
gradient.addColorStop(0.75, "green");
gradient.addColorStop(1, "blue");

// Set the fill style and draw a rectangle
ctx.fillStyle = gradient;
ctx.fillRect(20, 20, 200, 200);
```

#### Kết quả hình chữ nhật

{{ EmbedLiveSample('Filling_a_rectangle_with_a_conic_gradient', 240, 240) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasGradient")}}
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
