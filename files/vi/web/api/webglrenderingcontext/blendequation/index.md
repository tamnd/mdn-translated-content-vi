---
title: "WebGLRenderingContext: blendEquation() method"
short-title: blendEquation()
slug: Web/API/WebGLRenderingContext/blendEquation
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.blendEquation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.blendEquation()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) được sử dụng để thiết lập cả phương trình hòa trộn RGB và phương trình hòa trộn alpha thành một phương trình duy nhất.

Phương trình hoà trộn xác định cách một pixel mới được kết hợp với một pixel đã có trong {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
blendEquation(mode)
```

### Thông số

- `mode`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định cách kết hợp màu nguồn và màu đích.
Phải là:
    - `gl.FUNC_ADD`: nguồn + đích (giá trị mặc định)
    - `gl.FUNC_SUBTRACT`: nguồn – đích
    - `gl.FUNC_REVERSE_SUBTRACT`: đích – nguồn

Khi sử dụng phần mở rộng {{domxref("EXT_blend_minmax")}}:
    - `ext.MIN_EXT`: Nguồn và đích tối thiểu
    - `ext.MAX_EXT`: Nguồn và đích tối đa

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.MIN`: Nguồn và đích tối thiểu
    - `gl.MAX`: Nguồn và đích tối đa

### Ngoại lệ

Nếu _mode_ không phải là một trong ba giá trị có thể, lỗi `gl.INVALID_ENUM` sẽ được đưa ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Để thiết lập phương trình pha trộn, sử dụng:

```js
gl.blendEquation(gl.FUNC_ADD);
gl.blendEquation(gl.FUNC_SUBTRACT);
gl.blendEquation(gl.FUNC_REVERSE_SUBTRACT);
```

Để có được các phương trình hòa trộn, hãy truy vấn các hằng số `BLEND_EQUATION`, `BLEND_EQUATION_RGB` và `BLEND_EQUATION_ALPHA` trả về `gl.FUNC_ADD`, `gl.FUNC_SUBTRACT`, `gl.FUNC_REVERSE_SUBTRACT`, hoặc nếu {{domxref("EXT_blend_minmax")}} được bật: `ext.MIN_EXT` hoặc `ext.MAX_EXT`.

```js
gl.getParameter(gl.BLEND_EQUATION_RGB) === gl.FUNC_ADD;
// true

gl.getParameter(gl.BLEND_EQUATION_ALPHA) === gl.FUNC_ADD;
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.blendColor()")}}
- {{domxref("WebGLRenderingContext.blendFunc()")}}
- {{domxref("EXT_blend_minmax")}}
