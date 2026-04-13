---
title: "WebGLRenderingContext: detachShader() method"
short-title: detachShader()
slug: Web/API/WebGLRenderingContext/detachShader
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.detachShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.detachShader()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tách {{domxref("WebGLShader")}} đã được gắn trước đó ra khỏi {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
detachShader(program, shader)
```

### Thông số

- `program`
  - : A {{domxref("WebGLProgram")}}.
- `shader`
  - : Một đoạn hoặc đỉnh {{domxref("WebGLShader")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLProgram")}}
- {{domxref("WebGLShader")}}
- {{domxref("WebGLRenderingContext.attachShader()")}}
- {{domxref("WebGLRenderingContext.compileShader()")}}
- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.deleteShader()")}}
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
