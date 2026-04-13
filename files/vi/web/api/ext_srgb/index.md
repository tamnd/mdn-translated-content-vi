---
title: EXT_sRGB extension
short-title: EXT_sRGB
slug: Web/API/EXT_sRGB
page-type: webgl-extension
browser-compat: api.EXT_sRGB
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_sRGB`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm hỗ trợ sRGB cho các texture và framebuffer object.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định. Các hằng số trong WebGL2 là: `gl.SRGB`, `gl.SRGB8`, `gl.SRGB8_ALPHA8` và `gl.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING`.

## Hằng số

Phần mở rộng này cung cấp các hằng số sau, có thể được sử dụng trong các phương thức {{domxref("WebGLRenderingContext.texImage2D()", "texImage2D()")}}, {{domxref("WebGLRenderingContext.texSubImage2D()", "texSubImage2D()")}}, {{domxref("WebGLRenderingContext.renderbufferStorage()", "renderbufferStorage()")}} và {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter()", "getFramebufferAttachmentParameter()")}}.

- `ext.SRGB_EXT`: Định dạng sRGB không có kích thước, để độ chính xác cho driver.
- `ext.SRGB_ALPHA_EXT`: Định dạng sRGB không có kích thước với thành phần alpha không có kích thước.
- `ext.SRGB8_ALPHA8_EXT`: Định dạng sRGB và alpha có kích thước (8-bit).
- `ext.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT`: Trả về mã hóa màu framebuffer (`gl.LINEAR` hoặc `ext.SRGB_EXT`).

## Ví dụ

```js
const ext = gl.getExtension("EXT_sRGB");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.texImage2D(
  gl.TEXTURE_2D,
  0,
  ext.SRGB_EXT,
  512,
  512,
  0,
  ext.SRGB_EXT,
  gl.UNSIGNED_BYTE,
  image,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
