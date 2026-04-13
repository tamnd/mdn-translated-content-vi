---
title: Tiện ích WEBGL_compressed_texture_pvrtc
short-title: WEBGL_compressed_texture_pvrtc
slug: Web/API/WEBGL_compressed_texture_pvrtc
page-type: webgl-extension
browser-compat: api.WEBGL_compressed_texture_pvrtc
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_compressed_texture_pvrtc`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp bốn [định dạng texture nén PVRTC](https://en.wikipedia.org/wiki/PVRTC).

Texture nén giúp giảm dung lượng bộ nhớ cần thiết để lưu trữ texture trên GPU, cho phép sử dụng texture có độ phân giải cao hơn hoặc nhiều texture hơn với cùng độ phân giải.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> PVRTC thường chỉ khả dụng trên các thiết bị di động có chipset PowerVR.
> Được dùng trên tất cả thế hệ iPhone, iPod Touch và iPad, và được hỗ trợ trên một số thiết bị Android dùng GPU PowerVR.
>
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

> [!NOTE]
> Trên các thiết bị iOS, tiện ích này có tên `WEBKIT_WEBGL_compressed_texture_pvrtc`.

## Hằng số

Các định dạng texture nén được cung cấp bởi bốn hằng số và có thể được dùng trong hai hàm: {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} (trong đó tham số `height` và `width` phải là lũy thừa của 2) và {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}} (trong đó tham số chiều cao và rộng phải bằng giá trị hiện tại của texture đang tồn tại và tham số `xoffset` và `yoffset` phải là 0).

- `ext.COMPRESSED_RGB_PVRTC_4BPPV1_IMG`
  - : Nén RGB ở chế độ 4-bit. Một khối cho mỗi 4×4 pixel.
- `ext.COMPRESSED_RGBA_PVRTC_4BPPV1_IMG`
  - : Nén RGBA ở chế độ 4-bit. Một khối cho mỗi 4×4 pixel.
- `ext.COMPRESSED_RGB_PVRTC_2BPPV1_IMG`
  - : Nén RGB ở chế độ 2-bit. Một khối cho mỗi 8×4 pixel.
- `ext.COMPRESSED_RGBA_PVRTC_2BPPV1_IMG`
  - : Nén RGBA ở chế độ 2-bit. Một khối cho mỗi 8×4 pixel.

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_compressed_texture_pvrtc");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RGB_PVRTC_4BPPV1_IMG,
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

- [PVRTC Texture Compression – Wikipedia](https://en.wikipedia.org/wiki/PVRTC)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
