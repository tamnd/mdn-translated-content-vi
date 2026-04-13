---
title: "WebGLRenderingContext: isBuffer() method"
short-title: isBuffer()
slug: Web/API/WebGLRenderingContext/isBuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isBuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLBuffer")}} được truyền là hợp lệ và `false` nếu ngược lại.

## Cú pháp

```js-nolint
isBuffer(buffer)
```

### Thông số

- `buffer`
  - : A {{domxref("WebGLBuffer")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết bộ đệm có hợp lệ hay không.

## Ví dụ

### Tạo bộ đệm

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();

gl.isBuffer(buffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
