---
title: "CanvasRenderingContext2D: thuộc tính phông chữ"
short-title: phông chữ
slug: Web/API/CanvasRenderingContext2D/font
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.font
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.font`** của API Canvas 2D chỉ định kiểu văn bản hiện tại sẽ sử dụng khi vẽ văn bản. Chuỗi này sử dụng cú pháp tương tự như chuỗi xác định [CSS font](/en-US/docs/Web/CSS/Reference/Properties/font).

## Giá trị

Một chuỗi được phân tích cú pháp dưới dạng giá trị CSS {{cssxref("font")}}. Phông chữ mặc định là sans-serif 10px.

## Ví dụ

### Sử dụng phông chữ tùy chỉnh

Trong ví dụ này, chúng tôi sử dụng thuộc tính `font` để chỉ định độ dày, kích thước và họ phông chữ tùy chỉnh.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "bold 48px serif";
ctx.strokeText("Hello world", 50, 100);
```

#### Kết quả

{{ EmbedLiveSample('Using_a_custom_font', 700, 180) }}

### Tải phông chữ bằng API tải phông chữ CSS

Với sự trợ giúp của API {{domxref("FontFace")}}, bạn có thể tải phông chữ một cách rõ ràng trước khi sử dụng chúng trong canvas.

```js
let f = new FontFace("test", "url(x)");

f.load().then(() => {
  // Ready to use the font in a canvas context
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
