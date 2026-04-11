---
title: "WebGLRenderingContext: deleteTexture() method"
short-title: deleteTexture()
slug: Web/API/WebGLRenderingContext/deleteTexture
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.deleteTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.deleteTexture()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLTexture")}} đã cho. Phương pháp này không có hiệu lực nếu kết cấu đã bị xóa.

## Cú pháp

```js-nolint
deleteTexture(texture)
```

### Thông số

- `texture`
  - : Một đối tượng {{domxref("WebGLTexture")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Xóa một kết cấu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const texture = gl.createTexture();

// …

gl.deleteTexture(texture);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.isTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
