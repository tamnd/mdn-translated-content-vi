---
title: EXT_texture_compression_bptc extension
short-title: EXT_texture_compression_bptc
slug: Web/API/EXT_texture_compression_bptc
page-type: webgl-extension
browser-compat: api.EXT_texture_compression_bptc
---

{{APIRef("WebGL")}}

Phần mở rộng `EXT_texture_compression_bptc` là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp 4 định dạng texture nén BPTC. Các định dạng nén này được gọi là [BC7](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc7-format) và [BC6H](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format) trong [DirectX API của Microsoft](https://learn.microsoft.com/en-us/windows/win32/direct3d11/texture-block-compression-in-direct3d-11).

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Hỗ trợ phụ thuộc vào driver đồ họa của hệ thống. Không có hỗ trợ trên Windows.
>
> Phần mở rộng này có sẵn cho cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

Các định dạng texture nén được cung cấp bởi 4 hằng số và có thể được sử dụng trong hai hàm: {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} và {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}}.

- `ext.COMPRESSED_RGBA_BPTC_UNORM_EXT`: Nén dữ liệu cố định 8-bit. Mỗi khối 4x4 texels gồm 128 bit dữ liệu RGBA hoặc ảnh. Xem thêm [định dạng BC7](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc7-format).
- `ext.COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT`: Nén dữ liệu cố định 8-bit. Mỗi khối 4x4 texels gồm 128 bit dữ liệu SRGB_ALPHA hoặc ảnh. Xem thêm [định dạng BC7](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc7-format).
- `ext.COMPRESSED_RGB_BPTC_SIGNED_FLOAT_EXT`: Nén các giá trị dấu phẩy động có dấu dải động cao. Mỗi khối 4x4 texels gồm 128 bit dữ liệu RGB. Chỉ chứa dữ liệu RGB, vì vậy giá trị alpha trả về là 1.0. Xem thêm [định dạng BC6H](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format).
- `ext.COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_EXT`: Nén các giá trị dấu phẩy động không dấu dải động cao. Mỗi khối 4x4 texels gồm 128 bit dữ liệu RGB. Chỉ chứa dữ liệu RGB, vì vậy giá trị alpha trả về là 1.0. Xem thêm [định dạng BC6H](https://learn.microsoft.com/en-us/windows/win32/direct3d11/bc6h-format).

## Ví dụ

```js
const ext = gl.getExtension("EXT_texture_compression_bptc");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RGBA_BPTC_UNORM_EXT,
  128,
  128,
  0,
  textureData,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
