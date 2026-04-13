---
title: WebGLShader
slug: Web/API/WebGLShader
page-type: web-api-interface
browser-compat: api.WebGLShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

**WebGLShader** là một phần của [WebGL API](/vi/docs/Web/API/WebGL_API) và có thể là vertex shader hoặc fragment shader. Một {{domxref("WebGLProgram")}} yêu cầu cả hai loại shader.

{{InheritanceDiagram}}

## Mô tả

Để tạo một **WebGLShader**, hãy dùng {{domxref("WebGLRenderingContext.createShader")}}, sau đó gắn mã nguồn GLSL vào bằng {{domxref("WebGLRenderingContext.shaderSource()")}}, và cuối cùng gọi {{domxref("WebGLRenderingContext.compileShader()")}} để hoàn tất và biên dịch shader. Lúc này **WebGLShader** vẫn chưa ở dạng sử dụng được và cần phải được gắn vào một {{domxref("WebGLProgram")}}.

```js
function createShader(gl, sourceCode, type) {
  // Compiles either a shader of type gl.VERTEX_SHADER or gl.FRAGMENT_SHADER
  const shader = gl.createShader(type);
  gl.shaderSource(shader, sourceCode);
  gl.compileShader(shader);

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    const info = gl.getShaderInfoLog(shader);
    throw new Error(`Could not compile WebGL program. \n\n${info}`);
  }
  return shader;
}
```

Xem {{domxref("WebGLProgram")}} để biết thông tin về cách gắn các shader.

## Ví dụ

### Tạo vertex shader

Lưu ý rằng có nhiều cách khác nhau để viết và truy cập chuỗi mã nguồn shader. Các ví dụ này chỉ mang tính minh họa.

```js
const vertexShaderSource =
  "attribute vec4 position;\n" +
  "void main() {\n" +
  "  gl_Position = position;\n" +
  "}\n";

// Use the createShader function from the example above
const vertexShader = createShader(gl, vertexShaderSource, gl.VERTEX_SHADER);
```

### Tạo fragment shader

```js
const fragmentShaderSource = `void main() {
  gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}
`;

// Use the createShader function from the example above
const fragmentShader = createShader(
  gl,
  fragmentShaderSource,
  gl.FRAGMENT_SHADER,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLProgram")}}
- {{domxref("WebGLRenderingContext.attachShader()")}}
- {{domxref("WebGLRenderingContext.bindAttribLocation()")}}
- {{domxref("WebGLRenderingContext.compileShader()")}}
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
