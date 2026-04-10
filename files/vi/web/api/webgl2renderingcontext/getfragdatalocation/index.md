---
title: "WebGL2RenderingContext: phương thức getFragDataLocation()"
short-title: getFragDataLocation()
slug: Web/API/WebGL2RenderingContext/getFragDataLocation
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getFragDataLocation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getFragDataLocation()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về liên kết của số màu với các biến varying out do người dùng định nghĩa.

## Cú pháp

```js-nolint
getFragDataLocation(program, name)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} để truy vấn.
- `name`
  - : Một chuỗi chỉ định tên của biến varying out do người dùng định nghĩa.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLint")}} cho biết liên kết số màu được gán, hoặc `-1` nếu không.

## Ví dụ

```js
// program là một WebGLProgram đã được liên kết

gl.getFragDataLocation(program, "fragColor");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}