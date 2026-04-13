---
title: "WebGLRenderingContext: drawingBufferHeight property"
short-title: drawingBufferHeight
slug: Web/API/WebGLRenderingContext/drawingBufferHeight
page-type: web-api-instance-property
browser-compat: api.WebGLRenderingContext.drawingBufferHeight
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGLRenderingContext.drawingBufferHeight`** chỉ đọc thể hiện chiều cao thực tế của bộ đệm bản vẽ hiện tại. Nó phải phù hợp với thuộc tính `height` của phần tử {{HTMLElement("canvas")}} được liên kết với bối cảnh này, nhưng có thể khác nếu việc triển khai không thể cung cấp chiều cao được yêu cầu.

## Giá trị

Một con số.

## Ví dụ

Cho phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

Bạn có thể lấy chiều cao của vùng đệm vẽ bằng các dòng sau:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.drawingBufferHeight; // 150
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawingBufferWidth")}}
- {{domxref("WebGLRenderingContext.viewport()")}}
