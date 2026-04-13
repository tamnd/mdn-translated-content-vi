---
title: "WebGLRenderingContext: isFramebuffer() method"
short-title: isFramebuffer()
slug: Web/API/WebGLRenderingContext/isFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isFramebuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLFramebuffer")}} được truyền là hợp lệ và `false` nếu ngược lại.

## Cú pháp

```js-nolint
isFramebuffer(framebuffer)
```

### Thông số

- `framebuffer`
  - : A {{domxref("WebGLFramebuffer")}} để kiểm tra.

### Giá trị trả về

{{domxref("WebGL_API/Types", "GLboolean")}} cho biết bộ đệm khung có hợp lệ hay không.

## Ví dụ

### Kiểm tra bộ đệm khung

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const framebuffer = gl.createFramebuffer();

gl.isFramebuffer(framebuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
