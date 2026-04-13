---
title: WebGLProgram
slug: Web/API/WebGLProgram
page-type: web-api-interface
browser-compat: api.WebGLProgram
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

**`WebGLProgram`** là một phần của [WebGL API](/vi/docs/Web/API/WebGL_API) và là sự kết hợp của hai {{domxref("WebGLShader")}} đã được biên dịch, bao gồm vertex shader và fragment shader (cả hai đều được viết bằng GLSL).

{{InheritanceDiagram}}

Để tạo một `WebGLProgram`, hãy gọi hàm {{domxref("WebGLRenderingContext.createProgram", "createProgram()")}} của ngữ cảnh GL. Sau khi gắn các shader bằng {{domxref("WebGLRenderingContext.attachShader", "attachShader()")}}, bạn liên kết chúng thành một chương trình có thể sử dụng. Điều này được minh họa trong đoạn mã dưới đây.

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

Xem {{domxref("WebGLShader")}} để biết thông tin về cách tạo `vertexShader` và `fragmentShader` trong ví dụ trên.

## Ví dụ

### Sử dụng chương trình

Các bước để thực sự thực hiện một số công việc với chương trình bao gồm yêu cầu GPU sử dụng chương trình, liên kết dữ liệu và các tùy chọn cấu hình phù hợp, và cuối cùng vẽ ra màn hình.

```js
// Use the program
gl.useProgram(program);

// Bind existing attribute data
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.enableVertexAttribArray(attributeLocation);
gl.vertexAttribPointer(attributeLocation, 3, gl.FLOAT, false, 0, 0);

// Draw a single triangle
gl.drawArrays(gl.TRIANGLES, 0, 3);
```

### Xóa chương trình

Nếu có lỗi khi liên kết chương trình hoặc bạn muốn xóa một chương trình hiện có, thì chỉ cần chạy {{domxref("WebGLRenderingContext.deleteProgram()")}}. Thao tác này giải phóng bộ nhớ của chương trình đã liên kết.

```js
gl.deleteProgram(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShader")}}
- {{domxref("WebGLRenderingContext.attachShader()")}}
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
