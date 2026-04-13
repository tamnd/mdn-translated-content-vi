---
title: EXT_texture_compression_rgtc extension
short-title: EXT_texture_compression_rgtc
slug: Web/API/EXT_texture_compression_rgtc
page-type: webgl-extension
browser-compat: api.EXT_texture_compression_rgtc
---

{{APIRef("WebGL")}}

Phần mở rộng `EXT_texture_compression_rgtc` là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp 4 định dạng texture nén RGTC. RGTC là định dạng nén texture dựa trên khối phù hợp với các texture đỏ và đỏ-xanh có dấu và không dấu (**R**ed-**G**reen **T**exture **C**ompression).

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Hỗ trợ phụ thuộc vào driver đồ họa của hệ thống. Không có hỗ trợ trên Windows.
>
> Phần mở rộng này có sẵn cho cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

Các định dạng texture nén được cung cấp bởi 4 hằng số và có thể được sử dụng trong hai hàm: {{domxref("WebGLRenderingContext.compressedTexImage2D", "compressedTexImage2D()")}} và {{domxref("WebGLRenderingContext.compressedTexSubImage2D", "compressedTexSubImage2D()")}}.

- `ext.COMPRESSED_RED_RGTC1_EXT`: Mỗi khối 4x4 texels gồm 64 bit dữ liệu ảnh đỏ không dấu. Xem thêm [BC4 unsigned](https://learn.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc4).
- `ext.COMPRESSED_SIGNED_RED_RGTC1_EXT`: Mỗi khối 4x4 texels gồm 64 bit dữ liệu ảnh đỏ có dấu. Xem thêm [BC4 signed](https://learn.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc4).
- `ext.COMPRESSED_RED_GREEN_RGTC2_EXT`: Mỗi khối 4x4 texels gồm 64 bit dữ liệu ảnh đỏ không dấu nén tiếp theo là 64 bit dữ liệu ảnh xanh lá không dấu nén. Xem thêm [BC5 unsigned](https://learn.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc5).
- `ext.COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT`: Mỗi khối 4x4 texels gồm 64 bit dữ liệu ảnh đỏ có dấu nén tiếp theo là 64 bit dữ liệu ảnh xanh lá có dấu nén. Xem thêm [BC5 signed](https://learn.microsoft.com/en-us/windows/win32/direct3d10/d3d10-graphics-programming-guide-resources-block-compression#bc5).

## Ví dụ

```js
const ext = gl.getExtension("EXT_texture_compression_rgtc");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RED_RGTC1_EXT,
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
