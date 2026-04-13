---
title: Tiện ích WEBGL_compressed_texture_etc
short-title: WEBGL_compressed_texture_etc
slug: Web/API/WEBGL_compressed_texture_etc
page-type: webgl-extension
browser-compat: api.WEBGL_compressed_texture_etc
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_compressed_texture_etc`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp 10 [định dạng texture nén ETC/EAC](https://en.wikipedia.org/wiki/Ericsson_Texture_Compression).

Texture nén giúp giảm dung lượng bộ nhớ cần thiết để lưu trữ texture trên GPU, cho phép sử dụng texture có độ phân giải cao hơn hoặc nhiều texture hơn với cùng độ phân giải.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

Các định dạng texture nén được cung cấp bởi 10 hằng số và có thể được dùng trong hai hàm: {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} và {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}}.

- `ext.COMPRESSED_R11_EAC`
  - : Nén định dạng một kênh (đỏ) không dấu.
- `ext.COMPRESSED_SIGNED_R11_EAC`
  - : Nén định dạng một kênh (đỏ) có dấu.
- `ext.COMPRESSED_RG11_EAC`
  - : Nén định dạng hai kênh (đỏ và xanh lá) không dấu.
- `ext.COMPRESSED_SIGNED_RG11_EAC`
  - : Nén định dạng hai kênh (đỏ và xanh lá) có dấu.
- `ext.COMPRESSED_RGB8_ETC2`
  - : Nén dữ liệu RGB8 không có kênh alpha.
- `ext.COMPRESSED_RGBA8_ETC2_EAC`
  - : Nén dữ liệu RGBA8. Phần RGB được mã hóa giống như `RGB_ETC2`, nhưng phần alpha được mã hóa riêng.
- `ext.COMPRESSED_SRGB8_ETC2`
  - : Nén dữ liệu sRGB8 không có kênh alpha.
- `ext.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`
  - : Nén dữ liệu sRGBA8. Phần sRGB được mã hóa giống như `SRGB_ETC2`, nhưng phần alpha được mã hóa riêng.
- `ext.COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
  - : Tương tự `RGB8_ETC`, nhưng có khả năng "punch through" kênh alpha, tức là làm cho nó hoàn toàn mờ đục hoặc trong suốt.
- `ext.COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`
  - : Tương tự `SRGB8_ETC`, nhưng có khả năng "punch through" kênh alpha, tức là làm cho nó hoàn toàn mờ đục hoặc trong suốt.

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_compressed_texture_etc");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RGBA8_ETC2_EAC,
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

### Ghi chú tương thích

- Tiện ích này từng có tên `WEBGL_compressed_texture_es3` từ Firefox 46 đến Firefox 51 và khả dụng trên ngữ cảnh WebGL 2 theo mặc định, điều này không còn đúng nữa. Bạn phải bật nó trên cả ngữ cảnh WebGL 1 và WebGL 2 để sử dụng.

## Xem thêm

- [Ericsson Texture Compression – Wikipedia](https://en.wikipedia.org/wiki/Ericsson_Texture_Compression)
- {{domxref("WEBGL_compressed_texture_etc1")}} (ETC1)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
