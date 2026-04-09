---
title: "CanvasRenderingContext2D: phương thức createRadialGradient()"
short-title: createRadialGradient()
slug: Web/API/CanvasRenderingContext2D/createRadialGradient
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.createRadialGradient
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.createRadialGradient()`** của API Canvas 2D tạo ra một gradient xuyên tâm bằng cách sử dụng kích thước và tọa độ của
hai vòng tròn.

Phương thức này trả về {{domxref("CanvasGradient")}}. Để được áp dụng cho một hình dạng,
gradient trước tiên phải được gán cho thuộc tính {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hoặc {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}.

> [!LƯU Ý]
> Tọa độ gradient có tính toàn cục, tức là liên quan đến tọa độ hiện tại
> không gian tọa độ. Khi áp dụng cho một hình dạng, tọa độ KHÔNG liên quan đến
> tọa độ của hình dạng.

## Cú pháp

```js-nolint
createRadialGradient(x0, y0, r0, x1, y1, r1)
```

Phương pháp `createRadialGradient()` được chỉ định bởi sáu tham số, ba
xác định vòng tròn bắt đầu của gradient và ba xác định vòng tròn kết thúc.

### Tham số

- `x0`
- : Tọa độ trục x của vòng tròn bắt đầu.
- `y0`
- : Tọa độ trục y của vòng tròn bắt đầu.
- `r0`
- : Bán kính của đường tròn xuất phát. Phải không âm và hữu hạn.
- `x1`
- : Tọa độ trục x của đường tròn cuối.
- `y1`
- : Tọa độ trục y của đường tròn cuối.
- `r1`
- : Bán kính của đường tròn cuối. Phải không âm và hữu hạn.

### Giá trị trả về

Một {{domxref("CanvasGradient")}} hướng tâm được khởi tạo với hai vòng tròn được chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
- : Được ném khi các giá trị không hữu hạn được truyền vào tham số.
- `IndexSizeError` {{domxref("DOMException")}}
- : Được ném khi bán kính âm được truyền vào tham số.

## Ví dụ

### Tô hình chữ nhật bằng gradient xuyên tâm

Ví dụ này khởi tạo một gradient xuyên tâm bằng cách sử dụng
Phương pháp `createRadialGradient()`. Ba điểm dừng màu giữa hai điểm dừng của gradient
vòng tròn sau đó được tạo ra. Cuối cùng, độ dốc được gán cho bối cảnh canvas và
được hiển thị thành một hình chữ nhật đầy.

#### HTML

```html
<canvas id="canvas" width="200" height="200"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create a radial gradient
// The inner circle is at x=110, y=90, with radius=30
// The outer circle is at x=100, y=100, with radius=70
const gradient = ctx.createRadialGradient(110, 90, 30, 100, 100, 70);

// Add three color stops
gradient.addColorStop(0, "pink");
gradient.addColorStop(0.9, "white");
gradient.addColorStop(1, "green");

// Set the fill style and draw a rectangle
ctx.fillStyle = gradient;
ctx.fillRect(20, 20, 160, 160);
```

#### Kết quả

{{ EmbedLiveSample('Filling_a_rectangle_with_a_radial_gradient', 700, 240) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
- {{domxref("CanvasRenderingContext2D.createConicGradient()")}}
