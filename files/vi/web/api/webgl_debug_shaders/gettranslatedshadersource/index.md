---
title: "WEBGL_debug_shaders: phương thức getTranslatedShaderSource()"
short-title: getTranslatedShaderSource()
slug: Web/API/WEBGL_debug_shaders/getTranslatedShaderSource
page-type: webgl-extension-method
browser-compat: api.WEBGL_debug_shaders.getTranslatedShaderSource
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_debug_shaders.getTranslatedShaderSource()`**
là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép
gỡ lỗi một shader đã được dịch.

## Cú pháp

```js-nolint
getTranslatedShaderSource(shader)
```

### Tham số

- `shader`
  - : Một {{domxref("WebGLShader")}} để lấy mã nguồn đã dịch.

### Giá trị trả về

Một {{jsxref("String")}} chứa mã nguồn shader đã được dịch. Chuỗi rỗng được
trả về nếu:

- chưa có mã nguồn nào được định nghĩa, hoặc
- {{domxref("WebGLRenderingContext.compileShader()")}} chưa được gọi, hoặc
- việc dịch shader thất bại.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

const shader = gl.createShader(gl.FRAGMENT_SHADER);
gl.shaderSource(
  shader,
  "void main() { gl_FragColor = vec4(gl_FragCoord.x, 0.0, 0.0, 1.0); }",
);
gl.compileShader(shader);

const src = gl
  .getExtension("WEBGL_debug_shaders")
  .getTranslatedShaderSource(shader);
console.log(src);
// "void main(){
// (gl_FragColor = vec4(gl_FragCoord.x, 0.0, 0.0, 1.0));
// }"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShader")}}
- {{domxref("WebGLRenderingContext.compileShader()")}}
