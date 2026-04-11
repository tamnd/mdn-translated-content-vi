---
title: "WebGLRenderingContext: texSubImage2D() method"
short-title: texSubImage2D()
slug: Web/API/WebGLRenderingContext/texSubImage2D
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.texSubImage2D
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`texSubImage2D()`** của giao diện {{domxref("WebGLRenderingContext")}} của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định hình chữ nhật phụ hai chiều cho hình ảnh kết cấu.

## Cú pháp

```js-nolint
// WebGL 1:
texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, srcData)
texSubImage2D(target, level, xoffset, yoffset, format, type, source)

// Additionally available in WebGL 2:
texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, srcData, srcOffset)
texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, source)
texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, offset)
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
- `xoffset`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ texel x phía dưới bên trái của tiểu vùng hình chữ nhật có chiều rộng theo chiều cao và chiều rộng của mảng kết cấu.
- `yoffset`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ texel y phía dưới bên trái của tiểu vùng hình chữ nhật có chiều rộng và chiều cao của mảng kết cấu.
- `width`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của họa tiết bằng texels.
- `height`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của họa tiết tính bằng texels.
- `format`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách mỗi phần tử số nguyên trong dữ liệu texel thô sẽ được hiểu là thành phần màu. Các giá trị có thể:
    - `gl.ALPHA`: Loại bỏ các thành phần màu đỏ, xanh lá cây và xanh lam và đọc thành phần alpha.
    - `gl.RGB`: Loại bỏ các thành phần alpha và đọc các thành phần màu đỏ, lục và lam.
    - `gl.RGBA`: Các thành phần màu đỏ, xanh lá cây, xanh dương và alpha được đọc từ bộ đệm màu.
    - `gl.LUMINANCE`: Mỗi thành phần màu là một thành phần độ chói, alpha là 1,0.
    - `gl.LUMINANCE_ALPHA`: Mỗi thành phần là một thành phần độ chói/alpha.

Khi sử dụng tiện ích mở rộng {{domxref("EXT_sRGB")}}:
    - `ext.SRGB_EXT`
    - `ext.SRGB_ALPHA_EXT`

Khi sử dụng {{domxref("WebGL2RenderingContext")}}, các giá trị sau đây cũng có sẵn:
    - `gl.RED`
    - `gl.RED_INTEGER`
    - `gl.RG`
    - `gl.RG_INTEGER`
    - `gl.RGB_INTEGER`
    - `gl.RGBA_INTEGER`
    - `gl.DEPTH_COMPONENT`
    - `gl.DEPTH_STENCIL`

- `type`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kích thước của từng phần tử số nguyên trong dữ liệu texel thô. Để biết các kết hợp `format` và `type` có sẵn, hãy xem {{domxref("WebGLRenderingContext.texImage2D()")}}.

Nguồn kết cấu có thể được cung cấp theo một trong ba cách: từ {{jsxref("ArrayBuffer")}} (có thể được chia sẻ) bằng cách sử dụng `srcData` và `srcOffset`; từ pixel DOM `source`; hoặc, trong WebGL 2, từ `gl.PIXEL_UNPACK_BUFFER` sử dụng `offset`.

- `srcData`
  - : {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa dữ liệu kết cấu đã nén. Loại của nó phải khớp với tham số `type`; xem {{domxref("WebGLRenderingContext.texImage2D()")}}.
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
gl.texSubImage2D(gl.TEXTURE_2D, 0, 0, 0, gl.RGBA, gl.UNSIGNED_BYTE, image);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("EXT_sRGB")}}
- {{domxref("EXT_texture_norm16")}}
