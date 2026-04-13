---
title: OES_standard_derivatives extension
short-title: OES_standard_derivatives
slug: Web/API/OES_standard_derivatives
page-type: webgl-extension
browser-compat: api.OES_standard_derivatives
---

{{APIRef("WebGL")}}

Phần mở rộng **`OES_standard_derivatives`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm các hàm đạo hàm GLSL `dFdx`, `dFdy` và `fwidth`.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định. Trong WebGL 2, hằng số có sẵn dưới dạng `gl.FRAGMENT_SHADER_DERIVATIVE_HINT` và yêu cầu GLSL `#version 300 es`.

## Hằng số

Phần mở rộng này hiển thị một hằng số mới, có thể được sử dụng trong các phương thức {{domxref("WebGLRenderingContext.hint()", "hint()")}} và {{domxref("WebGLRenderingContext.getParameter()", "getParameter()")}}.

- `ext.FRAGMENT_SHADER_DERIVATIVE_HINT_OES`
  - : Một {{domxref("WebGL_API.Types", "GLenum")}} cho biết độ chính xác của phép tính đạo hàm cho các hàm tích hợp GLSL: `dFdx`, `dFdy` và `fwidth`.

## Các hàm tích hợp GLSL

Các hàm mới sau có thể được sử dụng trong mã shader GLSL, nếu phần mở rộng này được bật:

```c
genType dFdx(genType p)
genType dFdy(genType p)
genType fwidth(genType p)
```

- `dFdx()`
  - : Trả về đạo hàm theo `x` bằng cách sử dụng phân biệt cục bộ cho đối số đầu vào `p`.
- `dFdy()`
  - : Trả về đạo hàm theo `y` bằng cách sử dụng phân biệt cục bộ cho đối số đầu vào `p`.
- `fwidth()`
  - : Trả về tổng của đạo hàm tuyệt đối theo `x` và `y` bằng cách sử dụng phân biệt cục bộ cho đối số đầu vào `p`. Tức là, `abs(dFdx(p)) + abs(dFdy(p))`.

## Ví dụ

Bật các phần mở rộng:

```js
gl.getExtension("OES_standard_derivatives");
gl.getExtension("EXT_shader_texture_lod");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("EXT_shader_texture_lod")}}
