---
title: "WebGLRenderingContext: shaderSource() method"
short-title: shaderSource()
slug: Web/API/WebGLRenderingContext/shaderSource
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.shaderSource
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.shaderSource()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập mã nguồn của {{domxref("WebGLShader")}}.

## Cú pháp

```js-nolint
shaderSource(shader, source)
```

### Thông số

- `shader`
  - : Một đối tượng {{domxref("WebGLShader")}} để thiết lập mã nguồn.
- `source`
  - : Một chuỗi chứa mã nguồn GLSL cần thiết lập.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Bị ném đi nếu `shader` được chỉ định không thuộc loại `WebGLShader`.

## Ví dụ

```js
const shader = gl.createShader(gl.VERTEX_SHADER);
gl.shaderSource(shader, originalSource);

const source = gl.getShaderSource(shader);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createShader()")}}
- {{domxref("WebGLRenderingContext.isShader()")}}
- {{domxref("WebGLRenderingContext.deleteShader()")}}
- {{domxref("WebGLRenderingContext.getShaderSource()")}}
