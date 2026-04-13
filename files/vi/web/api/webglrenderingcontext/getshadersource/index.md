---
title: "WebGLRenderingContext: getShaderSource() method"
short-title: getShaderSource()
slug: Web/API/WebGLRenderingContext/getShaderSource
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getShaderSource
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getShaderSource()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về mã nguồn của {{domxref("WebGLShader")}} dưới dạng một chuỗi.

## Cú pháp

```js-nolint
getShaderSource(shader)
```

### Thông số

- `shader`
  - : Một đối tượng {{domxref("WebGLShader")}} để lấy mã nguồn từ đó.

### Giá trị trả về

Một chuỗi chứa mã nguồn của trình đổ bóng.

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
