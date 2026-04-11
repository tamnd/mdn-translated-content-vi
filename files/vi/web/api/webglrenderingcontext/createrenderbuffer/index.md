---
title: "WebGLRenderingContext: createRenderbuffer() method"
short-title: createRenderbuffer()
slug: Web/API/WebGLRenderingContext/createRenderbuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createRenderbuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.createRenderbuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một đối tượng {{domxref("WebGLRenderbuffer")}}.

## Cú pháp

```js-nolint
createRenderbuffer()
```

### Thông số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLRenderbuffer")}} lưu trữ dữ liệu như một hình ảnh, hoặc có thể là nguồn hoặc đích của hoạt động hiển thị.

## Ví dụ

### Tạo bộ đệm kết xuất

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const renderBuffer = gl.createRenderbuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.isRenderbuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
