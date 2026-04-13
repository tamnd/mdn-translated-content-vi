---
title: "WebGL2RenderingContext: phương thức blitFramebuffer()"
short-title: blitFramebuffer()
slug: Web/API/WebGL2RenderingContext/blitFramebuffer
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.blitFramebuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.blitFramebuffer()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truyền một khối pixel từ framebuffer đọc sang framebuffer vẽ. Framebuffer đọc và vẽ được liên kết bằng {{domxref("WebGLRenderingContext.bindFramebuffer()")}}.

## Cú pháp

```js-nolint
blitFramebuffer(srcX0, srcY0, srcX1, srcY1,
                dstX0, dstY0, dstX1, dstY1,
                mask, filter)
```

### Tham số

- `srcX0`, `srcY0`, `srcX1`, `srcY1`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định ranh giới của hình chữ nhật nguồn.
- `dstX0`, `dstY0`, `dstX1`, `dstY1`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định ranh giới của hình chữ nhật đích.
- `mask`
  - : Một {{domxref("WebGL_API/Types", "GLbitfield")}} chỉ định mặt nạ bitwise OR cho biết bộ đệm nào sẽ được sao chép. Các giá trị có thể:
    - `gl.COLOR_BUFFER_BIT`
    - `gl.DEPTH_BUFFER_BIT`
    - `gl.STENCIL_BUFFER_BIT`

- `filter`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định phép nội suy sẽ áp dụng nếu hình ảnh bị kéo giãn. Các giá trị có thể:
    - `gl.NEAREST`
    - `gl.LINEAR`

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.blitFramebuffer(
  0,
  0,
  canvas.width,
  canvas.height,
  0,
  0,
  canvas.width,
  canvas.height,
  gl.COLOR_BUFFER_BIT,
  gl.NEAREST,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindFramebuffer()")}}
- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}
