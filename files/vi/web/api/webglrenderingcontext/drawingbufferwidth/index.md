---
title: "WebGLRenderingContext: drawingBufferWidth property"
short-title: drawingBufferWidth
slug: Web/API/WebGLRenderingContext/drawingBufferWidth
page-type: web-api-instance-property
browser-compat: api.WebGLRenderingContext.drawingBufferWidth
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính **`WebGLRenderingContext.drawingBufferWidth`** chỉ đọc thể hiện chiều rộng thực tế của vùng đệm vẽ hiện tại. Nó phải khớp với thuộc tính `width` của phần tử {{HTMLElement("canvas")}} được liên kết với ngữ cảnh này, nhưng có thể khác nếu việc triển khai không thể cung cấp độ rộng được yêu cầu.

## Giá trị

Một con số.

## Ví dụ

Cho phần tử {{HTMLElement("canvas")}} này:

```html
<canvas id="canvas"></canvas>
```

Bạn có thể lấy chiều rộng của vùng đệm vẽ bằng các dòng sau:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.drawingBufferWidth; // 300
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawingBufferHeight")}}
- {{domxref("WebGLRenderingContext.viewport()")}}
