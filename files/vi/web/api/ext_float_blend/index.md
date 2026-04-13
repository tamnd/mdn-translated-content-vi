---
title: EXT_float_blend extension
short-title: EXT_float_blend
slug: Web/API/EXT_float_blend
page-type: webgl-extension
browser-compat: api.EXT_float_blend
---

{{APIRef("WebGL")}}

Phần mở rộng `EXT_float_blend` của [WebGL API](/en-US/docs/Web/API/WebGL_API) cho phép blending và draw buffers với các thành phần dấu phẩy động 32-bit.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này có sẵn cho cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}. Tuy nhiên, để sử dụng nó, bạn cần bật sử dụng draw buffers dấu phẩy động 32-bit bằng cách bật phần mở rộng {{domxref("WEBGL_color_buffer_float")}} (cho WebGL1) hoặc {{domxref("EXT_color_buffer_float")}} (cho WebGL2). Làm như vậy sẽ tự động bật `EXT_float_blend` nếu `EXT_float_blend` cũng được hỗ trợ.

Khi phần mở rộng này được bật, việc gọi {{domxref("WebGLRenderingContext.drawArrays", "drawArrays()")}} hoặc {{domxref("WebGLRenderingContext.drawElements", "drawElements()")}} với blending được bật và draw buffer có các thành phần dấu phẩy động 32-bit sẽ không còn gây ra lỗi `INVALID_OPERATION`.

## Ví dụ

```js
const gl = canvas.getContext("webgl2");

// enable necessary extensions
gl.getExtension("EXT_color_buffer_float");
gl.getExtension("EXT_float_blend");

const tex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, tex);

// use floating point format
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA32F, 1, 1, 0, gl.RGBA, gl.FLOAT, null);

const fb = gl.createFramebuffer();
gl.bindFramebuffer(gl.FRAMEBUFFER, fb);
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  gl.TEXTURE_2D,
  tex,
  0,
);

// enable blending
gl.enable(gl.BLEND);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("EXT_color_buffer_float")}}
- {{domxref("WEBGL_color_buffer_float")}}
