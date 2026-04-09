---
title: "CanvasRenderingContext2D: thuộc tính ShadowOffsetY"
short-title: bóngOffsetY
slug: Web/API/CanvasRenderingContext2D/shadowOffsetY
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.shadowOffsetY
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.shadowOffsetY`** của API Canvas 2D chỉ định khoảng cách mà bóng sẽ được bù theo chiều dọc.

> [!LƯU Ý]
> Bóng chỉ được vẽ nếu
> Thuộc tính{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}được đặt thành
> một giá trị không minh bạch. Một trong những{{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}},
> Thuộc tính{{domxref("CanvasRenderingContext2D.shadowOffsetX", "shadowOffsetX")}}hoặc`shadowOffsetY`phải khác 0, vì
> tốt.

## Giá trị

Một float xác định khoảng cách mà bóng sẽ được bù theo chiều dọc. Giá trị dương giảm, giá trị âm tăng. Giá trị mặc định là`0`(không có offset dọc). Các giá trị{{jsxref("Infinity")}}và{{jsxref("NaN")}}bị bỏ qua.

## Ví dụ

### Di chuyển bóng theo chiều dọc

Ví dụ này thêm bóng mờ vào hình chữ nhật. Thuộc tính{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}đặt màu của nó,`shadowOffsetY`đặt độ lệch 25 đơn vị về phía dưới và{{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}}cung cấp cho nó mức độ mờ là 10.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Shadow
ctx.shadowColor = "red";
ctx.shadowOffsetY = 25;
ctx.shadowBlur = 10;

// Rectangle
ctx.fillStyle = "blue";
ctx.fillRect(20, 20, 150, 80);
```

#### Kết quả

{{ EmbedLiveSample('Moving_a_shadow_vertically', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.shadowOffsetX")}}
- {{domxref("CanvasRenderingContext2D.shadowColor")}}
- {{domxref("CanvasRenderingContext2D.shadowBlur")}}
