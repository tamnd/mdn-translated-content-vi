---
title: "CanvasRenderingContext2D: thuộc tính direction"
short-title: direction
slug: Web/API/CanvasRenderingContext2D/direction
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.direction
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.direction`** của API Canvas 2D chỉ định hướng văn bản hiện tại được sử dụng để vẽ văn bản.

## Giá trị

Các giá trị có thể:

- `"ltr"`
- : Hướng văn bản từ trái sang phải.
- `"rtl"`
- : Hướng văn bản từ phải sang trái. -`"inherit"`
- : Hướng văn bản được kế thừa từ phần tử {{HTMLElement("canvas")}} hoặc
  {{domxref("Document")}} nếu thích hợp. Giá trị mặc định.

Giá trị mặc định là `"inherit"`.

## Ví dụ

### Thay đổi hướng văn bản

Ví dụ này vẽ hai đoạn văn bản. Cái đầu tiên là từ trái sang phải và cái thứ hai
là từ phải sang trái. Lưu ý rằng "Xin chào!" trong `ltr`trở thành "!Hi" trong`rtl`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.font = "48px serif";
ctx.fillText("Hi!", 150, 50);
ctx.direction = "rtl";
ctx.fillText("Hi!", 150, 130);
```

#### Kết quả

{{ EmbedLiveSample('Changing_text_direction', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
