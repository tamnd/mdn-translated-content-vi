---
title: "WebGLRenderingContext: createFramebuffer() method"
short-title: createFramebuffer()
slug: Web/API/WebGLRenderingContext/createFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.createFramebuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một đối tượng {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
createFramebuffer()
```

### Thông số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLFramebuffer")}}.

## Ví dụ

### Tạo bộ đệm khung

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const framebuffer = gl.createFramebuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
