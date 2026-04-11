---
title: "WebGLRenderingContext: createTexture() method"
short-title: createTexture()
slug: Web/API/WebGLRenderingContext/createTexture
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.createTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.createTexture()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo một đối tượng {{domxref("WebGLTexture")}}.

## Cú pháp

```js-nolint
createTexture()
```

### Thông số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLTexture")}} mà hình ảnh có thể được gắn vào.

## Ví dụ

Xem thêm [WebGL hướng dẫn](/en-US/docs/Web/API/WebGL_API/Tutorial) trên [Sử dụng họa tiết trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL).

### Tạo kết cấu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const texture = gl.createTexture();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
- {{domxref("WebGLRenderingContext.isTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
