---
title: "WebGLRenderingContext: createProgram() method"
short-title: createProgram()
slug: Web/API/WebGLRenderingContext/createProgram
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createProgram
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.createProgram()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một đối tượng {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
createProgram()
```

### Thông số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLProgram")}} là sự kết hợp của hai {{domxref("WebGLShader")}} được biên dịch bao gồm một trình đổ bóng đỉnh và một trình đổ bóng đoạn (cả hai đều được viết bằng GLSL). Sau đó chúng được liên kết thành một chương trình có thể sử dụng được.

## Ví dụ

### Tạo chương trình WebGL

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

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.deleteProgram()")}}
- {{domxref("WebGLRenderingContext.isProgram()")}}
- {{domxref("WebGLRenderingContext.linkProgram()")}}
- {{domxref("WebGLRenderingContext.useProgram()")}}
- {{domxref("WebGLRenderingContext.validateProgram()")}}
- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
- {{domxref("WebGLRenderingContext.getProgramInfoLog()")}}
