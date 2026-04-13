---
title: "WebGL2RenderingContext: phương thức renderbufferStorageMultisample()"
short-title: renderbufferStorageMultisample()
slug: Web/API/WebGL2RenderingContext/renderbufferStorageMultisample
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.renderbufferStorageMultisample
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.renderbufferStorageMultisample()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo kho dữ liệu của đối tượng renderbuffer và cho phép chỉ định số lượng mẫu sẽ sử dụng.

## Cú pháp

```js-nolint
renderbufferStorageMultisample(target, samples, internalFormat, width, height)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định đối tượng renderbuffer target. Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Lưu trữ dữ liệu bộ đệm cho hình ảnh đơn lẻ ở định dạng nội bộ có thể kết xuất.

- `samples`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng mẫu sẽ sử dụng cho lưu trữ renderbuffer.
- `internalFormat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng nội bộ của renderbuffer. Các giá trị có thể (`gl.DEPTH_STENCIL` không được hỗ trợ):
    - `gl.R8`, `gl.R8UI`, `gl.R8I`, `gl.R16UI`, `gl.R16I`, `gl.R32UI`, `gl.R32I`
    - `gl.RG8`, `gl.RG8UI`, `gl.RG8I`, `gl.RG16UI`, `gl.RG16I`, `gl.RG32UI`, `gl.RG32I`
    - `gl.RGB8`, `gl.RGBA8`, `gl.SRGB8_ALPHA8`, `gl.RGBA4`, `gl.RGB565`, `gl.RGB5_A1`, `gl.RGB10_A2`
    - `gl.RGBA8UI`, `gl.RGBA8I`, `gl.RGB10_A2UI`, `gl.RGBA16UI`, `gl.RGBA16I`, `gl.RGBA32I`, `gl.RGBA32UI`
    - `gl.DEPTH_COMPONENT16`, `gl.DEPTH_COMPONENT24`, `gl.DEPTH_COMPONENT32F`
    - `gl.DEPTH_STENCIL`, `gl.DEPTH24_STENCIL8`, `gl.DEPTH32F_STENCIL8`
    - `gl.STENCIL_INDEX8`

- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của renderbuffer tính bằng pixel.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều cao của renderbuffer tính bằng pixel.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.renderbufferStorageMultisample(gl.RENDERBUFFER, 4, gl.RGBA4, 256, 256);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}