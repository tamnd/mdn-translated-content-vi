---
title: "WebGLRenderingContext: createBuffer() method"
short-title: createBuffer()
slug: Web/API/WebGLRenderingContext/createBuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.createBuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một {{domxref("WebGLBuffer")}} lưu trữ dữ liệu như các đỉnh hoặc màu sắc.

## Cú pháp

```js-nolint
createBuffer()
```

### Thông số

Không có.

### Giá trị trả về

Một {{domxref("WebGLBuffer")}} lưu trữ dữ liệu như các đỉnh hoặc màu sắc.

## Ví dụ

### Tạo bộ đệm

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- {{domxref("WebGLRenderingContext.isBuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
