---
title: "WebGLRenderingContext: deleteFramebuffer() method"
short-title: deleteFramebuffer()
slug: Web/API/WebGLRenderingContext/deleteFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteFramebuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLFramebuffer")}} đã cho. Phương pháp này không có hiệu lực nếu bộ đệm khung đã bị xóa.

## Cú pháp

```js-nolint
deleteFramebuffer(framebuffer)
```

### Thông số

- `framebuffer`
  - : Một đối tượng {{domxref("WebGLFramebuffer")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa bộ đệm khung

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const framebuffer = gl.createFramebuffer();

// …

gl.deleteFramebuffer(framebuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
