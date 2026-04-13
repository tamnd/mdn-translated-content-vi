---
title: EXT_texture_norm16 extension
short-title: EXT_texture_norm16
slug: Web/API/EXT_texture_norm16
page-type: webgl-extension
browser-compat: api.EXT_texture_norm16
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_texture_norm16`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp một tập các định dạng được chuẩn hóa có dấu 16-bit và không dấu 16-bit mới (texture cố định dấu phẩy động, renderbuffer và texture buffer).

Khi phần mở rộng này được bật:

- Các phương thức {{domxref("WebGLRenderingContext.texImage2D()")}} và {{domxref("WebGLRenderingContext.texSubImage2D()")}} chấp nhận các định dạng mới được cung cấp bởi phần mở rộng này.
- Các kiểu cố định điểm nổi 16-bit được chuẩn hóa `ext.R16_EXT`, `ext.RG16_EXT` và `ext.RGBA16_EXT` trở thành các định dạng color-renderable và renderbuffer có thể được tạo ở các định dạng này.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGL2RenderingContext", "WebGL 2", "", 1)}}.

## Hằng số

- `ext.R16_EXT`: Định dạng red 16-bit unsigned. Color-renderable.
- `ext.RG16_EXT`: Định dạng RG 16-bit unsigned. Color-renderable.
- `ext.RGB16_EXT`: Định dạng RGB 16-bit unsigned.
- `ext.RGBA16_EXT`: Định dạng RGBA 16-bit unsigned. Color-renderable.
- `ext.R16_SNORM_EXT`: Định dạng red 16-bit signed normalized.
- `ext.RG16_SNORM_EXT`: Định dạng RG 16-bit signed normalized.
- `ext.RGB16_SNORM_EXT`: Định dạng RGB 16-bit signed normalized.
- `ext.RGBA16_SNORM_EXT`: Định dạng RGBA 16-bit signed normalized.

## Ví dụ

### Bật phần mở rộng

```js
let ext = gl.getExtension("EXT_texture_norm16");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
