---
title: Tiện ích WEBGL_depth_texture
short-title: WEBGL_depth_texture
slug: Web/API/WEBGL_depth_texture
page-type: webgl-extension
browser-compat: api.WEBGL_depth_texture
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_depth_texture`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và định nghĩa texture độ sâu 2D và texture độ sâu-stencil.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này chỉ khả dụng với ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của tiện ích này khả dụng trên ngữ cảnh WebGL2 theo mặc định. Hằng số trong WebGL2 là `gl.UNSIGNED_INT_24_8`.

## Hằng số

Tiện ích này thêm một hằng số mới:

- `ext.UNSIGNED_INT_24_8_WEBGL`
  - : Kiểu số nguyên không dấu cho dữ liệu texture độ sâu 24-bit.

## Phương thức mở rộng

Tiện ích này mở rộng {{domxref("WebGLRenderingContext.texImage2D()")}}:

- Tham số `format` và `internalformat` hiện chấp nhận `gl.DEPTH_COMPONENT` và `gl.DEPTH_STENCIL`.
- Tham số `type` hiện chấp nhận `gl.UNSIGNED_SHORT`, `gl.UNSIGNED_INT`, và `ext.UNSIGNED_INT_24_8_WEBGL`.
- Tham số `pixels` hiện chấp nhận đối tượng {{jsxref("Uint16Array")}} hoặc {{jsxref("Uint32Array")}}.

Tiện ích này mở rộng {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}:

- Tham số `attachment` hiện chấp nhận `gl.DEPTH_STENCIL_ATTACHMENT`.

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_depth_texture");

gl.texImage2D(
  gl.TEXTURE_2D,
  0,
  gl.DEPTH_COMPONENT,
  512,
  512,
  0,
  gl.DEPTH_COMPONENT,
  gl.UNSIGNED_SHORT,
  null,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}
