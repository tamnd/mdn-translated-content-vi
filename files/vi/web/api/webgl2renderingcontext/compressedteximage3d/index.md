---
title: "WebGL2RenderingContext: phương thức compressedTexImage3D()"
short-title: compressedTexImage3D()
slug: Web/API/WebGL2RenderingContext/compressedTexImage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.compressedTexImage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`compressedTexImage3D()`** của giao diện {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một ảnh texture ba chiều ở định dạng nén.

## Cú pháp

```js-nolint
compressedTexImage3D(target, level, internalformat, width, height, depth, border, imageSize, offset)

compressedTexImage3D(target, level, internalformat, width, height, depth, border, srcData)
compressedTexImage3D(target, level, internalformat, width, height, depth, border, srcData, srcOffset)
compressedTexImage3D(target, level, internalformat, width, height, depth, border, srcData, srcOffset, srcLengthOverride)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture nén đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức chi tiết. Mức 0 là mức hình ảnh cơ sở và mức _n_ là mức giảm mipmap thứ n.
- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng ảnh nén. Để biết danh sách các giá trị có thể, xem {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều sâu của texture/số lượng texture trong một `TEXTURE_2D_ARRAY`.
- `border`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định chiều rộng của viền. Phải là 0.

Nguồn texture có thể được cung cấp theo một trong hai cách: từ một {{jsxref("ArrayBuffer")}} (có thể chia sẻ) bằng cách sử dụng `srcData`, `srcOffset` và `srcLengthOverride`; hoặc từ `gl.PIXEL_UNPACK_BUFFER` bằng cách sử dụng `imageSize` và `offset`.

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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGL2RenderingContext.compressedTexSubImage3D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WEBGL_compressed_texture_s3tc")}}
- {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}
- {{domxref("WEBGL_compressed_texture_etc")}}
- {{domxref("WEBGL_compressed_texture_pvrtc")}}
- {{domxref("WEBGL_compressed_texture_etc1")}}
- {{domxref("WEBGL_compressed_texture_astc")}}
- {{domxref("EXT_texture_compression_bptc")}}
- {{domxref("EXT_texture_compression_rgtc")}}