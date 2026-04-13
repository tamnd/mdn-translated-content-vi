---
title: "WebGLRenderingContext: deleteProgram() method"
short-title: deleteProgram()
slug: Web/API/WebGLRenderingContext/deleteProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteProgram
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteProgram()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLProgram")}} đã cho. Phương pháp này không có hiệu lực nếu chương trình đã bị xóa.

## Cú pháp

```js-nolint
deleteProgram(program)
```

### Thông số

- `program`
  - : Một đối tượng {{domxref("WebGLProgram")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa một chương trình

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const program = gl.createProgram();

// …

gl.deleteProgram(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
