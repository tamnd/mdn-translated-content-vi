---
title: "CanvasRenderingContext2D: thuộc tính letterSpacing"
short-title: Khoảng cách chữ cái
slug: Web/API/CanvasRenderingContext2D/letterSpacing
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.letterSpacing
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.letterSpacing`** của [Canvas API](/en-US/docs/Web/API/Canvas_API) chỉ định khoảng cách giữa các chữ cái khi vẽ văn bản.

Điều này tương ứng với thuộc tính CSS {{cssxref("letter-spacing")}}.

## Giá trị

Khoảng cách giữa các chữ cái dưới dạng một chuỗi trong định dạng dữ liệu CSS {{cssxref("length")}}. Mặc định là `0px`.

Thuộc tính này có thể được sử dụng để lấy hoặc đặt khoảng cách. Giá trị thuộc tính sẽ không thay đổi nếu được đặt thành giá trị không hợp lệ/không thể phân tích cú pháp.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "Xin chào thế giới" ba lần, sử dụng thuộc tính `letterSpacing` để sửa đổi khoảng cách giữa các chữ cái trong từng trường hợp. Khoảng cách cũng được hiển thị cho từng trường hợp, sử dụng giá trị của thuộc tính.

### HTML

```html
<canvas id="canvas" width="700"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "30px serif";

// Default letter spacing
ctx.fillText(`Hello world (default: ${ctx.letterSpacing})`, 10, 40);

// Custom letter spacing: 10px
ctx.letterSpacing = "10px";
ctx.fillText(`Hello world (${ctx.letterSpacing})`, 10, 90);

// Custom letter spacing: 20px
ctx.letterSpacing = "20px";
ctx.fillText(`Hello world (${ctx.letterSpacing})`, 10, 140);
```

### Kết quả

{{ EmbedLiveSample('Examples', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D.wordSpacing")}}
