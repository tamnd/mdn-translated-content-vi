---
title: "WebGL2RenderingContext: phương thức texImage3D()"
short-title: texImage3D()
slug: Web/API/WebGL2RenderingContext/texImage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.texImage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`texImage3D()`** của giao diện {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một ảnh texture ba chiều.

## Cú pháp

```js-nolint
texImage3D(target, level, internalformat, width, height, depth, border, format, type, srcData)
texImage3D(target, level, internalformat, width, height, depth, border, format, type, srcData, srcOffset)
texImage3D(target, level, internalformat, width, height, depth, border, format, type, source)
texImage3D(target, level, internalformat, width, height, depth, border, format, type, offset)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức chi tiết. Mức 0 là mức hình ảnh cơ sở và mức _n_ là mức giảm mipmap thứ n.
- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách texture sẽ được lưu trữ sau khi tải.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều sâu của texture/số lượng texture trong một `TEXTURE_2D_ARRAY`.
- `border`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định chiều rộng của viền. Phải là 0.
- `format`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách mỗi phần tử số nguyên trong dữ liệu texel thô sẽ được hiểu là các thành phần màu.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kích thước của mỗi phần tử số nguyên trong dữ liệu texel thô.

    Các giá trị `internalformat`, `format` và `type` phải tương thích với nhau.

Nguồn texture có thể được cung cấp theo một trong ba cách: từ một {{jsxref("ArrayBuffer")}} (có thể chia sẻ) bằng cách sử dụng `srcData` và `srcOffset`; từ một `source` pixel DOM; hoặc từ `gl.PIXEL_UNPACK_BUFFER` bằng cách sử dụng `offset`.

- `srcData`
  - : Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu texture nén.
- `srcOffset` {{optional_inline}}
  - : Một số nguyên chỉ định chỉ mục của `srcData` để bắt đầu đọc. Mặc định là `0`.
- `source`
  - : Đọc từ một nguồn pixel DOM, có thể là một trong:
    - {{domxref("ImageBitmap")}}
    - {{domxref("ImageData")}}
    - {{domxref("HTMLImageElement")}}
    - {{domxref("HTMLCanvasElement")}}
    - {{domxref("HTMLVideoElement")}}
    - {{domxref("OffscreenCanvas")}}
    - {{domxref("VideoFrame")}}
- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định địa chỉ bắt đầu trong bộ đệm được liên kết với `gl.PIXEL_UNPACK_BUFFER`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.texImage3D(
  gl.TEXTURE_3D,
  0, // level
  gl.RGBA, // internalFormat
  1, // width
  1, // height
  1, // depth
  0, // border
  gl.RGBA, // format
  gl.UNSIGNED_BYTE, // type
  new Uint8Array([0xff, 0x00, 0x00, 0x00]),
); // data
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGL2RenderingContext.texSubImage3D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexImage3D()")}}
- {{domxref("WebGL2RenderingContext.copyTexSubImage3D()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("WEBGL_depth_texture")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("EXT_texture_norm16")}}
- {{domxref("EXT_sRGB")}}