---
title: WebGLRenderbuffer
slug: Web/API/WebGLRenderbuffer
page-type: web-api-interface
browser-compat: api.WebGLRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLRenderbuffer** là một phần của [WebGL API](/vi/docs/Web/API/WebGL_API) và đại diện cho một bộ đệm có thể chứa hình ảnh, hoặc là nguồn hoặc đích của một thao tác kết xuất.

{{InheritanceDiagram}}

## Mô tả

Đối tượng `WebGLRenderbuffer` không định nghĩa bất kỳ phương thức hay thuộc tính nào của riêng nó và nội dung của nó không thể truy cập trực tiếp. Khi làm việc với các đối tượng `WebGLRenderbuffer`, các phương thức sau hữu ích:

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
- {{domxref("WebGL2RenderingContext.renderbufferStorageMultisample()")}}

## Ví dụ

### Tạo render buffer

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createRenderbuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
