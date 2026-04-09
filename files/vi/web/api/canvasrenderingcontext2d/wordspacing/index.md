---
title: "CanvasRenderingContext2D: thuộc tính wordSpacing"
short-title: Khoảng cách từ
slug: Web/API/CanvasRenderingContext2D/wordSpacing
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.wordSpacing
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.wordSpacing`** của[Canvas API](/en-US/docs/Web/API/Canvas_API)chỉ định khoảng cách giữa các từ khi vẽ văn bản.

Điều này tương ứng với thuộc tính CSS{{cssxref("word-spacing")}}.

## Giá trị

Khoảng cách giữa các từ dưới dạng một chuỗi trong định dạng dữ liệu CSS{{cssxref("length")}}. Mặc định là`0px`.

Thuộc tính này có thể được sử dụng để lấy hoặc đặt khoảng cách. Giá trị thuộc tính sẽ không thay đổi nếu được đặt thành giá trị không hợp lệ/không thể phân tích cú pháp.

## Ví dụ

Trong ví dụ này, chúng tôi hiển thị văn bản "Xin chào thế giới" ba lần, sử dụng thuộc tính`wordSpacing`để sửa đổi khoảng cách trong từng trường hợp. Khoảng cách cũng được hiển thị cho từng trường hợp, sử dụng giá trị của thuộc tính.

### HTML

```html
<canvas id="canvas" width="700"></canvas>
```

### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "30px serif";

// Default word spacing
ctx.fillText(`Hello world (default: ${ctx.wordSpacing})`, 10, 40);

// Custom word spacing: 10px
ctx.wordSpacing = "10px";
ctx.fillText(`Hello world (${ctx.wordSpacing})`, 10, 90);

// Custom word spacing: 30px
ctx.wordSpacing = "30px";
ctx.fillText(`Hello world (${ctx.wordSpacing})`, 10, 140);
```

### Kết quả

{{ EmbedLiveSample('Examples', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D.letterSpacing")}}
