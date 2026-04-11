---
title: "WebGLRenderingContext: canvas property"
short-title: canvas
slug: Web/API/WebGLRenderingContext/canvas
page-type: web-api-instance-property
browser-compat: api.WebGLRenderingContext.canvas
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGLRenderingContext.canvas`** là một tham chiếu chỉ đọc tới đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}} được liên kết với ngữ cảnh. Nó có thể là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu nó không được liên kết với phần tử {{HTMLElement("canvas")}} hoặc đối tượng {{domxref("OffscreenCanvas")}}.

## Giá trị

Hoặc là một đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Ví dụ

### Phần tử canvas

Cho phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

Bạn có thể lấy lại một tham chiếu tới nó từ `WebGLRenderingContext` bằng cách sử dụng thuộc tính `canvas`:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.canvas; // HTMLCanvasElement
```

### Canvas ngoài màn hình

Ví dụ sử dụng đối tượng thử nghiệm {{domxref("OffscreenCanvas")}}.

```js
const offscreen = new OffscreenCanvas(256, 256);
const gl = offscreen.getContext("webgl");
gl.canvas; // OffscreenCanvas
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D.canvas")}}
- Giao diện {{domxref("OffscreenCanvas")}}
