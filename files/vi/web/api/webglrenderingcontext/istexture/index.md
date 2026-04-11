---
title: "WebGLRenderingContext: isTexture() method"
short-title: isTexture()
slug: Web/API/WebGLRenderingContext/isTexture
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isTexture()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu {{domxref("WebGLTexture")}} được truyền là hợp lệ và `false` nếu ngược lại.

## Cú pháp

```js-nolint
isTexture(texture)
```

### Thông số

- `texture`
  - : A {{domxref("WebGLTexture")}} để kiểm tra.

### Giá trị trả về

{{domxref("WebGL_API/Types", "GLboolean")}} cho biết kết cấu có hợp lệ hay không.

## Ví dụ

### Kiểm tra kết cấu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const texture = gl.createTexture();

gl.isTexture(texture);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
