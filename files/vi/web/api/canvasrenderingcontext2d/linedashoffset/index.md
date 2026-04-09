---
title: "CanvasRenderingContext2D: thuộc tính lineDashOffset"
short-title: dòngDashOffset
slug: Web/API/CanvasRenderingContext2D/lineDashOffset
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.lineDashOffset
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.lineDashOffset`** của API Canvas 2D đặt độ lệch gạch ngang dòng hoặc "pha".

> [!LƯU Ý]
> Các đường được vẽ bằng cách gọi
> phương pháp {{domxref("CanvasRenderingContext2D.stroke()", "stroke()")}}.

## Giá trị

Một float xác định mức độ lệch của dấu gạch ngang dòng. Giá trị mặc định là `0.0`.

## Ví dụ

### Bù đắp một dấu gạch ngang

Ví dụ này vẽ hai đường đứt nét. Cái đầu tiên không có dấu gạch ngang. Cái thứ hai có độ lệch dấu gạch ngang là 4.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.setLineDash([4, 16]);

// Dashed line with no offset
ctx.beginPath();
ctx.moveTo(0, 50);
ctx.lineTo(300, 50);
ctx.stroke();

// Dashed line with offset of 4
ctx.beginPath();
ctx.strokeStyle = "red";
ctx.lineDashOffset = 4;
ctx.moveTo(0, 100);
ctx.lineTo(300, 100);
ctx.stroke();
```

#### Kết quả

Đường có dấu gạch ngang được vẽ bằng màu đỏ.

{{ EmbedLiveSample('Offsetting_a_line_dash', 700, 180) }}

### Kiến diễu hành

Hiệu ứng [marching ants](https://en.wikipedia.org/wiki/Marching_ants) là một kỹ thuật hoạt hình thường thấy trong các công cụ lựa chọn của chương trình đồ họa máy tính. Nó giúp người dùng phân biệt đường viền lựa chọn với nền hình ảnh bằng cách tạo hiệu ứng cho đường viền.

```html hidden
<canvas id="canvas"></canvas>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let offset = 0;

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.setLineDash([4, 2]);
  ctx.lineDashOffset = offset;
  ctx.strokeRect(10, 10, 100, 100);
}

function march() {
  offset++;
  if (offset > 5) {
    offset = 0;
  }
  draw();
  setTimeout(march, 20);
}

march();
```

{{ EmbedLiveSample('Marching_ants', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.getLineDash()")}}
- {{domxref("CanvasRenderingContext2D.setLineDash()")}}
- [Applying styles and color](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors)
