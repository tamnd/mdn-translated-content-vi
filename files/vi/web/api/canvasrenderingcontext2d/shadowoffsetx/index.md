---
title: "CanvasRenderingContext2D: thuộc tính ShadowOffsetX"
short-title: bóngOffsetX
slug: Web/API/CanvasRenderingContext2D/shadowOffsetX
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.shadowOffsetX
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.shadowOffsetX`** của API Canvas 2D chỉ định khoảng cách mà bóng sẽ được bù theo chiều ngang.

> [!LƯU Ý]
> Bóng chỉ được vẽ nếu
> Thuộc tính{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}được đặt thành
> một giá trị không minh bạch. Một trong các{{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}},`shadowOffsetX`, hoặc
> thuộc tính{{domxref("CanvasRenderingContext2D.shadowOffsetY", "shadowOffsetY")}}phải
> cũng khác 0.

## Giá trị

Một float xác định khoảng cách mà bóng sẽ được bù theo chiều ngang. Giá trị dương ở bên phải và âm ở bên trái. Giá trị mặc định là`0`(không có offset theo chiều ngang). Các giá trị{{jsxref("Infinity")}}và{{jsxref("NaN")}}bị bỏ qua.

## Ví dụ

### Di chuyển bóng theo chiều ngang

Ví dụ này thêm bóng mờ vào hình chữ nhật. Thuộc tính{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}đặt màu của nó,`shadowOffsetX`đặt độ lệch của nó là 25 đơn vị ở bên phải và{{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}}đặt cho nó mức độ mờ là 10.

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
ctx.shadowOffsetX = 25;
ctx.shadowBlur = 10;

// Rectangle
ctx.fillStyle = "blue";
ctx.fillRect(20, 20, 150, 100);
```

#### Kết quả

{{ EmbedLiveSample('Moving_a_shadow_horizontally', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.shadowOffsetY")}}
- {{domxref("CanvasRenderingContext2D.shadowColor")}}
- {{domxref("CanvasRenderingContext2D.shadowBlur")}}
