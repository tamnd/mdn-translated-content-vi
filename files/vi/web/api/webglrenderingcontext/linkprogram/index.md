---
title: "WebGLRenderingContext: linkProgram() method"
short-title: linkProgram()
slug: Web/API/WebGLRenderingContext/linkProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.linkProgram
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`linkProgram()`** của giao diện {{domxref("WebGLRenderingContext")}} liên kết một {{domxref("WebGLProgram")}} nhất định, hoàn tất quá trình chuẩn bị mã GPU cho các shader đoạn và đỉnh của chương trình.

## Cú pháp

```js-nolint
linkProgram(program)
```

### Thông số

- `program`
  - : {{domxref("WebGLProgram")}} để liên kết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const program = gl.createProgram();

// Attach pre-existing shaders
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);

gl.linkProgram(program);

if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
  const info = gl.getProgramInfoLog(program);
  throw new Error(`Could not compile WebGL program. \n\n${info}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
