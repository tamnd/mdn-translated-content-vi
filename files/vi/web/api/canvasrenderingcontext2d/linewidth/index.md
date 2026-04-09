---
title: "CanvasRenderingContext2D: thuộc tính lineWidth"
short-title: chiều rộng dòng
slug: Web/API/CanvasRenderingContext2D/lineWidth
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.lineWidth
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.lineWidth`** của API Canvas 2D đặt độ dày của đường kẻ.

> [!LƯU Ý]
> Các đường có thể được vẽ bằng
> {{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}},
> {{domxref("CanvasRenderingContext2D.strokeRect()", "strokeRect()")}},
> và {{domxref("CanvasRenderingContext2D.strokeText()", "strokeText()")}}.

## Giá trị

Một số chỉ định độ rộng của đường, tính bằng đơn vị không gian tọa độ. Các giá trị 0, âm,{{jsxref("Infinity")}} và {{jsxref("NaN")}} bị bỏ qua. Giá trị này mặc định là `1.0`.

## Ví dụ

### Thay đổi độ rộng dòng

Ví dụ này vẽ một đường thẳng và một hình chữ nhật, sử dụng chiều rộng đường thẳng là 15 đơn vị.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.lineWidth = 15;

ctx.beginPath();
ctx.moveTo(20, 20);
ctx.lineTo(130, 130);
ctx.rect(40, 40, 70, 70);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Changing_line_width', 700, 180) }}

### Thêm ví dụ

Để biết thêm ví dụ và giải thích về thuộc tính này, hãy xem [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors) trong [Canvas Tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.lineCap")}}
- {{domxref("CanvasRenderingContext2D.lineJoin")}}
- [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors)
