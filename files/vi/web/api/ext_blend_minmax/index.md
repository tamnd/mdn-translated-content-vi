---
title: EXT_blend_minmax extension
short-title: EXT_blend_minmax
slug: Web/API/EXT_blend_minmax
page-type: webgl-extension
browser-compat: api.EXT_blend_minmax
---

{{APIRef("WebGL")}}

Phần mở rộng **`EXT_blend_minmax`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và mở rộng khả năng blending bằng cách thêm hai phương trình blend mới: giá trị nhỏ nhất hoặc lớn nhất của các thành phần màu nguồn và đích.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}.

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho các ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định. Các hằng số trong WebGL2 là `gl.MIN` và `gl.MAX`.

## Hằng số

Phần mở rộng này thêm hai hằng số mới, có thể được sử dụng trong {{domxref("WebGLRenderingContext.blendEquation()")}} và {{domxref("WebGLRenderingContext.blendEquationSeparate()")}}:

- `ext.MIN_EXT`: Tạo ra các thành phần màu nhỏ nhất của màu nguồn và đích.
- `ext.MAX_EXT`: Tạo ra các thành phần màu lớn nhất của màu nguồn và đích.

## Ví dụ

```js
const ext = gl.getExtension("EXT_blend_minmax");

gl.blendEquation(ext.MIN_EXT);
gl.blendEquation(ext.MAX_EXT);

gl.blendEquationSeparate(ext.MIN_EXT, ext.MAX_EXT);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.blendEquation()")}}
- {{domxref("WebGLRenderingContext.blendEquationSeparate()")}}
