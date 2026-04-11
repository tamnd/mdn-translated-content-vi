---
title: "WebGLRenderingContext: compileShader() method"
short-title: compileShader()
slug: Web/API/WebGLRenderingContext/compileShader
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.compileShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **TOK2.compileShader()** của [WebGL API](/en-US/docs/Web/API/WebGL_API) biên dịch một GLSL shader thành dữ liệu nhị phân để nó có thể được sử dụng bởi {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
compileShader(shader)
```

### Thông số

- `shader`
  - : Một đoạn hoặc đỉnh {{domxref("WebGLShader")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Bị ném đi nếu `shader` được chỉ định không thuộc loại `WebGLShader`.

## Ví dụ

```js
const shader = gl.createShader(gl.VERTEX_SHADER);
gl.shaderSource(shader, shaderSource);
gl.compileShader(shader);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLProgram")}}
- {{domxref("WebGLShader")}}
- {{domxref("WebGLRenderingContext.attachShader()")}}
- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.deleteShader()")}}
- {{domxref("WebGLRenderingContext.detachShader()")}}
- {{domxref("WebGLRenderingContext.getAttachedShaders()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
- {{domxref("WebGLRenderingContext.getShaderParameter()")}}
- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
- {{domxref("WebGLRenderingContext.getShaderInfoLog()")}}
- {{domxref("WebGLRenderingContext.getShaderSource()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.isShader()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.shaderSource()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
