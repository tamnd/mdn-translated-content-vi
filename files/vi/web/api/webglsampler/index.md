---
title: WebGLSampler
slug: Web/API/WebGLSampler
page-type: web-api-interface
browser-compat: api.WebGLSampler
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLSampler`** là một phần của API [WebGL 2](/vi/docs/Web/API/WebGL_API) và lưu trữ các tham số lấy mẫu cho việc truy cập {{domxref("WebGLTexture")}} bên trong shader.

{{InheritanceDiagram}}

Khi làm việc với các đối tượng `WebGLSampler`, các phương thức sau của {{domxref("WebGL2RenderingContext")}} hữu ích:

- {{domxref("WebGL2RenderingContext.createSampler()")}}
- {{domxref("WebGL2RenderingContext.deleteSampler()")}}
- {{domxref("WebGL2RenderingContext.isSampler()")}}
- {{domxref("WebGL2RenderingContext.bindSampler()")}}
- {{domxref("WebGL2RenderingContext.getSamplerParameter()")}}

## Ví dụ

### Tạo đối tượng `WebGLSampler`

Trong ví dụ này, `gl` phải là một {{domxref("WebGL2RenderingContext")}}. Các đối tượng `WebGLSampler` không khả dụng trong WebGL 1.

```js
const sampler = gl.createSampler();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
