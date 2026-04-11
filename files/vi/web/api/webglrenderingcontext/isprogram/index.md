---
title: "WebGLRenderingContext: isProgram() method"
short-title: isProgram()
slug: Web/API/WebGLRenderingContext/isProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isProgram
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isProgram()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLProgram")}} được truyền là hợp lệ, nếu không thì `false`.

## Cú pháp

```js-nolint
isProgram(program)
```

### Thông số

- `program`
  - : A {{domxref("WebGLProgram")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết chương trình có hợp lệ hay không.

## Ví dụ

### Kiểm tra một chương trình

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const program = gl.createProgram();

// …

gl.isProgram(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createProgram()")}}
- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
