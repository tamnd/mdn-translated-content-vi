---
title: Tiện ích mở rộng WEBGL_draw_buffers
short-title: WEBGL_draw_buffers
slug: Web/API/WEBGL_draw_buffers
page-type: webgl-extension
browser-compat: api.WEBGL_draw_buffers
---

{{APIRef("WebGL")}}

Tiện ích mở rộng **`WEBGL_draw_buffers`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép fragment shader ghi vào nhiều texture, điều này rất hữu ích cho [deferred shading](https://hacks.mozilla.org/2014/01/webgl-deferred-shading/) chẳng hạn.

Các tiện ích mở rộng WebGL có thể dùng qua phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [WebGL tutorial](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích mở rộng này chỉ khả dụng với ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của tiện ích mở rộng này có sẵn theo mặc định trên ngữ cảnh WebGL2. Trong WebGL 2, các hằng số có sẵn mà không cần hậu tố "WEBGL" và các GLSL built-in mới yêu cầu GLSL `#version 300 es`.

## Hằng số

Tiện ích mở rộng này cung cấp các hằng số mới, có thể dùng trong các phương thức {{domxref("WebGLRenderingContext.framebufferRenderbuffer()", "gl.framebufferRenderbuffer()")}}, {{domxref("WebGLRenderingContext.framebufferTexture2D()", "gl.framebufferTexture2D()")}}, {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter()", "gl.getFramebufferAttachmentParameter()")}} {{domxref("WEBGL_draw_buffers.drawBuffersWEBGL()", "ext.drawBuffersWEBGL()")}}, và {{domxref("WebGLRenderingContext.getParameter()", "gl.getParameter()")}}.

- `ext.COLOR_ATTACHMENT0_WEBGL`, `ext.COLOR_ATTACHMENT1_WEBGL`, `ext.COLOR_ATTACHMENT2_WEBGL`, `ext.COLOR_ATTACHMENT3_WEBGL`, `ext.COLOR_ATTACHMENT4_WEBGL`, `ext.COLOR_ATTACHMENT5_WEBGL`, `ext.COLOR_ATTACHMENT6_WEBGL`, `ext.COLOR_ATTACHMENT7_WEBGL`, `ext.COLOR_ATTACHMENT8_WEBGL`, `ext.COLOR_ATTACHMENT9_WEBGL`, `ext.COLOR_ATTACHMENT10_WEBGL`, `ext.COLOR_ATTACHMENT11_WEBGL`, `ext.COLOR_ATTACHMENT12_WEBGL`, `ext.COLOR_ATTACHMENT13_WEBGL`, `ext.COLOR_ATTACHMENT14_WEBGL`, `ext.COLOR_ATTACHMENT15_WEBGL`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định bộ đệm màu.
- `ext.DRAW_BUFFER0_WEBGL`, `ext.DRAW_BUFFER1_WEBGL`, `ext.DRAW_BUFFER2_WEBGL`, `ext.DRAW_BUFFER3_WEBGL`, `ext.DRAW_BUFFER4_WEBGL`, `ext.DRAW_BUFFER5_WEBGL`, `ext.DRAW_BUFFER6_WEBGL`, `ext.DRAW_BUFFER7_WEBGL`, `ext.DRAW_BUFFER8_WEBGL ext.DRAW_BUFFER9_WEBGL`, `ext.DRAW_BUFFER10_WEBGL`, `ext.DRAW_BUFFER11_WEBGL`, `ext.DRAW_BUFFER12_WEBGL`, `ext.DRAW_BUFFER13_WEBGL`, `ext.DRAW_BUFFER14_WEBGL`, `ext.DRAW_BUFFER15_WEBGL`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} trả về draw buffer.
- `ext.MAX_COLOR_ATTACHMENTS_WEBGL`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} cho biết số điểm gắn màu tối đa của framebuffer.
- `ext.MAX_DRAW_BUFFERS_WEBGL`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} cho biết số draw buffer tối đa.

## Phương thức phiên bản

Tiện ích mở rộng này cung cấp một phương thức mới.

- {{domxref("WEBGL_draw_buffers.drawBuffersWEBGL()", "ext.drawBuffersWEBGL()")}}
  - : Định nghĩa các draw buffer mà tất cả màu fragment được ghi vào. (Khi dùng {{domxref("WebGL2RenderingContext", "WebGL2")}}, phương thức này có sẵn dưới dạng {{domxref("WebGL2RenderingContext.drawBuffers()", "gl.drawBuffers()")}} theo mặc định).

## Ví dụ

Kích hoạt tiện ích mở rộng:

```js
const ext = gl.getExtension("WEBGL_draw_buffers");
```

Gắn nhiều texture (vào mảng `tx[]`) vào các điểm gắn màu framebuffer khác nhau:

```js
const fb = gl.createFramebuffer();
gl.bindFramebuffer(gl.FRAMEBUFFER, fb);
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  ext.COLOR_ATTACHMENT0_WEBGL,
  gl.TEXTURE_2D,
  tx[0],
  0,
);
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  ext.COLOR_ATTACHMENT1_WEBGL,
  gl.TEXTURE_2D,
  tx[1],
  0,
);
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  ext.COLOR_ATTACHMENT2_WEBGL,
  gl.TEXTURE_2D,
  tx[2],
  0,
);
gl.framebufferTexture2D(
  gl.FRAMEBUFFER,
  ext.COLOR_ATTACHMENT3_WEBGL,
  gl.TEXTURE_2D,
  tx[3],
  0,
);
```

Ánh xạ các điểm gắn màu sang các slot draw buffer mà fragment shader sẽ ghi vào bằng `gl_FragData`:

```js
ext.drawBuffersWEBGL([
  ext.COLOR_ATTACHMENT0_WEBGL, // gl_FragData[0]
  ext.COLOR_ATTACHMENT1_WEBGL, // gl_FragData[1]
  ext.COLOR_ATTACHMENT2_WEBGL, // gl_FragData[2]
  ext.COLOR_ATTACHMENT3_WEBGL, // gl_FragData[3]
]);
```

Mã shader ghi vào nhiều texture:

```html
<script type="x-shader/x-fragment">
  #extension GL_EXT_draw_buffers : require

  precision highp float;

  void main(void) {
    gl_FragData[0] = vec4(0.25);
    gl_FragData[1] = vec4(0.5);
    gl_FragData[2] = vec4(0.75);
    gl_FragData[3] = vec4(1.0);
  }
</script>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGL2RenderingContext.drawBuffers()")}}
- [WebGL deferred shading - Mozilla Hacks blog](https://hacks.mozilla.org/2014/01/webgl-deferred-shading/)
