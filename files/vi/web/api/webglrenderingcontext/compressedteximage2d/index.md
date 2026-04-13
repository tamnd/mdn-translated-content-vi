---
title: "WebGLRenderingContext: compressedTexImage2D() method"
short-title: compressedTexImage2D()
slug: Web/API/WebGLRenderingContext/compressedTexImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.compressedTexImage2D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`compressedTexImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một hình ảnh kết cấu hai chiều ở định dạng nén.

Các định dạng ảnh nén chỉ có sẵn thông qua {{domxref("WebGL2RenderingContext")}} hoặc một số [Phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions).

## Cú pháp

```js-nolint
// WebGL 1:
compressedTexImage2D(target, level, internalformat, width, height, border, srcData)

// Additionally available in WebGL 2:
compressedTexImage2D(target, level, internalformat, width, height, border, srcData, srcOffset)
compressedTexImage2D(target, level, internalformat, width, height, border, srcData, srcOffset, srcLengthOverride)
compressedTexImage2D(target, level, internalformat, width, height, border, imageSize, offset)
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
- `internalformat`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng ảnh nén. Các định dạng ảnh nén chỉ có sẵn thông qua {{domxref("WebGL2RenderingContext")}} hoặc một số [Phần mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions). Các giá trị có thể:
    - Khi sử dụng {{domxref("WebGL2RenderingContext")}}:
      - `gl.GL_COMPRESSED_R11_EAC`
      - `gl.GL_COMPRESSED_SIGNED_R11_EAC`
      - `gl.GL_COMPRESSED_RG11_EAC`
      - `gl.GL_COMPRESSED_SIGNED_RG11_EAC`
      - `gl.GL_COMPRESSED_RGB8_ETC2`
      - `gl.GL_COMPRESSED_SRGB8_ETC2`
      - `gl.GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
      - `gl.GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`
      - `gl.GL_COMPRESSED_RGBA8_ETC2_EAC`
      - `gl.GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_s3tc")}}:
      - `ext.COMPRESSED_RGB_S3TC_DXT1_EXT`
      - `ext.COMPRESSED_RGBA_S3TC_DXT1_EXT`
      - `ext.COMPRESSED_RGBA_S3TC_DXT3_EXT`
      - `ext.COMPRESSED_RGBA_S3TC_DXT5_EXT`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}:
      - `ext.COMPRESSED_SRGB_S3TC_DXT1_EXT`
      - `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT`
      - `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT`
      - `ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_etc")}}:
      - `ext.COMPRESSED_R11_EAC`
      - `ext.COMPRESSED_SIGNED_R11_EAC`
      - `ext.COMPRESSED_RG11_EAC`
      - `ext.COMPRESSED_SIGNED_RG11_EAC`
      - `ext.COMPRESSED_RGB8_ETC2`
      - `ext.COMPRESSED_RGBA8_ETC2_EAC`
      - `ext.COMPRESSED_SRGB8_ETC2`
      - `ext.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`
      - `ext.COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
      - `ext.COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_pvrtc")}}:
      - `ext.COMPRESSED_RGB_PVRTC_4BPPV1_IMG`
      - `ext.COMPRESSED_RGBA_PVRTC_4BPPV1_IMG`
      - `ext.COMPRESSED_RGB_PVRTC_2BPPV1_IMG`
      - `ext.COMPRESSED_RGBA_PVRTC_2BPPV1_IMG`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_etc1")}}:
      - `ext.COMPRESSED_RGB_ETC1_WEBGL`

    - Khi sử dụng phần mở rộng {{domxref("WEBGL_compressed_texture_astc")}}:
      - `ext.COMPRESSED_RGBA_ASTC_4x4_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_5x4_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_5x5_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_6x5_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_6x6_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_8x5_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_8x6_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_8x8_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_10x5_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_10x6_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_10x6_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_10x10_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_12x10_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR`
      - `ext.COMPRESSED_RGBA_ASTC_12x12_KHR`, `ext.COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR`

    - Khi sử dụng phần mở rộng {{domxref("EXT_texture_compression_bptc")}}:
      - `ext.COMPRESSED_RGBA_BPTC_UNORM_EXT`
      - `ext.COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT`
      - `ext.COMPRESSED_RGB_BPTC_SIGNED_FLOAT_EXT`
      - `ext.COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_EXT`

    - Khi sử dụng phần mở rộng {{domxref("EXT_texture_compression_rgtc")}}:
      - `ext.COMPRESSED_RED_RGTC1_EXT`
      - `ext.COMPRESSED_SIGNED_RED_RGTC1_EXT`
      - `ext.COMPRESSED_RED_GREEN_RGTC2_EXT`
      - `ext.COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT`

- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của kết cấu bằng texels.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định chiều cao của kết cấu tính bằng texels.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định độ sâu của kết cấu/số lượng kết cấu trong một `TEXTURE_2D_ARRAY`.
- `border`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định độ rộng của đường viền. Phải là 0.

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

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.compressedTexImage2D(
  gl.TEXTURE_2D,
  0,
  ext.COMPRESSED_RGBA_S3TC_DXT5_EXT,
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

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng tiện ích mở rộng WebGL](/en-US/docs/Web/API/WebGL_API/Using_Extensions)
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexSubImage3D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexImage3D()")}}
- {{domxref("WEBGL_compressed_texture_s3tc")}}
- {{domxref("WEBGL_compressed_texture_s3tc_srgb")}}
- {{domxref("WEBGL_compressed_texture_etc")}}
- {{domxref("WEBGL_compressed_texture_pvrtc")}}
- {{domxref("WEBGL_compressed_texture_etc1")}}
- {{domxref("WEBGL_compressed_texture_astc")}}
- {{domxref("EXT_texture_compression_bptc")}}
- {{domxref("EXT_texture_compression_rgtc")}}
