---
title: EXT_color_buffer_float extension
short-title: EXT_color_buffer_float
slug: Web/API/EXT_color_buffer_float
page-type: webgl-extension
browser-compat: api.EXT_color_buffer_float
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_color_buffer_float`** là một phần của [WebGL](/en-US/docs/Web/API/WebGL_API) và thêm khả năng render các định dạng dấu phẩy động đa dạng.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}}.
>
> Đối với {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}, xem các phần mở rộng {{domxref("EXT_color_buffer_half_float")}} và {{domxref("WEBGL_color_buffer_float")}}.

## Phương thức mở rộng

Các định dạng có kích thước sau trở thành **color-renderable**:

- `gl.R16F`,
- `gl.RG16F`,
- `gl.RGBA16F`,
- `gl.R32F`,
- `gl.RG32F`,
- `gl.RGBA32F`,
- `gl.R11F_G11F_B10F`.

**Color-renderable** có nghĩa là:

- Phương thức {{domxref("WebGLRenderingContext.renderbufferStorage()")}} bây giờ chấp nhận các định dạng này.
- Framebuffers với texture được gắn kèm theo các định dạng này bây giờ có thể là **FRAMEBUFFER_COMPLETE**.

## Ví dụ

`gl` phải là {{domxref("WebGL2RenderingContext")}}. Phần mở rộng này không hoạt động trong các ngữ cảnh WebGL 1.

```js
const ext = gl.getExtension("EXT_color_buffer_float");

gl.renderbufferStorage(gl.RENDERBUFFER, gl.RGBA16F, 256, 256);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("EXT_color_buffer_half_float")}}
- {{domxref("WEBGL_color_buffer_float")}}
