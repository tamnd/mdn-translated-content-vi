---
title: "WebGLRenderingContext: getAttachedShaders() method"
short-title: getAttachedShaders()
slug: Web/API/WebGLRenderingContext/getAttachedShaders
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getAttachedShaders
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getAttachedShaders()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về một danh sách các đối tượng {{domxref("WebGLShader")}} gắn với một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getAttachedShaders(program)
```

### Thông số

- `program`
  - : Một đối tượng {{domxref("WebGLProgram")}} để nhận các shader đính kèm.

### Giá trị trả về

Một {{jsxref("Array")}} của các đối tượng {{domxref("WebGLShader")}} được gắn vào `WebGLProgram` đã cho.

## Ví dụ

```js
const program = gl.createProgram();

// Attach pre-existing shaders
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);
gl.linkProgram(program);

gl.getAttachedShaders(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.isShader()")}}
- {{domxref("WebGLRenderingContext.deleteShader()")}}
