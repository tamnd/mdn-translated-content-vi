---
title: "WebGLRenderingContext: renderbufferStorage() method"
short-title: renderbufferStorage()
slug: Web/API/WebGLRenderingContext/renderbufferStorage
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.renderbufferStorage
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.renderbufferStorage()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo kho dữ liệu của đối tượng renderbuffer.

## Cú pháp

```js-nolint
renderbufferStorage(target, internalFormat, width, height)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định đối tượng bộ đệm kết xuất mục tiêu. Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Bộ đệm lưu trữ dữ liệu cho các hình ảnh đơn lẻ ở định dạng bên trong có thể hiển thị.

- `internalFormat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng bên trong của bộ đệm kết xuất. Khả thi
giá trị:
    - `gl.RGBA4`: 4 bit đỏ, 4 bit xanh lục, 4 bit xanh dương 4 bit alpha.
    - `gl.RGB565`: 5 bit đỏ, 6 bit xanh lục, 5 bit xanh lam.
    - `gl.RGB5_A1`: 5 bit đỏ, 5 bit xanh lục, 5 bit xanh dương, 1 bit alpha.
    - `gl.DEPTH_COMPONENT16`: 16 bit độ sâu.
    - `gl.STENCIL_INDEX8`: 8 bit stencil.
    - `gl.DEPTH_STENCIL`

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.R8`
    - `gl.R8UI`
    - `gl.R8I`
    - `gl.R16UI`
    - `gl.R16I`
    - `gl.R32UI`
    - `gl.R32I`
    - `gl.RG8`
    - `gl.RG8UI`
    - `gl.RG8I`
    - `gl.RG16UI`
    - `gl.RG16I`
    - `gl.RG32UI`
    - `gl.RG32I`
    - `gl.RGB8`
    - `gl.RGBA8`
    - `gl.SRGB8_ALPHA8` (cũng có sẵn dưới dạng phần mở rộng cho WebGL 1, xem bên dưới)
    - `gl.RGB10_A2`
    - `gl.RGBA8UI`
    - `gl.RGBA8I`
    - `gl.RGB10_A2UI`
    - `gl.RGBA16UI`
    - `gl.RGBA16I`
    - `gl.RGBA32I`
    - `gl.RGBA32UI`
    - `gl.DEPTH_COMPONENT24`
    - `gl.DEPTH_COMPONENT32F`
    - `gl.DEPTH24_STENCIL8`
    - `gl.DEPTH32F_STENCIL8`

Khi sử dụng phần mở rộng {{domxref("WEBGL_color_buffer_float")}}:
    - `ext.RGBA32F_EXT`: RGBA loại dấu phẩy động 32-bit.
    - `ext.RGB32F_EXT`: Loại dấu phẩy động RGB 32-bit.

Khi sử dụng phần mở rộng {{domxref("EXT_sRGB")}}:
    - `ext.SRGB8_ALPHA8_EXT`: sRGB 8-bit và alpha.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}} và phần mở rộng {{domxref("EXT_color_buffer_float")}}:
    - `gl.R16F`
    - `gl.RG16F`
    - `gl.RGBA16F`
    - `gl.R32F`
    - `gl.RG32F`
    - `gl.RGBA32F`
    - `gl.R11F_G11F_B10F`

- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định độ rộng của vùng đệm kết xuất tính bằng pixel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} xác định chiều cao của vùng đệm kết xuất tính bằng pixel.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA4, 256, 256);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}
- {{domxref("WEBGL_color_buffer_float")}}
- {{domxref("EXT_sRGB")}}
- {{domxref("EXT_color_buffer_float")}}
- {{domxref("EXT_texture_norm16")}}
