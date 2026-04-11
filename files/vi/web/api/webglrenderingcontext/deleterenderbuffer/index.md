---
title: "WebGLRenderingContext: deleteRenderbuffer() method"
short-title: deleteRenderbuffer()
slug: Web/API/WebGLRenderingContext/deleteRenderbuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteRenderbuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLRenderbuffer")}} đã cho. Phương pháp này không có hiệu lực nếu bộ đệm kết xuất đã bị xóa.

## Cú pháp

```js-nolint
deleteRenderbuffer(renderbuffer)
```

### Thông số

- `renderbuffer`
  - : Một đối tượng {{domxref("WebGLRenderbuffer")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa bộ đệm kết xuất

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const renderbuffer = gl.createRenderbuffer();

// …

gl.deleteRenderbuffer(renderbuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
