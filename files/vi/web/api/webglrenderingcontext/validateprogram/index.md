---
title: "WebGLRenderingContext: validateProgram() method"
short-title: validateProgram()
slug: Web/API/WebGLRenderingContext/validateProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.validateProgram
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`WebGLRenderingContext.validateProgram()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xác nhận {{domxref("WebGLProgram")}}. Nó kiểm tra xem nó có được liên kết thành công hay không và liệu nó có thể được sử dụng ở trạng thái WebGL hiện tại hay không.

## Cú pháp

```js-nolint
validateProgram(program)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} để xác thực.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const program = gl.createProgram();

// Attach pre-existing shaders
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);

gl.linkProgram(program);
gl.validateProgram(program);

if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
  const info = gl.getProgramInfoLog(program);
  throw new Error(`Could not compile WebGL program. \n\n${info}`);
}

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
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
