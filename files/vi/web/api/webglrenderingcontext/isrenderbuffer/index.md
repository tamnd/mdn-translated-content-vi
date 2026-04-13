---
title: "WebGLRenderingContext: isRenderbuffer() method"
short-title: isRenderbuffer()
slug: Web/API/WebGLRenderingContext/isRenderbuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isRenderbuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLRenderbuffer")}} được truyền là hợp lệ và `false` nếu ngược lại.

## Cú pháp

```js-nolint
isRenderbuffer(renderbuffer)
```

### Thông số

- `renderbuffer`
  - : A {{domxref("WebGLRenderbuffer")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết bộ đệm kết xuất có hợp lệ hay không.

## Ví dụ

### Kiểm tra bộ đệm kết xuất

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const renderbuffer = gl.createRenderbuffer();

gl.isRenderbuffer(renderbuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
