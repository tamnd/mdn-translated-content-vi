---
title: "WebGLRenderingContext: compressedTexSubImage2D() method"
short-title: compressedTexSubImage2D()
slug: Web/API/WebGLRenderingContext/compressedTexSubImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.compressedTexSubImage2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`compressedTexSubImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một hình chữ nhật phụ hai chiều cho một hình ảnh kết cấu ở định dạng nén.

Các định dạng ảnh nén chỉ có sẵn thông qua {{domxref("WebGL2RenderingContext")}} hoặc một số [Phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions).

## Cú pháp

```js-nolint
// WebGL 1:
compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, srcData)

// Additionally available in WebGL 2:
compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, srcData, srcOffset)
compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, srcData, srcOffset, srcLengthOverride)
compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, offset)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) của kết cấu nén hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Một kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_X`: Mặt X dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_X`: Mặt X âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Y`: Mặt Y dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Y`: Mặt Y âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Z`: Mặt Z dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Z`: Mặt Z âm cho kết cấu dạng khối lập phương.
- `level`
  - : A {{domxref("WebGL_API/Types", "GLint")}} xác định mức độ chi tiết. Cấp 0 là cấp độ hình ảnh cơ sở và cấp độ _n_ là cấp độ giảm mipmap thứ n.
- `xoffset`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ lệch ngang trong ảnh kết cấu được nén.
- `yoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ lệch dọc trong ảnh kết cấu được nén.
- `width`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của kết cấu được nén.
- `height`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của kết cấu được nén.
- `format`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng ảnh nén. Để biết danh sách các giá trị có thể, hãy xem {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}.

Nguồn kết cấu có thể được cung cấp theo một trong hai cách: từ {{jsxref("ArrayBuffer")}} (có thể được chia sẻ) sử dụng `srcData`, `srcOffset`, và `srcLengthOverride`; hoặc, trong WebGL 2, từ `gl.PIXEL_UNPACK_BUFFER` sử dụng `imageSize` và `offset`.

- `srcData`
  - : Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu kết cấu được nén.
- `srcOffset` {{optional_inline}}
  - : (chỉ WebGL 2) Một số nguyên xác định chỉ số của `srcData` để bắt đầu đọc từ đó. Mặc định là `0`.
- `srcLengthOverride` {{optional_inline}}
  - : (chỉ WebGL 2) Một số nguyên xác định số phần tử trong `srcData` cần đọc. Mặc định là `srcData.length - srcOffset`.
- `imageSize`
  - : (chỉ WebGL 2) Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định kích thước của dữ liệu hình ảnh theo byte.
- `offset`
  - : (chỉ WebGL 2) Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định địa chỉ bắt đầu trong bộ đệm được liên kết với `gl.PIXEL_UNPACK_BUFFER`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext =
  gl.getExtension("WEBGL_compressed_texture_s3tc") ||
  gl.getExtension("MOZ_WEBGL_compressed_texture_s3tc") ||
  gl.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc");
gl.compressedTexSubImage2D(
  gl.TEXTURE_2D,
  0,
  256,
  256,
  512,
  512,
  ext.COMPRESSED_RGBA_S3TC_DXT5_EXT,
  textureData,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tiện ích mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexSubImage3D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexImage3D()")}}
- {{domxref("WEBGL_compressed_texture_s3tc")}}
- {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}
- {{domxref("WEBGL_compressed_texture_etc")}}
- {{domxref("WEBGL_compressed_texture_pvrtc")}}
- {{domxref("WEBGL_compressed_texture_astc")}}
- {{domxref("EXT_texture_compression_bptc")}}
- {{domxref("EXT_texture_compression_rgtc")}}
