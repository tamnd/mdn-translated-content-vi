---
title: "CanvasRenderingContext2D: thuộc tính lineCap"
short-title: dòngCap
slug: Web/API/CanvasRenderingContext2D/lineCap
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.lineCap
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.lineCap`** của API Canvas 2D xác định hình dạng được sử dụng để vẽ điểm cuối của đường.

> [!LƯU Ý]
> Các đường có thể được vẽ bằng
> {{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}},{{domxref("CanvasRenderingContext2D.strokeRect()", "strokeRect()")}},
> và {{domxref("CanvasRenderingContext2D.strokeText()", "strokeText()")}}.

## Giá trị

Một trong những điều sau đây:

- `"butt"`
- : Các đầu của dòng được bình phương ở điểm cuối. Giá trị mặc định.
- `"round"`
- : Các đầu của dòng được làm tròn.
- `"square"`
- : Các đầu của dòng được bình phương bằng cách thêm một hộp có chiều rộng bằng nhau và một nửa
  chiều cao của độ dày của đường.

## Ví dụ

### Thay đổi hình dạng của mũ dòng

Ví dụ này làm tròn giới hạn cuối của một đường thẳng.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.beginPath();
ctx.moveTo(20, 20);
ctx.lineWidth = 15;
ctx.lineCap = "round";
ctx.lineTo(100, 100);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Changing_the_shape_of_line_caps', 700, 180) }}

### So sánh giới hạn dòng

Trong ví dụ này, ba dòng được vẽ, mỗi dòng có một giá trị khác nhau cho thuộc tính `lineCap`. Hai hướng dẫn để thấy sự khác biệt chính xác giữa ba hướng dẫn này được thêm vào. Mỗi dòng này bắt đầu và kết thúc chính xác trên các hướng dẫn này.

Dòng bên trái sử dụng tùy chọn mặc định `"butt"`. Nó được vẽ hoàn toàn bằng phẳng với các hướng dẫn. Thứ hai được đặt để sử dụng tùy chọn`"round"`. Điều này thêm một hình bán nguyệt vào cuối có bán kính bằng một nửa chiều rộng của đường thẳng. Dòng bên phải sử dụng tùy chọn`"square"`. Điều này thêm một hộp có chiều rộng bằng nhau và một nửa chiều cao của độ dày đường.

```html hidden
<canvas id="canvas" width="150" height="150"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Draw guides
ctx.strokeStyle = "#0099ff";
ctx.beginPath();
ctx.moveTo(10, 10);
ctx.lineTo(140, 10);
ctx.moveTo(10, 140);
ctx.lineTo(140, 140);
ctx.stroke();

// Draw lines
ctx.strokeStyle = "black";
["butt", "round", "square"].forEach((lineCap, i) => {
  ctx.lineWidth = 15;
  ctx.lineCap = lineCap;
  ctx.beginPath();
  ctx.moveTo(25 + i * 50, 10);
  ctx.lineTo(25 + i * 50, 140);
  ctx.stroke();
});
```

{{EmbedLiveSample("Comparison_of_line_caps", "180", "180")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho WebKit/Blink

- Trong Trình duyệt dựa trên WebKit và Blink, một phương thức không chuẩn và không được dùng nữa
  `ctx.setLineCap()` được triển khai ngoài thuộc tính này.

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.lineWidth")}}
- {{domxref("CanvasRenderingContext2D.lineJoin")}}
- [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors)
