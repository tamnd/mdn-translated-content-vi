---
title: "WebGL2RenderingContext: phương thức texSubImage3D()"
short-title: texSubImage3D()
slug: Web/API/WebGL2RenderingContext/texSubImage3D
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.texSubImage3D
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`texSubImage3D()`** của giao diện {{domxref("WebGL2RenderingContext")}} trong [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một hình chữ nhật con ba chiều cho ảnh texture.

## Cú pháp

```js-nolint
texSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, srcData)
texSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, srcData, srcOffset)
texSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, source)
texSubImage3D(target, level, xoffset, yoffset, zoffset, width, height, depth, format, type, offset)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) của texture đang hoạt động. Các giá trị có thể:
    - `gl.TEXTURE_3D`: Texture ba chiều.
    - `gl.TEXTURE_2D_ARRAY`: Texture mảng hai chiều.
- `level`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định mức chi tiết. Mức 0 là mức hình ảnh cơ sở và mức _n_ là mức giảm mipmap thứ n.
- `xoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset x trong ảnh texture.
- `yoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset y trong ảnh texture.
- `zoffset`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định offset z trong ảnh texture.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của texture tính bằng texel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của texture tính bằng texel.
- `depth`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều sâu của texture/số lượng texture trong một `TEXTURE_2D_ARRAY`.
- `format`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách mỗi phần tử số nguyên trong dữ liệu texel thô sẽ được hiểu là các thành phần màu.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kích thước của mỗi phần tử số nguyên trong dữ liệu texel thô.

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
gl.texSubImage3D(
  gl.TEXTURE_3D,
  0,
  0,
  0,
  0,
  image.width,
  image.height,
  1,
  gl.RGBA,
  gl.UNSIGNED_BYTE,
  image,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGL2RenderingContext.texImage3D()")}}
- {{domxref("WebGL2RenderingContext.compressedTexImage3D()")}}
- {{domxref("WebGL2RenderingContext.copyTexSubImage3D()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("EXT_sRGB")}}
- {{domxref("EXT_texture_norm16")}}