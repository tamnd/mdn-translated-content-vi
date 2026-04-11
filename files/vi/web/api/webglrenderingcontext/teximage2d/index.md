---
title: "WebGLRenderingContext: texImage2D() method"
short-title: texImage2D()
slug: Web/API/WebGLRenderingContext/texImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.texImage2D
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`texImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định hình ảnh kết cấu hai chiều.

## Cú pháp

```js-nolint
// WebGL 1:
texImage2D(target, level, internalformat, width, height, border, format, type, srcData)
texImage2D(target, level, internalformat, format, type, source)

// Additionally available in WebGL 2:
texImage2D(target, level, internalformat, width, height, border, format, type, srcData, srcOffset)
texImage2D(target, level, internalformat, width, height, border, format, type, source)
texImage2D(target, level, internalformat, width, height, border, format, type, offset)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích) của kết cấu đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_2D`: Kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_X`: Mặt X dương cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_X`: Mặt X âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Y`: Mặt Y dương cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Y`: Mặt Y âm cho kết cấu được ánh xạ hình khối.
    - `gl.TEXTURE_CUBE_MAP_POSITIVE_Z`: Mặt Z dương cho kết cấu dạng khối lập phương.
    - `gl.TEXTURE_CUBE_MAP_NEGATIVE_Z`: Mặt Z âm cho kết cấu được ánh xạ hình khối.
- `level`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức độ chi tiết. Cấp 0 là cấp độ hình ảnh cơ sở và cấp độ _n_ là cấp độ giảm mipmap thứ n.
- `internalformat`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách lưu trữ kết cấu sau khi được tải. Xem bên dưới để biết các giá trị có sẵn.
- `width`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của họa tiết bằng texels.
- `height`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của họa tiết tính bằng texels.
- `border`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định chiều rộng của đường viền. Phải là 0.
- `format`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách mỗi phần tử số nguyên trong dữ liệu texel thô sẽ được hiểu là thành phần màu. Trong WebGL 1, giá trị này phải giống với `internalformat`. Xem bên dưới để biết các giá trị có sẵn.
- `type`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kích thước của từng phần tử số nguyên trong dữ liệu texel thô.

Các giá trị `internalformat`, `format` và `type` phải tương thích với nhau. Các kết hợp có thể có trong cả WebGL 1 và WebGL 2 (các định dạng bên trong này là _unsized_ vì bạn không thể chỉ định mỗi pixel chiếm bao nhiêu byte bên trong):

    | `internalformat`  | `format`          | `type`                   | Input bytes per pixel | Input pixel layout (bits per channel) |
    | ----------------- | ----------------- | ------------------------ | --------------------- | ------------------------------------- |
    | `RGB`             | `RGB`             | `UNSIGNED_BYTE`          | 3                     | (R, G, B) = (8, 8, 8)                 |
    | `RGB`             | `RGB`             | `UNSIGNED_SHORT_5_6_5`   | 2                     | (R, G, B) = (5, 6, 5)                 |
    | `RGBA`            | `RGBA`            | `UNSIGNED_BYTE`          | 4                     | (R, G, B, A) = (8, 8, 8, 8)           |
    | `RGBA`            | `RGBA`            | `UNSIGNED_SHORT_4_4_4_4` | 2                     | (R, G, B, A) = (4, 4, 4, 4)           |
    | `RGBA`            | `RGBA`            | `UNSIGNED_SHORT_5_5_5_1` | 2                     | (R, G, B, A) = (5, 5, 5, 1)           |
    | `LUMINANCE_ALPHA` | `LUMINANCE_ALPHA` | `UNSIGNED_BYTE`          | 2                     | (L, A) = (8, 8)                       |
    | `LUMINANCE`       | `LUMINANCE`       | `UNSIGNED_BYTE`          | 1                     | (L) = (8)                             |
    | `ALPHA`           | `ALPHA`           | `UNSIGNED_BYTE`          | 1                     | (A) = (8)                             |

Khi tiện ích mở rộng {{domxref("OES_texture_float")}} được bật, `type` cũng có thể là `FLOAT`. Khi tiện ích mở rộng {{domxref("OES_texture_half_float")}} được bật, `type` cũng có thể là `ext.HALF_FLOAT_OES` (hằng số do tiện ích mở rộng cung cấp).

Khi tiện ích mở rộng {{domxref("EXT_sRGB")}} được bật, `internalformat` cũng có thể là `ext.SRGB_EXT` hoặc `ext.SRGB_ALPHA_EXT`.

Trong WebGL 2, khi chỉ định nguồn là `srcData` hoặc `offset`, các kết hợp sau đây cũng có sẵn (các định dạng bên trong này có kích thước _vì bố cục pixel bên trong được chỉ định chính xác; chúng tôi bỏ qua bố cục đầu vào ở đây vì nó hoạt động tương tự như bố cục ở trên):

    | `internalformat` | `format`       | `type`                                                                   | Internal pixel layout                   | Color renderable | Texture filterable |
    | ---------------- | -------------- | ------------------------------------------------------------------------ | --------------------------------------- | ---------------- | ------------------ |
    | `R8`             | `RED`          | `UNSIGNED_BYTE`                                                          | (R) = (8)                               | Y                | Y                  |
    | `R8_SNORM`       | `RED`          | `BYTE`                                                                   | (R) = (s8)                              |                  | Y                  |
    | `R16F`           | `RED`          | `HALF_FLOAT`, `FLOAT`                                                    | (R) = (f16)                             |                  | Y                  |
    | `R32F`           | `RED`          | `FLOAT`                                                                  | (R) = (f32)                             |                  |                    |
    | `R8UI`           | `RED_INTEGER`  | `UNSIGNED_BYTE`                                                          | (R) = (ui8)                             | Y                |                    |
    | `R8I`            | `RED_INTEGER`  | `BYTE`                                                                   | (R) = (i8)                              | Y                |                    |
    | `R16UI`          | `RED_INTEGER`  | `UNSIGNED_SHORT`                                                         | (R) = (ui16)                            | Y                |                    |
    | `R16I`           | `RED_INTEGER`  | `SHORT`                                                                  | (R) = (i16)                             | Y                |                    |
    | `R32UI`          | `RED_INTEGER`  | `UNSIGNED_INT`                                                           | (R) = (ui32)                            | Y                |                    |
    | `R32I`           | `RED_INTEGER`  | `INT`                                                                    | (R) = (i32)                             | Y                |                    |
    | `RG8`            | `RG`           | `UNSIGNED_BYTE`                                                          | (R, G) = (8, 8)                         | Y                | Y                  |
    | `RG8_SNORM`      | `RG`           | `BYTE`                                                                   | (R, G) = (s8, s8)                       |                  | Y                  |
    | `RG16F`          | `RG`           | `HALF_FLOAT`, `FLOAT`                                                    | (R, G) = (f16, f16)                     |                  | Y                  |
    | `RG32F`          | `RG`           | `FLOAT`                                                                  | (R, G) = (f32, f32)                     |                  |                    |
    | `RG8UI`          | `RG_INTEGER`   | `UNSIGNED_BYTE`                                                          | (R, G) = (ui8, ui8)                     | Y                |                    |
    | `RG8I`           | `RG_INTEGER`   | `BYTE`                                                                   | (R, G) = (i8, i8)                       | Y                |                    |
    | `RG16UI`         | `RG_INTEGER`   | `UNSIGNED_SHORT`                                                         | (R, G) = (ui16, ui16)                   | Y                |                    |
    | `RG16I`          | `RG_INTEGER`   | `SHORT`                                                                  | (R, G) = (i16, i16)                     | Y                |                    |
    | `RG32UI`         | `RG_INTEGER`   | `UNSIGNED_INT`                                                           | (R, G) = (ui32, ui32)                   | Y                |                    |
    | `RG32I`          | `RG_INTEGER`   | `INT`                                                                    | (R, G) = (i32, i32)                     | Y                |                    |
    | `RGB8`           | `RGB`          | `UNSIGNED_BYTE`                                                          | (R, G, B) = (8, 8, 8)                   | Y                | Y                  |
    | `SRGB8`          | `RGB`          | `UNSIGNED_BYTE`                                                          | (R, G, B) = (8, 8, 8)                   |                  | Y                  |
    | `RGB565`         | `RGB`          | `UNSIGNED_BYTE`, `UNSIGNED_SHORT_5_6_5`                                  | (R, G, B) = (5, 6, 5)                   | Y                | Y                  |
    | `RGB8_SNORM`     | `RGB`          | `BYTE`                                                                   | (R, G, B) = (s8, s8, s8)                |                  | Y                  |
    | `R11F_G11F_B10F` | `RGB`          | `UNSIGNED_INT_10F_11F_11F_REV`, `HALF_FLOAT`, `FLOAT`                    | (R, G, B) = (f11, f11, f10)             |                  | Y                  |
    | `RGB9_E5`        | `RGB`          | `UNSIGNED_INT_5_9_9_9_REV`, `HALF_FLOAT`, `FLOAT`                        | (R, G, B) = (f9, f9, f9), 5 shared bits |                  | Y                  |
    | `RGB16F`         | `RGB`          | `HALF_FLOAT`, `FLOAT`                                                    | (R, G, B) = (f16, f16, f16)             |                  | Y                  |
    | `RGB32F`         | `RGB`          | `FLOAT`                                                                  | (R, G, B) = (f32, f32, f32)             |                  |                    |
    | `RGB8UI`         | `RGB_INTEGER`  | `UNSIGNED_BYTE`                                                          | (R, G, B) = (ui8, ui8, ui8)             | Y                |                    |
    | `RGB8I`          | `RGB_INTEGER`  | `BYTE`                                                                   | (R, G, B) = (i8, i8, i8)                | Y                |                    |
    | `RGB16UI`        | `RGB_INTEGER`  | `UNSIGNED_SHORT`                                                         | (R, G, B) = (ui16, ui16, ui16)          | Y                |                    |
    | `RGB16I`         | `RGB_INTEGER`  | `SHORT`                                                                  | (R, G, B) = (i16, i16, i16)             | Y                |                    |
    | `RGB32UI`        | `RGB_INTEGER`  | `UNSIGNED_INT`                                                           | (R, G, B) = (ui32, ui32, ui32)          | Y                |                    |
    | `RGB32I`         | `RGB_INTEGER`  | `INT`                                                                    | (R, G, B) = (i32, i32, i32)             | Y                |                    |
    | `RGBA8`          | `RGBA`         | `UNSIGNED_BYTE`                                                          | (R, G, B, A) = (8, 8, 8, 8)             | Y                | Y                  |
    | `SRGB8_ALPHA8`   | `RGBA`         | `UNSIGNED_BYTE`                                                          | (R, G, B, A) = (8, 8, 8, 8)             | Y                | Y                  |
    | `RGBA8_SNORM`    | `RGBA`         | `BYTE`                                                                   | (R, G, B, A) = (s8, s8, s8, s8)         |                  | Y                  |
    | `RGB5_A1`        | `RGBA`         | `UNSIGNED_BYTE`, `UNSIGNED_SHORT_5_5_5_1`, `UNSIGNED_INT_2_10_10_10_REV` | (R, G, B, A) = (5, 5, 5, 1)             | Y                | Y                  |
    | `RGBA4`          | `RGBA`         | `UNSIGNED_BYTE`, `UNSIGNED_SHORT_4_4_4_4`                                | (R, G, B, A) = (4, 4, 4, 4)             | Y                | Y                  |
    | `RGB10_A2`       | `RGBA`         | `UNSIGNED_INT_2_10_10_10_REV`                                            | (R, G, B, A) = (10, 10, 10, 2)          | Y                | Y                  |
    | `RGBA16F`        | `RGBA`         | `HALF_FLOAT`, `FLOAT`                                                    | (R, G, B, A) = (f16, f16, f16, f16)     |                  | Y                  |
    | `RGBA32F`        | `RGBA`         | `FLOAT`                                                                  | (R, G, B, A) = (f32, f32, f32, f32)     |                  |                    |
    | `RGBA8UI`        | `RGBA_INTEGER` | `UNSIGNED_BYTE`                                                          | (R, G, B, A) = (ui8, ui8, ui8, ui8)     | Y                |                    |
    | `RGBA8I`         | `RGBA_INTEGER` | `BYTE`                                                                   | (R, G, B, A) = (i8, i8, i8, i8)         | Y                |                    |
    | `RGBA10_A2UI`    | `RGBA_INTEGER` | `UNSIGNED_INT_2_10_10_10_REV`                                            | (R, G, B, A) = (ui10, ui10, ui10, ui2)  | Y                |                    |
    | `RGBA16UI`       | `RGBA_INTEGER` | `UNSIGNED_SHORT`                                                         | (R, G, B, A) = (ui16, ui16, ui16, ui16) | Y                |                    |
    | `RGBA16I`        | `RGBA_INTEGER` | `SHORT`                                                                  | (R, G, B, A) = (i16, i16, i16, i16)     | Y                |                    |
    | `RGBA32UI`       | `RGBA_INTEGER` | `UNSIGNED_INT`                                                           | (R, G, B, A) = (ui32, ui32, ui32, ui32) | Y                |                    |
    | `RGBA32I`        | `RGBA_INTEGER` | `INT`                                                                    | (R, G, B, A) = (i32, i32, i32, i32)     | Y                |                    |

Trong WebGL 2, khi chỉ định nguồn là `srcData` hoặc `offset`, các kết hợp sau đây cũng có sẵn và chúng có thể được bật trong WebGL 1 thông qua tiện ích mở rộng {{domxref("WEBGL_depth_texture")}}:

    | `internalformat`     | `format`          | `type`                                              | Internal pixel layout |
    | -------------------- | ----------------- | --------------------------------------------------- | --------------------- |
    | `DEPTH_COMPONENT16`  | `DEPTH_COMPONENT` | `UNSIGNED_SHORT`, `UNSIGNED_INT`                    | (D) = (16)            |
    | `DEPTH_COMPONENT24`  | `DEPTH_COMPONENT` | `UNSIGNED_INT`                                      | (D) = (24)            |
    | `DEPTH_COMPONENT32F` | `DEPTH_COMPONENT` | `FLOAT`                                             | (D) = (f32)           |
    | `DEPTH24_STENCIL8`   | `DEPTH_STENCIL`   | `UNSIGNED_INT_24_8` (`ext.UNSIGNED_INT_24_8_WEBGL`) | (D, S) = (24, 8)      |
    | `DEPTH32F_STENCIL8`  | `DEPTH_STENCIL`   | `FLOAT_32_UNSIGNED_INT_24_8_REV`                    | (D, S) = (f32, 8)     |

Khi nguồn dữ liệu là nguồn pixel DOM, thông thường biểu diễn của mỗi kênh là loại số nguyên không dấu có ít nhất 8 bit. Việc chuyển đổi biểu diễn đó thành số nguyên có dấu hoặc số nguyên không dấu có nhiều bit hơn không được xác định rõ ràng. Ví dụ: khi chuyển đổi `RGBA8` thành `RGBA16UI`, không rõ liệu có ý định tăng tỷ lệ giá trị lên phạm vi đầy đủ của số nguyên không dấu 16 bit hay không. Do đó, chỉ cho phép chuyển đổi sang số nguyên không dấu tối đa 8 bit, nửa float hoặc float.

Nguồn kết cấu có thể được cung cấp theo một trong ba cách: từ {{jsxref("ArrayBuffer")}} (có thể được chia sẻ) bằng cách sử dụng `srcData` và `srcOffset`; từ pixel DOM `source`; hoặc, trong WebGL 2, từ `gl.PIXEL_UNPACK_BUFFER` sử dụng `offset`.

- `srcData`
  - : {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu kết cấu đã nén. Loại của nó phải khớp với tham số `type`:

    | `srcData` type                                            | `type` value                                                                                                                   |
    | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
    | {{jsxref("Int8Array")}}                                   | `BYTE`                                                                                                                         |
    | {{jsxref("Uint8Array")}}, {{jsxref("Uint8ClampedArray")}} | `UNSIGNED_BYTE`                                                                                                                |
    | {{jsxref("Int16Array")}}                                  | `SHORT`                                                                                                                        |
    | {{jsxref("Uint16Array")}}                                 | `UNSIGNED_SHORT`, `UNSIGNED_SHORT_5_6_5`, `UNSIGNED_SHORT_5_5_5_1`, `UNSIGNED_SHORT_4_4_4_4`, `HALF_FLOAT`                     |
    | {{jsxref("Int32Array")}}                                  | `INT`                                                                                                                          |
    | {{jsxref("Uint32Array")}}                                 | `UNSIGNED_INT`, `UNSIGNED_INT_5_9_9_9_REV`, `UNSIGNED_INT_2_10_10_10_REV`, `UNSIGNED_INT_10F_11F_11F_REV`, `UNSIGNED_INT_24_8` |
    | {{jsxref("Float32Array")}}                                | `FLOAT`                                                                                                                        |

Khi `type` là `FLOAT_32_UNSIGNED_INT_24_8_REV`, `srcData` phải là `null`.

- `srcOffset` {{optional_inline}}
  - : (chỉ WebGL 2) Một số nguyên chỉ định chỉ mục của `srcData` để bắt đầu đọc từ đó. Mặc định là `0`.
- `source`
  - : Đọc từ nguồn pixel DOM, có thể là một trong:
    - {{domxref("ImageBitmap")}}
    - {{domxref("ImageData")}}
    - {{domxref("HTMLImageElement")}}
    - {{domxref("HTMLCanvasElement")}}
    - {{domxref("HTMLVideoElement")}}
    - {{domxref("OffscreenCanvas")}}
    - {{domxref("VideoFrame")}}

Trong WebGL 1, `width` và `height` luôn được suy ra từ nguồn. Trong WebGL 2, chúng cũng có thể được chỉ định rõ ràng.

- `offset`
  - : (chỉ WebGL 2) A {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định địa chỉ bắt đầu trong bộ đệm được liên kết với `gl.PIXEL_UNPACK_BUFFER`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, image);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("WEBGL_depth_texture")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("EXT_texture_norm16")}}
- {{domxref("EXT_sRGB")}}
