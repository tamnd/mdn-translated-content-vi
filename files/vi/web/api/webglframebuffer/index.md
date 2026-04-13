---
title: WebGLFramebuffer
slug: Web/API/WebGLFramebuffer
page-type: web-api-interface
browser-compat: api.WebGLFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLFramebuffer** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho một tập hợp các buffer phục vụ như đích render.

{{InheritanceDiagram}}

## Mô tả

Đối tượng `WebGLFramebuffer` không định nghĩa bất kỳ phương thức hoặc thuộc tính nào của riêng nó và nội dung của nó không thể truy cập trực tiếp. Khi làm việc với các đối tượng `WebGLFramebuffer`, các phương thức sau của {{domxref("WebGLRenderingContext")}} hữu ích:

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}

## Ví dụ

### Tạo frame buffer

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createFramebuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}
- Các buffer khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
