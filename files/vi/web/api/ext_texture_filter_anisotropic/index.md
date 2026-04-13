---
title: EXT_texture_filter_anisotropic extension
short-title: EXT_texture_filter_anisotropic
slug: Web/API/EXT_texture_filter_anisotropic
page-type: webgl-extension
browser-compat: api.EXT_texture_filter_anisotropic
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_texture_filter_anisotropic`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp hai hằng số cho [lọc dị hướng (AF)](https://en.wikipedia.org/wiki/Anisotropic_filtering).

AF cải thiện chất lượng truy cập texture mipmapped khi xem primitive có texture ở góc nghiêng. Chỉ sử dụng mipmapping, các phép tra cứu này có xu hướng lấy trung bình ra màu xám.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này có sẵn cho cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

- `ext.MAX_TEXTURE_MAX_ANISOTROPY_EXT`
  - : Đây là tham số `pname` cho lời gọi {{domxref("WebGLRenderingContext.getParameter", "gl.getParameter()")}} và trả về mức độ dị hướng tối đa có sẵn.
- `ext.TEXTURE_MAX_ANISOTROPY_EXT`
  - : Đây là tham số `pname` cho các lời gọi {{domxref("WebGLRenderingContext.getTexParameter", "gl.getTexParameter()")}} và {{domxref("WebGLRenderingContext.texParameter", "gl.texParameterf()")}} / {{domxref("WebGLRenderingContext.texParameter", "gl.texParameteri()")}} và đặt độ dị hướng tối đa mong muốn cho một texture.

## Ví dụ

```js
const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);
const ext =
  gl.getExtension("EXT_texture_filter_anisotropic") ||
  gl.getExtension("MOZ_EXT_texture_filter_anisotropic") ||
  gl.getExtension("WEBKIT_EXT_texture_filter_anisotropic");
if (ext) {
  const max = gl.getParameter(ext.MAX_TEXTURE_MAX_ANISOTROPY_EXT);
  gl.texParameterf(gl.TEXTURE_2D, ext.TEXTURE_MAX_ANISOTROPY_EXT, max);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
