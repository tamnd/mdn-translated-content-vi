---
title: EXT_color_buffer_half_float extension
short-title: EXT_color_buffer_half_float
slug: Web/API/EXT_color_buffer_half_float
page-type: webgl-extension
browser-compat: api.EXT_color_buffer_half_float
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_color_buffer_half_float`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm khả năng render vào các color buffer dấu phẩy động 16-bit.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này có sẵn cho cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}. Trên WebGL 2, đây là lựa chọn thay thế cho phần mở rộng {{domxref("EXT_color_buffer_float")}} trên các nền tảng hỗ trợ render target dấu phẩy động 16-bit nhưng không phải 32-bit.
>
> Phần mở rộng {{domxref("OES_texture_half_float")}} kích hoạt ngầm phần mở rộng này.

## Hằng số

- `ext.RGBA16F_EXT`: Định dạng RGBA dấu phẩy động 16-bit color-renderable.
- `ext.RGB16F_EXT`: Định dạng RGB dấu phẩy động 16-bit.
- `ext.FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE_EXT`: Được truyền vào {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter()")}} để lấy kiểu framebuffer.
- `ext.UNSIGNED_NORMALIZED_EXT`: Framebuffer chứa các thành phần cố định điểm nổi không dấu.

## Ví dụ

```js
const ext = gl.getExtension("EXT_color_buffer_half_float");

gl.renderbufferStorage(gl.RENDERBUFFER, ext.RGBA16F_EXT, 256, 256);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("EXT_color_buffer_float")}}
