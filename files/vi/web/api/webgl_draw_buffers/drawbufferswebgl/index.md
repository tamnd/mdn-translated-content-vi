---
title: "WEBGL_draw_buffers: phương thức drawBuffersWEBGL()"
short-title: drawBuffersWEBGL()
slug: Web/API/WEBGL_draw_buffers/drawBuffersWEBGL
page-type: webgl-extension-method
browser-compat: api.WEBGL_draw_buffers.drawBuffersWEBGL
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_draw_buffers.drawBuffersWEBGL()`** là một phần
của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép định nghĩa
các draw buffer mà tất cả màu fragment được ghi vào.

Phương thức này là một phần của tiện ích {{domxref("WEBGL_draw_buffers")}}.

> [!NOTE]
> Khi dùng {{domxref("WebGL2RenderingContext", "WebGL2")}},
> phương thức này khả dụng dưới dạng {{domxref("WebGL2RenderingContext.drawBuffers()", "gl.drawBuffers()")}}
> theo mặc định và các hằng số có tên `gl.COLOR_ATTACHMENT1` v.v. mà không có hậu tố "WEBGL".

## Cú pháp

```js-nolint
drawBuffersWEBGL(buffers)
```

### Tham số

- `buffers`
  - : Một {{jsxref("Array")}} các hằng số {{domxref("WebGL_API/Types", "GLenum")}} xác định các drawing buffer.
    Các giá trị có thể có:
    - `gl.NONE`: Fragment shader không được ghi vào color buffer nào.
    - `gl.BACK`: Fragment shader được ghi vào color buffer phía sau.
    - `ext.COLOR_ATTACHMENT0_WEBGL` Fragment shader được ghi vào color attachment thứ n của framebuffer.
    - `ext.COLOR_ATTACHMENT1_WEBGL`
    - `ext.COLOR_ATTACHMENT2_WEBGL`
    - `ext.COLOR_ATTACHMENT3_WEBGL`
    - `ext.COLOR_ATTACHMENT4_WEBGL`
    - `ext.COLOR_ATTACHMENT5_WEBGL`
    - `ext.COLOR_ATTACHMENT6_WEBGL`
    - `ext.COLOR_ATTACHMENT7_WEBGL`
    - `ext.COLOR_ATTACHMENT8_WEBGL`
    - `ext.COLOR_ATTACHMENT9_WEBGL`
    - `ext.COLOR_ATTACHMENT10_WEBGL`
    - `ext.COLOR_ATTACHMENT11_WEBGL`
    - `ext.COLOR_ATTACHMENT12_WEBGL`
    - `ext.COLOR_ATTACHMENT13_WEBGL`
    - `ext.COLOR_ATTACHMENT14_WEBGL`
    - `ext.COLOR_ATTACHMENT15_WEBGL`

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Xem {{domxref("WEBGL_draw_buffers")}} để biết thêm ngữ cảnh với đoạn code ví dụ này.

```js
ext.drawBuffersWEBGL([
  ext.COLOR_ATTACHMENT0_WEBGL, // gl_FragData[0]
  ext.COLOR_ATTACHMENT1_WEBGL, // gl_FragData[1]
  ext.COLOR_ATTACHMENT2_WEBGL, // gl_FragData[2]
  ext.COLOR_ATTACHMENT3_WEBGL, // gl_FragData[3]
]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WEBGL_draw_buffers")}}
- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.framebufferRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.framebufferTexture2D()")}}
- {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
- [WebGL deferred shading - Mozilla Hacks blog](https://hacks.mozilla.org/2014/01/webgl-deferred-shading/)
