---
title: Tiện ích WEBGL_compressed_texture_etc1
short-title: WEBGL_compressed_texture_etc1
slug: Web/API/WEBGL_compressed_texture_etc1
page-type: webgl-extension
browser-compat: api.WEBGL_compressed_texture_etc1
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_compressed_texture_etc1`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp [định dạng texture nén ETC1](https://en.wikipedia.org/wiki/Ericsson_Texture_Compression).

Texture nén giúp giảm dung lượng bộ nhớ cần thiết để lưu trữ texture trên GPU, cho phép sử dụng texture có độ phân giải cao hơn hoặc nhiều texture hơn với cùng độ phân giải.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

Định dạng texture nén được cung cấp bởi một hằng số và có thể được dùng với phương thức {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} (lưu ý rằng ETC1 **không** được hỗ trợ với phương thức {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}}).

- `ext.COMPRESSED_RGB_ETC1_WEBGL`
  - : Nén dữ liệu RGB 24-bit không có kênh alpha.

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_compressed_texture_etc1");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RGB_ETC1_WEBGL,
  512,
  512,
  0,
  textureData,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Ericsson Texture Compression – Wikipedia](https://en.wikipedia.org/wiki/Ericsson_Texture_Compression)
- {{domxref("WEBGL_compressed_texture_etc")}} (ETC2 và EAC)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
