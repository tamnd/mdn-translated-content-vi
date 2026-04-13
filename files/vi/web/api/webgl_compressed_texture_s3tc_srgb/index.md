---
title: Tiện ích WEBGL_compressed_texture_s3tc_srgb
short-title: WEBGL_compressed_texture_s3tc_srgb
slug: Web/API/WEBGL_compressed_texture_s3tc_srgb
page-type: webgl-extension
browser-compat: api.WEBGL_compressed_texture_s3tc_srgb
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_compressed_texture_s3tc_srgb`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp bốn [định dạng texture nén S3TC](https://en.wikipedia.org/wiki/S3_Texture_Compression) cho không gian màu sRGB.

Texture nén giúp giảm dung lượng bộ nhớ cần thiết để lưu trữ texture trên GPU, cho phép sử dụng texture có độ phân giải cao hơn hoặc nhiều texture hơn với cùng độ phân giải.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

Các định dạng texture nén được cung cấp bởi bốn hằng số và có thể được dùng trong hai hàm: {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} và {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}}.

- `ext.COMPRESSED_SRGB_S3TC_DXT1_EXT`
  - : Ảnh nén DXT1 ở định dạng ảnh sRGB.
- `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT`
  - : Ảnh nén DXT1 ở định dạng ảnh sRGB với giá trị alpha bật/tắt.
- `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT`
  - : Ảnh nén DXT3 ở định dạng ảnh sRGBA.
- `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT`
  - : Ảnh nén DXT5 ở định dạng ảnh sRGBA.

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_compressed_texture_s3tc_srgb");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_SRGB_S3TC_DXT1_EXT,
  512,
  512,
  0,
  textureData,
);

gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [S3 Texture Compression – OpenGL wiki](https://wikis.khronos.org/opengl/S3_Texture_Compression#sRGB_and_S3TC)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
