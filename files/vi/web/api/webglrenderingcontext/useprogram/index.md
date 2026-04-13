---
title: "WebGLRenderingContext: useProgram() method"
short-title: useProgram()
slug: Web/API/WebGLRenderingContext/useProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.useProgram
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`WebGLRenderingContext.useProgram()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) đặt {{domxref("WebGLProgram")}} được chỉ định làm một phần của trạng thái kết xuất hiện tại.

## Cú pháp

```js-nolint
useProgram(program)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} để sử dụng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const program = gl.createProgram();

// Attach pre-existing shaders
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);

gl.linkProgram(program);
gl.useProgram(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
