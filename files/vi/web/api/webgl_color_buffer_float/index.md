---
title: Tiện ích WEBGL_color_buffer_float
short-title: WEBGL_color_buffer_float
slug: Web/API/WEBGL_color_buffer_float
page-type: webgl-extension
browser-compat: api.WEBGL_color_buffer_float
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_color_buffer_float`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và bổ sung khả năng render vào các color buffer dấu phẩy động 32-bit.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tiện ích này chỉ khả dụng với ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}. Đối với {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}}, dùng tiện ích {{domxref("EXT_color_buffer_float")}}.
>
> Tiện ích {{domxref("OES_texture_float")}} kích hoạt ngầm tiện ích này.

## Hằng số

- `ext.RGBA32F_EXT`
  - : Định dạng color-renderable RGBA dấu phẩy động 32-bit.
- `ext.RGB32F_EXT` ({{deprecated_inline}})
  - : Định dạng color-renderable RGB dấu phẩy động 32-bit.
- `ext.FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT`
  - : ?
- `ext.UNSIGNED_NORMALIZED_EXT`
  - : ?

## Phương thức mở rộng

Tiện ích này mở rộng {{domxref("WebGLRenderingContext.renderbufferStorage()")}}:

- Tham số `internalformat` hiện chấp nhận `ext.RGBA32F_EXT` và `ext.RGB32F_EXT` ({{deprecated_inline}}).

## Ví dụ

```js
const ext = gl.getExtension("WEBGL_color_buffer_float");

gl.renderbufferStorage(gl.RENDERBUFFER, ext.RGBA32F_EXT, 256, 256);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
- {{domxref("OES_texture_float")}}
