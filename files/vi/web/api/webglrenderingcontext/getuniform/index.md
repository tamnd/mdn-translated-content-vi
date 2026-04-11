---
title: "WebGLRenderingContext: getUniform() method"
short-title: getUniform()
slug: Web/API/WebGLRenderingContext/getUniform
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getUniform
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getUniform()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về giá trị của một biến đồng nhất tại một vị trí nhất định.

## Cú pháp

```js-nolint
getUniform(program, location)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa thuộc tính đồng nhất.
- `location`
  - : Một đối tượng {{domxref("WebGLUniformLocation")}} chứa vị trí của đồng phục
thuộc tính cần lấy.

### Giá trị trả về

Kiểu trả về phụ thuộc vào kiểu thống nhất:

<table class="standard-table"> <thead> <tr> <th scope="col">Loại đồng nhất</th> <th scope="col">Loại trả về</th> </tr> </thead> <tbody> <tr> <th colspan="2">WebGL 1 chỉ</th> </tr> <tr> <td><code>boolean</code></td> <td>{{domxref("WebGL_API/Types", "GLBoolean")}}</td> </tr> <tr> <td><code>int</code></td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> </tr> <tr> <td><code>float</code></td> <td>{{domxref("WebGL_API/Types", "GLfloat")}}</td> </tr> <tr> <td><code>vec2</code></td> <td>{{jsxref("Float32Array")}} (với 2 phần tử)</td> </tr> <tr> <td><code>ivec2</code></td> <td>{{jsxref("Int32Array")}} (với 2 phần tử)</td> </tr> <tr> <td><code>bvec2</code></td> <td> {{jsxref("Array")}} của {{domxref("WebGL_API/Types", "GLBoolean")}} (có 2 phần tử) </td> </tr> <tr> <td><code>vec3</code></td> <td>{{jsxref("Float32Array")}} (với 3 phần tử)</td> </tr> <tr> <td><code>ivec3</code></td> <td>{{jsxref("Int32Array")}} (có 3 phần tử)</td> </tr> <tr> <td><code>bvec3</code></td> <td> {{jsxref("Array")}} của {{domxref("WebGL_API/Types", "GLBoolean")}} (có 3 phần tử) </td> </tr> <tr> <td><code>vec4</code></td> <td>{{jsxref("Float32Array")}} (với 4 phần tử)</td> </tr> <tr> <td><code>ivec4</code></td> <td>{{jsxref("Int32Array")}} (với 4 phần tử)</td> </tr> <tr> <td><code>bvec4</code></td> <td> {{jsxref("Array")}} của {{domxref("WebGL_API/Types", "GLBoolean")}} (có 4 phần tử) </td> </tr> <tr> <td><code>mat2</code></td> <td>{{jsxref("Float32Array")}} (với 4 phần tử)</td> </tr> <tr> <td><code>mat3</code></td> <td>{{jsxref("Float32Array")}} (với 9 phần tử)</td> </tr> <tr> <td><code>mat4</code></td> <td>{{jsxref("Float32Array")}} (với 16 phần tử)</td> </tr> <tr> <td><code>sampler2D</code></td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> </tr> <tr> <td><code>samplerCube</code></td> <td>{{domxref("WebGL_API/Types", "GLint")}}</td> </tr> <tr> <th colspan="2">Có thêm ở WebGL 2</th> </tr> <tr> <td><code>uint</code></td> <td>{{domxref("WebGL_API/Types", "GLuint")}}</td> </tr> <tr> <td><code>uvec2</code></td> <td>{{jsxref("Uint32Array")}} (có 2 phần tử)</td> </tr> <tr> <td><code>uvec3</code></td> <td>{{jsxref("Uint32Array")}} (có 3 phần tử)</td> </tr> <tr> <td><code>uvec4</code></td> <td>{{jsxref("Uint32Array")}} (với 4 phần tử)</td> </tr> <tr> <td><code>mat2x3</code></td> <td>{{jsxref("Float32Array")}} (với 6 phần tử)</td> </tr> <tr> <td><code>mat2x4</code></td> <td>{{jsxref("Float32Array")}} (với 8 phần tử)</td> </tr> <tr> <td><code>mat3x2</code></td> TOK238��{{jsxref("Float32Array")}} (có 6 phần tử)</td> </tr> <tr> <td><code>mat3x4</code></td> <td>{{jsxref("Float32Array")}} (với 12 phần tử)</td> </tr> <tr> <td><code>mat4x2</code></td> <td>{{jsxref("Float32Array")}} (với 8 phần tử)</td> </tr> <tr> <td><code>mat4x3</code></td> <td>{{jsxref("Float32Array")}} (với 12 phần tử)</td> </tr> <tr> <td>bất kỳ loại dụng cụ lấy mẫu</td> <td>{{domxref("WebGL_API/Types", "GLint")}}TOK269��� </tr> </tbody> </table>

## Ví dụ

```js
const loc = gl.getUniformLocation(program, "u_foobar");
gl.getUniform(program, loc);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLUniformLocation")}}
- {{domxref("WebGLRenderingContext.getActiveUniform()")}}
