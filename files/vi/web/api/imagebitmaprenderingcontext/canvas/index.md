---
title: "ImageBitmapRenderingContext: canvas property"
short-title: canvas
slug: Web/API/ImageBitmapRenderingContext/canvas
page-type: web-api-instance-property
browser-compat: api.ImageBitmapRenderingContext.canvas
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính **`ImageBitmapRenderingContext.canvas`**, là một phần của [Canvas API](/en-US/docs/Web/API/Canvas_API), là tham chiếu chỉ đọc đến đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}} được liên kết với ngữ cảnh đã cho.

## Giá trị

Một đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}}.

## Ví dụ

Cho phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

Bạn có thể lấy tham chiếu đến phần tử canvas trong `ImageBitmapRenderingContext` bằng cách sử dụng thuộc tính `canvas`:

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("bitmaprenderer");
console.log(ctx.canvas === canvas); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ImageBitmapRenderingContext")}}
- [Canvas API](/en-US/docs/Web/API/Canvas_API)
