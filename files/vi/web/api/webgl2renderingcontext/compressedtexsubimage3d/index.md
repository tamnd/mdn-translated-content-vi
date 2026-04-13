---
title: "WebGL2RenderingContext: phương thức compressedTexSubImage3D()"
short-title: compressedTexSubImage3D()
slug: Web/API/WebGL2RenderingContext/compressedTexSubImage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.compressedTexSubImage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`compressedTexSubImage3D()`** của giao diện {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một hình chữ nhật con ba chiều cho ảnh texture ở định dạng nén.

Các định dạng ảnh nén chỉ có sẵn thông qua một số [phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions).

## Cú pháp

```js-nolint
compressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, imageSize, offset)

compressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, srcData)
compressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, srcData, srcOffset)
compressedTexSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, srcData, srcOffset, srcLengthOverride)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture nén đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức chi tiết. Mức 0 là mức hình ảnh cơ sở và mức _n_ là mức giảm mipmap thứ n.
- `xoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset x trong ảnh texture nén.
- `yoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset y trong ảnh texture nén.
- `zoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset z trong ảnh texture nén.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture nén tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture nén tính bằng texel.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều sâu của texture/số lượng texture trong một `TEXTURE_2D_ARRAY`.
- `format`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng ảnh nén. Để biết danh sách các giá trị có thể, xem {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}.

Nguồn texture có thể được cung cấp theo một trong hai cách: từ một {{jsxref("ArrayBuffer")}} (có thể chia sẻ) bằng cách sử dụng `srcData`, `srcOffset` và `srcLengthOverride`; hoặc, trong WebGL 2, từ `gl.PIXEL_UNPACK_BUFFER` bằng cách sử dụng `imageSize` và `offset`.

- `srcData`
  - : Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu texture nén.
- `srcOffset` {{optional_inline}}
  - : Một số nguyên chỉ định chỉ mục của `srcData` để bắt đầu đọc. Mặc định là `0`.
- `srcLengthOverride` {{optional_inline}}
  - : Một số nguyên chỉ định số phần tử trong `srcData` để đọc. Mặc định là `srcData.length - srcOffset`.
- `imageSize`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định kích thước của dữ liệu ảnh tính bằng byte.
- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định địa chỉ bắt đầu trong bộ đệm được liên kết với `gl.PIXEL_UNPACK_BUFFER`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.compressedTexSubImage3D(
  gl.TEXTURE_3D,
  0,
  0,
  0,
  512,
  512,
  512,
  gl.COMPRESSED_R11_EAC,
  textureData,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexImage3D()")}}
- {{domxref("WEBGL_compressed_texture_s3tc")}}
- {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}
- {{domxref("WEBGL_compressed_texture_etc")}}
- {{domxref("WEBGL_compressed_texture_pvrtc")}}
- {{domxref("WEBGL_compressed_texture_astc")}}
- {{domxref("EXT_texture_compression_bptc")}}
- {{domxref("EXT_texture_compression_rgtc")}}