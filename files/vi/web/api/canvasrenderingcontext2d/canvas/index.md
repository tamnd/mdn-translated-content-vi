---
title: "CanvasRenderingContext2D: thuộc tính canvas"
short-title: canvas
slug: Web/API/CanvasRenderingContext2D/canvas
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.canvas
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.canvas`**, một phần của
[Canvas API](/en-US/docs/Web/API/Canvas_API), là tham chiếu chỉ đọc cho
Đối tượng {{domxref("HTMLCanvasElement")}} được liên kết với một bối cảnh nhất định.

## Giá trị

Một đối tượng {{domxref("HTMLCanvasElement")}}.

## Ví dụ

Cho phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

… bạn có thể lấy tham chiếu đến phần tử canvas trong
`CanvasRenderingContext2D`bằng cách sử dụng thuộc tính`canvas`:

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.canvas; // HTMLCanvasElement
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("CanvasRenderingContext2D")}}
- [Canvas API](/en-US/docs/Web/API/Canvas_API)
