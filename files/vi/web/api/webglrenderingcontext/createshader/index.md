---
title: "WebGLRenderingContext: createShader() method"
short-title: createShader()
slug: Web/API/WebGLRenderingContext/createShader
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createShader
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức {{domxref("WebGLRenderingContext")}} **`createShader()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo ra một {{domxref("WebGLShader")}} mà sau đó có thể được cấu hình thêm bằng cách sử dụng {{domxref("WebGLRenderingContext.shaderSource()")}} và {{domxref("WebGLRenderingContext.compileShader()")}}.

## Cú pháp

```js-nolint
createShader(type)
```

### Thông số

- `type`
  - : Hoặc `gl.VERTEX_SHADER` hoặc `gl.FRAGMENT_SHADER`. {{domxref("WebGLRenderingContext")}} sẽ đặt cờ lỗi `gl.INVALID_ENUM` nếu một giá trị không được chấp nhận đã được chỉ định.

### Giá trị trả về

Một phiên bản {{domxref("WebGLShader")}} mới, hoặc `null` nếu xảy ra lỗi khi tạo shader (ví dụ, vì `type` là một giá trị không hợp lệ).

## Ví dụ

Xem {{domxref("WebGLShader")}} để biết cách sử dụng và ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLProgram")}}
- {{domxref("WebGLShader")}}
- {{domxref("WebGLRenderingContext.attachShader()")}}
- {{domxref("WebGLRenderingContext.bindAttribLocation()")}}
- {{domxref("WebGLRenderingContext.compileShader()")}}
- {{domxref("WebGLRenderingContext.createProgram()")}}
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
